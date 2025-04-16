import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl/commanwidgets/appbarcomma.dart';

class LRDetailViewScreen extends StatelessWidget {
  final Map<String, dynamic> lrData;

  const LRDetailViewScreen({super.key, required this.lrData});

  Widget _buildTextCell(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(value, style: GoogleFonts.poppins()),
      ],
    );
  }

  TableRow viewTableRow(List<Widget> children) {
    return TableRow(
      children:
          children.map((widget) {
            return Padding(padding: const EdgeInsets.all(8.0), child: widget);
          }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "LR Details"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Text(
                        'KHANDELWAL ROADLINES',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Subject to DEWAS Jurisdiction',
                        style: GoogleFonts.poppins(
                          color: Colors.blue,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'AT OWNER’S RISK',
                        style: GoogleFonts.poppins(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "GSTIN for EWAY Bill 23AABFM6400F1ZX",
                        style: GoogleFonts.poppins(),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "PAN – AABFM6400F",
                        style: GoogleFonts.poppins(),
                      ),
                    ),
                  ],
                ),
                const Divider(thickness: 1.5),
                Text(
                  'We are registered as GTA under sec 9 (3)...',
                  style: GoogleFonts.poppins(fontSize: 12),
                ),
                const SizedBox(height: 10),
                Table(
                  border: TableBorder.all(color: Colors.grey.shade300),
                  children: [
                    viewTableRow([
                      _buildTextCell(
                        'CONSIGNOR NAME',
                        lrData['consignorName'] ?? '',
                      ),
                      _buildTextCell('ADDRESS', lrData['address'] ?? ''),
                    ]),
                    viewTableRow([
                      _buildTextCell('GSTIN', lrData['gstin1'] ?? ''),
                      _buildTextCell('GSTIN', lrData['gstin2'] ?? ''),
                    ]),
                    viewTableRow([
                      _buildTextCell(
                        'No. of Packages',
                        lrData['noOfPackages'] ?? '',
                      ),
                      _buildTextCell(
                        'Method of Packing',
                        lrData['packingMethod'] ?? '',
                      ),
                    ]),
                    viewTableRow([
                      _buildTextCell(
                        'Descriptions',
                        lrData['descriptions'] ?? '',
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTextCell(
                            'Actual Weight',
                            lrData['actualWeight'] ?? '',
                          ),
                          const SizedBox(height: 8),
                          _buildTextCell(
                            'Charged Weight',
                            lrData['chargedWeight'] ?? '',
                          ),
                        ],
                      ),
                    ]),
                    viewTableRow([
                      _buildTextCell(
                        'E-WAY BILL NO.',
                        lrData['ewayBill'] ?? '',
                      ),
                      _buildTextCell('VALID UPTO', lrData['validUpto'] ?? ''),
                    ]),
                    viewTableRow([
                      _buildTextCell(
                        'Declared Value Rs.',
                        lrData['declaredValue'] ?? '',
                      ),
                      const SizedBox(),
                    ]),
                  ],
                ),
                const SizedBox(height: 16),
                Table(
                  border: TableBorder.all(color: Colors.grey.shade300),
                  children: [
                    viewTableRow([
                      _buildTextCell('L.R. Dated', lrData['lrDate'] ?? ''),
                      _buildTextCell('Vehicle', lrData['vehicle'] ?? ''),
                    ]),
                    viewTableRow([
                      _buildTextCell(
                        'Vehicle Type',
                        lrData['vehicleType'] ?? '',
                      ),
                      _buildTextCell(
                        'Delivery Mode',
                        lrData['deliveryMode'] ?? '',
                      ),
                    ]),
                    viewTableRow([
                      _buildTextCell('From', lrData['from'] ?? ''),
                      _buildTextCell('To', lrData['to'] ?? ''),
                    ]),
                  ],
                ),
                const Divider(thickness: 1.5),
                Row(
                  children: [
                    if (lrData['freightType'] == 'PAID')
                      Text(
                        "✔ PAID",
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                    if (lrData['freightType'] == 'TO PAY')
                      Text(
                        "✔ TO PAY",
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                    if (lrData['freightType'] == 'TO BE BILLED')
                      Text(
                        "✔ TO BE BILLED",
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                  ],
                ),
                Table(
                  border: TableBorder.all(color: Colors.grey.shade300),
                  children: [
                    viewTableRow([
                      _buildTextCell('Freight', lrData['freight'] ?? ''),
                      _buildTextCell('LR Charges', lrData['lrCharges'] ?? ''),
                    ]),
                    viewTableRow([
                      _buildTextCell('Hamali', lrData['hamali'] ?? ''),
                      _buildTextCell(
                        'Other Charges',
                        lrData['otherCharges'] ?? '',
                      ),
                    ]),
                    viewTableRow([
                      _buildTextCell('GST', lrData['gst'] ?? ''),
                      _buildTextCell(
                        'Total Freight',
                        lrData['totalFreight'] ?? '',
                      ),
                    ]),
                    viewTableRow([
                      _buildTextCell('Less Advance', lrData['advance'] ?? ''),
                      _buildTextCell(
                        'Balance Freight',
                        lrData['balanceFreight'] ?? '',
                      ),
                    ]),
                  ],
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'For: KHANDELWAL ROADLINES',
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
