import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl/commanwidgets/appbarcomma.dart';

import '../../commanwidgets/buttonscomman.dart';

class OrderBookingScreen extends StatelessWidget {
  const OrderBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      appBar: CustomAppBar(title: 'Order Booking'),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionTitle("Customer Details"),
            buildTextField("Customer Name", Icons.person),
            buildTextField("Pickup Location", Icons.location_on),
            buildTextField("Delivery Location", Icons.location_on_outlined),
            const SizedBox(height: 20),

            sectionTitle("Consignment Info"),
            buildTextField("Consignor Name", Icons.account_circle),
            buildTextField("Consignee Name", Icons.account_circle_outlined),
            buildDropdown("Goods Type", [
              "Electronics",
              "Furniture",
              "Textiles",
            ], Icons.category),
            buildTextField("Quantity (Units)", Icons.numbers),
            buildTextField("Weight (kg)", Icons.scale),
            const SizedBox(height: 20),

            sectionTitle("Logistics"),
            buildDropdown("Vehicle Type", [
              "Truck",
              "Tempo",
              "Container",
            ], Icons.local_shipping),
            buildTextField("Freight Charges", Icons.currency_rupee),
            const SizedBox(height: 30),

            CommonNextButton(
              isEnabled: true,
              label: 'Submit Order',
              onPressed: () {
                // Get.offAll(DashBoard());
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: TextFormField(
        style: GoogleFonts.poppins(),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w500),
          prefixIcon: Icon(icon),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  Widget buildDropdown(String label, List<String> items, IconData icon) {
    String? selectedValue;
    return StatefulBuilder(
      builder: (context, setState) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: label,
              labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w500),
              prefixIcon: Icon(icon),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            value: selectedValue,
            icon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.blueAccent,
              size: 28,
            ),
            items:
                items
                    .map(
                      (item) =>
                          DropdownMenuItem(value: item, child: Text(item)),
                    )
                    .toList(),
            onChanged: (value) => setState(() => selectedValue = value),
          ),
        );
      },
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }
}
