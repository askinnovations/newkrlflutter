// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:krl/commanwidgets/appbarcomma.dart';
// import 'package:krl/utils/colors.dart';
// import 'package:krl/utils/hieghtwidth.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

// class LRFormScreen extends StatefulWidget {
//   const LRFormScreen({super.key});

//   @override
//   State<LRFormScreen> createState() => _LRFormScreenState();
// }

// class _LRFormScreenState extends State<LRFormScreen> {
//   bool isConsignor = false;
//   bool isConsignee = false;
//   bool isPaid = false;
//   bool isToPay = false;
//   bool isToBeBilled = false;

//   final TextEditingController consignorController = TextEditingController();
//   final TextEditingController consigneeController = TextEditingController();
//   final TextEditingController addressController = TextEditingController();
//   final TextEditingController consignorGstController = TextEditingController();
//   final TextEditingController consigneeGstController = TextEditingController();
//   final TextEditingController packagesController = TextEditingController();
//   final TextEditingController packingMethodController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();
//   final TextEditingController actualWeightController = TextEditingController();
//   final TextEditingController chargedWeightController = TextEditingController();
//   final TextEditingController ewayBillController = TextEditingController();
//   final TextEditingController validUptoController = TextEditingController();
//   final TextEditingController declaredValueController = TextEditingController();
//   final TextEditingController lrDateController = TextEditingController();
//   final TextEditingController vehicleController = TextEditingController();
//   final TextEditingController vehicleTypeController = TextEditingController();
//   final TextEditingController deliveryModeController = TextEditingController();
//   final TextEditingController fromController = TextEditingController();
//   final TextEditingController toController = TextEditingController();
//   final TextEditingController freightController = TextEditingController();
//   final TextEditingController lrChargesController = TextEditingController();
//   final TextEditingController hamaliController = TextEditingController();
//   final TextEditingController otherChargesController = TextEditingController();
//   final TextEditingController gstController = TextEditingController();
//   final TextEditingController totalFreightController = TextEditingController();
//   final TextEditingController advanceController = TextEditingController();
//   final TextEditingController balanceFreightController =
//       TextEditingController();

//   Widget buildCheckbox(String title, bool value, Function(bool?) onChanged) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Checkbox(value: value, onChanged: onChanged),
//         Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
//       ],
//     );
//   }

//   TableRow tableRow(List<Widget> cells) {
//     return TableRow(
//       decoration: const BoxDecoration(color: Color(0xFFF8F8F8)),
//       children:
//           cells
//               .map(
//                 (cell) =>
//                     Padding(padding: const EdgeInsets.all(10), child: cell),
//               )
//               .toList(),
//     );
//   }

//   InputDecoration inputDecoration(String label) {
//     return InputDecoration(
//       labelText: label,
//       labelStyle: GoogleFonts.poppins(fontSize: 12),
//       border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//       isDense: true,
//       contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//     );
//   }

//   void generatePdf() async {
//     final pdf = pw.Document();

//     pdf.addPage(
//       pw.Page(
//         pageFormat: PdfPageFormat.a4,
//         build: (pw.Context context) {
//           return pw.Column(
//             crossAxisAlignment: pw.CrossAxisAlignment.start,
//             children: [
//               pw.Text(
//                 "KHANDELWAL ROADLINES",
//                 style: pw.TextStyle(
//                   fontSize: 20,
//                   fontWeight: pw.FontWeight.bold,
//                 ),
//               ),
//               pw.SizedBox(height: 10),
//               pw.Text("CONSIGNOR: ${consignorController.text}"),
//               pw.Text("Address: ${addressController.text}"),
//               pw.Text("Packages: ${packagesController.text}"),
//               pw.Text("Packing: ${packingMethodController.text}"),
//               pw.Text("Description: ${descriptionController.text}"),
//               pw.Text("Actual Weight: ${actualWeightController.text}"),
//               pw.Text("Charged Weight: ${chargedWeightController.text}"),
//               pw.Text("E-WAY BILL: ${ewayBillController.text}"),
//               pw.Text("VALID UPTO: ${validUptoController.text}"),
//               pw.Text("Declared Value: ${declaredValueController.text}"),
//               pw.SizedBox(height: 10),
//               pw.Text("L.R. Date: ${lrDateController.text}"),
//               pw.Text("Vehicle: ${vehicleController.text}"),
//               pw.Text("Vehicle Type: ${vehicleTypeController.text}"),
//               pw.Text("Delivery Mode: ${deliveryModeController.text}"),
//               pw.Text("From: ${fromController.text}"),
//               pw.Text("To: ${toController.text}"),
//               pw.SizedBox(height: 10),
//               pw.Text("Freight: ${freightController.text}"),
//               pw.Text("LR Charges: ${lrChargesController.text}"),
//               pw.Text("Hamali: ${hamaliController.text}"),
//               pw.Text("Other Charges: ${otherChargesController.text}"),
//               pw.Text("GST: ${gstController.text}"),
//               pw.Text("Total Freight: ${totalFreightController.text}"),
//               pw.Text("Less Advance: ${advanceController.text}"),
//               pw.Text("Balance Freight: ${balanceFreightController.text}"),
//             ],
//           );
//         },
//       ),
//     );

