import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl/usersideApp/orderscreen/detailsLR.dart';
import 'package:krl/utils/colors.dart';
import 'package:krl/utils/hieghtwidth.dart';
import 'package:krl/utils/snackBar.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class OrderDetailScreen extends StatefulWidget {
  final Map<String, dynamic> order;

  const OrderDetailScreen({super.key, required this.order});

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  bool showFreightForm = false;
  bool showLRForm = true;
  List<int> lrForms = [0, 1];
  int? activeLRIndex = 0;

  bool isConsignor = false;
  bool isConsignee = false;
  bool isPaid = false;
  bool isToPay = false;
  bool isToBeBilled = false;

  final TextEditingController consignorController = TextEditingController();
  final TextEditingController consigneeController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController consignorGstController = TextEditingController();
  final TextEditingController consigneeGstController = TextEditingController();
  final TextEditingController packagesController = TextEditingController();
  final TextEditingController packingMethodController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController actualWeightController = TextEditingController();
  final TextEditingController chargedWeightController = TextEditingController();
  final TextEditingController ewayBillController = TextEditingController();
  final TextEditingController validUptoController = TextEditingController();
  final TextEditingController declaredValueController = TextEditingController();
  final TextEditingController lrDateController = TextEditingController();
  final TextEditingController vehicleController = TextEditingController();
  final TextEditingController vehicleTypeController = TextEditingController();
  final TextEditingController deliveryModeController = TextEditingController();
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  final TextEditingController freightController = TextEditingController();
  final TextEditingController lrChargesController = TextEditingController();
  final TextEditingController hamaliController = TextEditingController();
  final TextEditingController otherChargesController = TextEditingController();
  final TextEditingController gstController = TextEditingController();
  final TextEditingController totalFreightController = TextEditingController();
  final TextEditingController advanceController = TextEditingController();
  final TextEditingController balanceFreightController =
      TextEditingController();
  @override
  void initState() {
    super.initState();
    lrForms = [0, 1]; // show 2 LR by default
    activeLRIndex = 0; // if you want L/R 1 expanded initially
  }

  Widget buildCheckbox(String title, bool value, Function(bool?) onChanged) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(value: value, onChanged: onChanged),
        Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
      ],
    );
  }

  TableRow tableRow(List<Widget> cells) {
    return TableRow(
      decoration: const BoxDecoration(color: Color(0xFFF8F8F8)),
      children:
          cells
              .map(
                (cell) =>
                    Padding(padding: const EdgeInsets.all(10), child: cell),
              )
              .toList(),
    );
  }

  InputDecoration inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: GoogleFonts.poppins(fontSize: 12),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    );
  }

  void generatePdf() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                "KHANDELWAL ROADLINES",
                style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 10),
              pw.Text("CONSIGNOR: ${consignorController.text}"),
              pw.Text("Address: ${addressController.text}"),
              pw.Text("Packages: ${packagesController.text}"),
              pw.Text("Packing: ${packingMethodController.text}"),
              pw.Text("Description: ${descriptionController.text}"),
              pw.Text("Actual Weight: ${actualWeightController.text}"),
              pw.Text("Charged Weight: ${chargedWeightController.text}"),
              pw.Text("E-WAY BILL: ${ewayBillController.text}"),
              pw.Text("VALID UPTO: ${validUptoController.text}"),
              pw.Text("Declared Value: ${declaredValueController.text}"),
              pw.SizedBox(height: 10),
              pw.Text("L.R. Date: ${lrDateController.text}"),
              pw.Text("Vehicle: ${vehicleController.text}"),
              pw.Text("Vehicle Type: ${vehicleTypeController.text}"),
              pw.Text("Delivery Mode: ${deliveryModeController.text}"),
              pw.Text("From: ${fromController.text}"),
              pw.Text("To: ${toController.text}"),
              pw.SizedBox(height: 10),
              pw.Text("Freight: ${freightController.text}"),
              pw.Text("LR Charges: ${lrChargesController.text}"),
              pw.Text("Hamali: ${hamaliController.text}"),
              pw.Text("Other Charges: ${otherChargesController.text}"),
              pw.Text("GST: ${gstController.text}"),
              pw.Text("Total Freight: ${totalFreightController.text}"),
              pw.Text("Less Advance: ${advanceController.text}"),
              pw.Text("Balance Freight: ${balanceFreightController.text}"),
            ],
          );
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'Delivered':
        return Colors.green;
      case 'Shipped':
        return Colors.blue;
      case 'Pending':
        return Colors.orange;
      case 'Cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Map<String, String> getLrData(int index) {
    return {
      "Consignor Name": consigneeController.text,
      "Address": addressController.text,
      "GSTIN": gstController.text,
      "From": fromController.text,
      "To": toController.text,
      "Freight": freightController.text,
      "Hamali": hamaliController.text,
      "Other Charges": otherChargesController.text,
      "Total Freight": totalFreightController.text,
      "Balance Freight": balanceFreightController.text,
      // Add more fields as needed
    };
  }

  @override
  Widget build(BuildContext context) {
    final order = widget.order;

    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F7),
      appBar: AppBar(
        title: Text(
          "Order Details",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildOrderCard(order),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: AppColors.btntheamColor,
                  elevation: 2,
                ),
                onPressed: () {
                  // CustomSnackbar.show(
                  //   title: "Success",
                  //   message: "L/R Request Sent Successfully!",
                  // );
                },
                label: Text(
                  " L/R",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: AppColors.btntheamColor,
                  elevation: 2,
                ),
                onPressed: () {
                  CustomSnackbar.show(
                    title: "Success",
                    message: "L/R Request Sent Successfully!",
                  );
                  // setState(() {
                  //   lrForms.add(lrForms.length);
                  //   activeLRIndex = lrForms.length - 1;
                  // });
                },
                icon: const Icon(Icons.add, size: 20, color: Colors.white),
                label: Text(
                  "Request LR",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (showLRForm)
            Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: lrForms.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12.withOpacity(0.05),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "L/R ${index + 1}",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  activeLRIndex == index
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                ),
                                onPressed: () {
                                  setState(() {
                                    activeLRIndex =
                                        activeLRIndex == index ? null : index;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),

                        if (activeLRIndex == index)
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "KHANDELWAL ROADLINES",
                                      style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "Subject to DEWAS Jurisdiction • AT OWNER’S RISK",
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                    const Divider(thickness: 1.2),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "Consignor: John Doe",
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            "From: India → To: America",
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "No. of Packages: 10",
                                            style: GoogleFonts.poppins(),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            "Packing Method: Boxed",
                                            style: GoogleFonts.poppins(),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "Freight: ₹250",
                                            style: GoogleFonts.poppins(),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            "Total: ₹395",
                                            style: GoogleFonts.poppins(),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder:
                                                  (_) => LRDetailViewScreen(
                                                    lrData: {
                                                      "consignorName":
                                                          "John Doe",
                                                      "address":
                                                          "123 Main Street, India",
                                                      "gstin1":
                                                          "23AABFM6400F1ZX",
                                                      "gstin2":
                                                          "23AABFM6400F1ZX",
                                                      "noOfPackages": "10",
                                                      "packingMethod": "Boxed",
                                                      "descriptions":
                                                          "Electronic Goods",
                                                      "actualWeight": "100kg",
                                                      "chargedWeight": "110kg",
                                                      "ewayBill": "EWB123456",
                                                      "validUpto":
                                                          "20-Apr-2025",
                                                      "declaredValue": "50000",
                                                      "lrDate": "14-Apr-2025",
                                                      "vehicle": "MP09AB1234",
                                                      "vehicleType": "Truck",
                                                      "deliveryMode": "By Road",
                                                      "from": "India",
                                                      "to": "America",
                                                      "freightType": "PAID",
                                                      "freight": "250",
                                                      "lrCharges": "50",
                                                      "hamali": "30",
                                                      "otherCharges": "20",
                                                      "gst": "45",
                                                      "totalFreight": "395",
                                                      "advance": "100",
                                                      "balanceFreight": "295",
                                                    },
                                                  ),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          "View More",
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ],
            ),

          const SizedBox(height: 24),
          Text(
            "Billing Summary",
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          _buildBillingSummary(),

          if (showFreightForm) _buildFreightForm(),
        ],
      ),
    );
  }

  Widget _buildOrderCard(Map<String, dynamic> order) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Order ID: #${order['id']}",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "Date: ${order['date']}",
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                "Status: ",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: getStatusColor(order['status']).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  order['status'],
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: getStatusColor(order['status']),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBillingSummary() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.btntheamColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Text(
            "Freight Bill",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),

        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: AppColors.btntheamColor,
            elevation: 2,
          ),
          onPressed: () {
            setState(() {
              showFreightForm = !showFreightForm;
            });
            CustomSnackbar.show(
              title: "Success",
              message: "Freight Request Sent Successfully!",
            );
          },
          icon: const Icon(Icons.add, size: 20, color: Colors.white),
          label: Text(
            "Request Freight",
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFreightForm() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _topFields(),
          const SizedBox(height: 8),
          _buildTableHeader(),
          _buildTableRow(),
          _buildTableRow(),
          const SizedBox(height: 8),
          _buildTotalSummary(),
        ],
      ),
    );
  }

  Widget _topFields() {
    return Column(
      children: [
        Row(children: [_fieldBox("BILL TO"), _fieldBox("CONSIGNMENT SENT TO")]),
        Row(children: [_fieldBox("FREIGHT BILL NO."), _fieldBox("DATE")]),
        Row(children: [_fieldBox("FROM"), _fieldBox("TO")]),
      ],
    );
  }

  Widget _fieldBox(String label) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(border: Border.all(color: Colors.black26)),
        child: Text(label, style: const TextStyle(fontSize: 12)),
      ),
    );
  }

  Widget _buildTableHeader() {
    final headers = [
      "S.NO.",
      "LR NO.",
      "LR DATE",
      "PARTICULARS",
      "FREIGHT TYPE",
      "WEIGHT",
      "RATE",
      "AMOUNT",
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Table(
        defaultColumnWidth: const FixedColumnWidth(100),
        border: TableBorder.all(color: Colors.black26),
        children: [
          TableRow(
            decoration: BoxDecoration(color: Colors.grey.shade200),
            children:
                headers
                    .map(
                      (h) => Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          h,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTableRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Table(
        defaultColumnWidth: const FixedColumnWidth(100),
        border: TableBorder.all(color: Colors.black26),
        children: [
          TableRow(
            children: List.generate(8, (index) {
              return Padding(
                padding: const EdgeInsets.all(4),
                child: TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: '-',
                  ),
                  style: const TextStyle(fontSize: 12),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Divider(),
        _billingSummaryText("TOTAL", "₹1200"),
        _billingSummaryText("IGST @ 12%", "₹144"),
        _billingSummaryText("CGST @ 6%", "₹72"),
        _billingSummaryText("SGST @ 6%", "₹72"),
        const Divider(),
        _billingSummaryText("GRAND TOTAL", "₹1488", isBold: true),
      ],
    );
  }

  Widget _billingSummaryText(
    String title,
    String value, {
    bool isBold = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
