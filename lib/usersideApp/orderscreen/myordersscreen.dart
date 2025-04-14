import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl/commanwidgets/buttonscomman.dart';
import 'package:krl/usersideApp/orderscreen/orderdetails.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  final List<Map<String, dynamic>> orders = [
    {'id': 2001, 'date': '2025-04-10', 'status': 'Pending'},
    {'id': 2002, 'date': '2025-04-08', 'status': 'Shipped'},
    {'id': 2003, 'date': '2025-04-06', 'status': 'Delivered'},
    {'id': 2004, 'date': '2025-04-05', 'status': 'Cancelled'},
    {'id': 2004, 'date': '2025-04-05', 'status': 'Shipped'},
    {'id': 2004, 'date': '2025-04-05', 'status': 'Cancelled'},
    {'id': 2004, 'date': '2025-04-05', 'status': 'Cancelled'},
    {'id': 2004, 'date': '2025-04-05', 'status': 'Cancelled'},
    {'id': 2004, 'date': '2025-04-05', 'status': 'Delivered'},
    {'id': 2004, 'date': '2025-04-05', 'status': 'Pending'},
    {'id': 2004, 'date': '2025-04-05', 'status': 'Cancelled'},
  ];

  int selectedOrderIndex = 0;

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

  @override
  Widget build(BuildContext context) {
    final selectedOrder = orders[selectedOrderIndex];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: Text(
          "My Orders",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ...List.generate(orders.length, (index) {
            final order = orders[index];
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedOrderIndex = index;
                });
                Get.to(() => OrderDetailScreen(order: order));
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => OrderDetailScreen(order: order),
                //   ),
                // );
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color:
                      selectedOrderIndex == index
                          ? Colors.blue.shade50
                          : Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color:
                        selectedOrderIndex == index
                            ? Colors.blueAccent
                            : Colors.transparent,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.04),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order #${order['id']}",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Date: ${order['date']}",
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: getStatusColor(order['status']).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        order['status'],
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: getStatusColor(order['status']),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