//     await Printing.layoutPdf(
//       onLayout: (PdfPageFormat format) async => pdf.save(),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(title: 'Lorry Receipt Form'),

//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: 
        
//         Card(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//           elevation: 4,
//           child: Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Center(
//                   child: Column(
//                     children: [
//                       Text(
//                         'KHANDELWAL ROADLINES',
//                         style: GoogleFonts.poppins(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.red,
//                         ),
//                       ),
//                       4.height,
//                       Text(
//                         'Subject to DEWAS Jurisdiction',
//                         style: GoogleFonts.poppins(
//                           color: Colors.blue,
//                           fontSize: 12,
//                         ),
//                       ),
//                       Text(
//                         'AT OWNER’S RISK',
//                         style: GoogleFonts.poppins(
//                           color: Colors.orange,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 16.height,
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Text(
//                         "GSTIN for EWAY Bill 23AABFM6400F1ZX",
//                         style: GoogleFonts.poppins(),
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     Expanded(
//                       child: Text(
//                         "PAN – AABFM6400F",
//                         style: GoogleFonts.poppins(),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const Divider(thickness: 1.5),
//                 Row(
//                   children: [
//                     buildCheckbox('Consignor', isConsignor, (val) {
//                       setState(() {
//                         isConsignor = true;
//                         isConsignee = false;
//                         consigneeController.text = "Consignor Name";
//                       });
//                     }),
//                     buildCheckbox('Consignee', isConsignee, (val) {
//                       setState(() {
//                         isConsignee = true;
//                         isConsignor = false;
//                         consigneeController.text = "Consignee Name";
//                       });
//                     }),
//                   ],
//                 ),

//                 Text(
//                   'We are registered as GTA under sec 9 (3) of GST act 2017... notification No. 13/2017 CTR dated 28/06/2017',
//                   style: GoogleFonts.poppins(fontSize: 12),
//                 ),
//                 const SizedBox(height: 10),
//                 Table(
//                   border: TableBorder.all(color: Colors.grey.shade300),
//                   columnWidths: const {
//                     0: FlexColumnWidth(1),
//                     1: FlexColumnWidth(1),
//                   },
//                   children: [
//                     tableRow([
//                       TextField(
//                         controller: consigneeController,
//                         decoration: inputDecoration('CONSIGNOR NAME'),
//                       ),
//                       TextField(
//                         controller: addressController,
//                         decoration: inputDecoration('ADDRESS'),
//                       ),
//                     ]),
//                     tableRow([
//                       TextField(
//                         controller: gstController,
//                         decoration: inputDecoration('GSTIN'),
//                       ),
//                       TextField(
//                         controller: gstController,
//                         decoration: inputDecoration('GSTIN'),
//                       ),
//                     ]),
//                     tableRow([
//                       TextField(
//                         controller: packagesController,
//                         decoration: inputDecoration('No. of Packages'),
//                       ),
//                       TextField(
//                         controller: packingMethodController,
//                         decoration: inputDecoration('Method of '),
//                       ),
//                     ]),
//                     tableRow([
//                       TextField(
//                         controller: descriptionController,
//                         decoration: inputDecoration('Descriptions'),
//                       ),

//                       Column(
//                         children: [
//                           TextField(
//                             controller: actualWeightController,
//                             decoration: inputDecoration('Actual Weight'),
//                           ),
//                           const SizedBox(height: 8),
//                           TextField(
//                             controller: chargedWeightController,
//                             decoration: inputDecoration('Charged Weight'),
//                           ),
//                         ],
//                       ),
//                     ]),
//                     tableRow([
//                       TextField(
//                         controller: ewayBillController,
//                         decoration: inputDecoration('E-WAY BILL NO.'),
//                       ),
//                       TextField(
//                         controller: validUptoController,
//                         decoration: inputDecoration('VALID UPTO'),
//                       ),
//                     ]),
//                     tableRow([
//                       TextField(
//                         controller: declaredValueController,
//                         decoration: inputDecoration('Declared Value Rs.'),
//                       ),
//                       const SizedBox(),
//                     ]),
//                   ],
//                 ),
//                 16.height,
//                 Table(
//                   border: TableBorder.all(color: Colors.grey.shade300),
//                   children: [
//                     tableRow([
//                       TextField(
//                         controller: lrDateController,
//                         decoration: inputDecoration('L.R. Dated'),
//                       ),
//                       TextField(
//                         controller: vehicleController,
//                         decoration: inputDecoration('Vehicle'),
//                       ),
//                     ]),
//                     tableRow([
//                       TextField(
//                         controller: vehicleTypeController,
//                         decoration: inputDecoration('Vehicle Type'),
//                       ),
//                       TextField(
//                         controller: deliveryModeController,
//                         decoration: inputDecoration('Delivery Mode'),
//                       ),
//                     ]),
//                     tableRow([
//                       TextField(
//                         controller: fromController,
//                         decoration: inputDecoration('From'),
//                       ),
//                       TextField(
//                         controller: toController,
//                         decoration: inputDecoration('To'),
//                       ),
//                     ]),
//                   ],
//                 ),
//                 const Divider(thickness: 1.5),
//                 Row(
//                   children: [
//                     buildCheckbox(
//                       'PAID',
//                       isPaid,
//                       (val) => setState(() {
//                         isPaid = val!;
//                         if (isPaid) {
//                           isToPay = false;
//                           isToBeBilled = false;
//                         }
//                       }),
//                     ),
//                     buildCheckbox(
//                       'TO PAY',
//                       isToPay,
//                       (val) => setState(() {
//                         isToPay = val!;
//                         if (isToPay) {
//                           isPaid = false;
//                           isToBeBilled = false;
//                         }
//                       }),
//                     ),
//                     buildCheckbox(
//                       'TO BE BILLED',
//                       isToBeBilled,
//                       (val) => setState(() {
//                         isToBeBilled = val!;
//                         if (isToBeBilled) {
//                           isPaid = false;
//                           isToPay = false;
//                         }
//                       }),
//                     ),
//                   ],
//                 ),

//                 Table(
//                   border: TableBorder.all(color: Colors.grey.shade300),
//                   children: [
//                     tableRow([
//                       TextField(
//                         controller: freightController,
//                         decoration: inputDecoration('Freight'),
//                       ),
//                       TextField(
//                         controller: lrChargesController,
//                         decoration: inputDecoration('LR Charges'),
//                       ),
//                     ]),
//                     tableRow([
//                       TextField(
//                         controller: hamaliController,
//                         decoration: inputDecoration('Hamali'),
//                       ),
//                       TextField(
//                         controller: otherChargesController,
//                         decoration: inputDecoration('Other Charges'),
//                       ),
//                     ]),
//                     tableRow([
//                       TextField(
//                         controller: gstController,
//                         decoration: inputDecoration('GST'),
//                       ),
//                       TextField(
//                         controller: totalFreightController,
//                         decoration: inputDecoration('Total Freight'),
//                       ),
//                     ]),
//                     tableRow([
//                       TextField(
//                         controller: advanceController,
//                         decoration: inputDecoration('Less Advance'),
//                       ),
//                       TextField(
//                         controller: balanceFreightController,
//                         decoration: inputDecoration('Balance Freight'),
//                       ),
//                     ]),
//                   ],
//                 ),
//                 20.height,
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: Text(
//                     'For: KHANDELWAL ROADLINES',
//                     style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 12.height,
//                 Center(
//                   child: ElevatedButton(
//                     onPressed: generatePdf,
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(
//                         vertical: 15,
//                         horizontal: 10,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       backgroundColor: AppColors.btntheamColor,
//                       textStyle: GoogleFonts.poppins(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                       ),
//                     ),
//                     child: const Text(
//                       'Generate PDF',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 12,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
     
     
     
//       ),
//     );
//   }
// }
