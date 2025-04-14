import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl/utils/colors.dart';

class AddOrderScreen extends StatefulWidget {
  const AddOrderScreen({super.key});

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  final _formKey = GlobalKey<FormState>();
  final _customerController = TextEditingController();
  final _gstController = TextEditingController();
  final _addressController = TextEditingController();
  DateTime? _pickupDate;
  String orderType = 'Regular';
  String orderStatus = 'Pending';

  @override
  void dispose() {
    _customerController.dispose();
    _gstController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _pickupDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        _pickupDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: Text(
          "Add New Order",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              buildTextField(
                controller: _customerController,
                label: "Customer Name",
                hint: "Enter customer name",
              ),
              const SizedBox(height: 20),

              // Pickup Date
              GestureDetector(
                onTap: _selectDate,
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Pickup Date",
                      hintText: "Select pickup date",
                      labelStyle: GoogleFonts.poppins(),
                      hintStyle: GoogleFonts.poppins(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    controller: TextEditingController(
                      text:
                          _pickupDate == null
                              ? ''
                              : "${_pickupDate!.day}/${_pickupDate!.month}/${_pickupDate!.year}",
                    ),
                    validator:
                        (value) =>
                            _pickupDate == null
                                ? 'Please select pickup date'
                                : null,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              buildTextField(
                controller: _gstController,
                label: "GST Number",
                hint: "Enter GST number",
              ),
              const SizedBox(height: 20),

              buildTextField(
                controller: _addressController,
                label: "Customer Address",
                hint: "Enter address",
              ),
              const SizedBox(height: 20),

              // Order Type Dropdown
              DropdownButtonFormField<String>(
                value: orderType,
                decoration: _dropdownDecoration("Order Type"),
                items:
                    ['Regular', 'Express', 'Bulk'].map((type) {
                      return DropdownMenuItem(
                        value: type,
                        child: Text(type, style: GoogleFonts.poppins()),
                      );
                    }).toList(),
                onChanged: (value) {
                  setState(() {
                    orderType = value!;
                  });
                },
              ),
              const SizedBox(height: 20),

              // Order Status Dropdown
              DropdownButtonFormField<String>(
                value: orderStatus,
                decoration: _dropdownDecoration("Order Status"),
                items:
                    ['Pending', 'Shipped', 'Delivered'].map((status) {
                      return DropdownMenuItem(
                        value: status,
                        child: Text(status, style: GoogleFonts.poppins()),
                      );
                    }).toList(),
                onChanged: (value) {
                  setState(() {
                    orderStatus = value!;
                  });
                },
              ),
              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context, {
                        'customer': _customerController.text,
                        'pickupDate': _pickupDate.toString(),
                        'gst': _gstController.text,
                        'address': _addressController.text,
                        'orderType': orderType,
                        'status': orderStatus,
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.btntheamColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 5,
                  ),
                  child: Text(
                    "Submit Order",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: GoogleFonts.poppins(),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: GoogleFonts.poppins(),
        hintStyle: GoogleFonts.poppins(color: Colors.grey),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: Colors.white,
      ),
      validator:
          (value) =>
              value == null || value.isEmpty ? 'Please enter $label' : null,
    );
  }

  InputDecoration _dropdownDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: GoogleFonts.poppins(),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      filled: true,
      fillColor: Colors.white,
    );
  }
}
