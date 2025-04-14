import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl/usersideApp/homescreen/addorder.dart';
import 'package:krl/usersideApp/orderscreen/orderdetails.dart';
import 'package:krl/utils/colors.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  List<Map<String, dynamic>> recentOrders = [
    {'id': 1003, 'status': 'Delivered'},
    {'id': 1002, 'status': 'Shipped'},
    {'id': 1001, 'status': 'Pending'},
  ];

  Color getStatusColor(String status) {
    switch (status) {
      case 'Delivered':
        return Colors.green;
      case 'Shipped':
        return Colors.blueAccent;
      case 'Pending':
      default:
        return Colors.orange;
    }
  }

  final List<Map<String, dynamic>> dashboardStats = [
    {'title': 'Total Orders', 'value': '152', 'color': Colors.blueAccent},
    {'title': 'Pending LR', 'value': '12', 'color': Colors.orange},
    {'title': 'Freight Bills', 'value': '45', 'color': Colors.purple},
    {'title': 'Invoices', 'value': '38', 'color': Colors.teal},
    // {'title': 'Delivered', 'value': '70', 'color': Colors.green},
    // {'title': 'Cancelled', 'value': '5', 'color': Colors.redAccent},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: Text(
          "Dashboard",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: dashboardStats.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.6,
              ),
              itemBuilder: (context, index) {
                final stat = dashboardStats[index];
                return Container(
                  decoration: BoxDecoration(
                    color: stat['color'].withOpacity(0.1),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        stat['title'],
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: stat['color'],
                        ),
                      ),
                      const Spacer(),
                      Text(
                        stat['value'],
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: stat['color'],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 30),
            Text(
              "Recent Orders",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: recentOrders.length > 4 ? 4 : recentOrders.length,

              itemBuilder: (context, index) {
                final order = recentOrders[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(() => OrderDetailScreen(order: order));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12.withOpacity(0.1),
                          blurRadius: 12,
                          spreadRadius: 2,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Order #${order['id']}",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.black87,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: getStatusColor(
                                  order['status'],
                                ).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                "${order['status']}",
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: getStatusColor(order['status']),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        if (order['customer'] != null)
                          _buildOrderDetailRow("Customer", order['customer']),

                        if (order['address'] != null)
                          _buildOrderDetailRow("Address", order['address']),

                        if (order['pickupDate'] != null)
                          _buildOrderDetailRow(
                            "Pickup Date",
                            order['pickupDate'],
                          ),

                        if (order['orderType'] != null)
                          _buildOrderDetailRow(
                            "Order Type",
                            order['orderType'],
                          ),

                        if (order['gst'] != null &&
                            order['gst'].toString().isNotEmpty)
                          _buildOrderDetailRow("GST", order['gst']),

                        const Divider(
                          height: 24,
                          thickness: 1,
                          color: Colors.black12,
                        ),

                        GestureDetector(
                          onTap: () {
                            // handle tap
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Request LR",
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 14,
                                color: Colors.blueAccent,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddOrderScreen()),
          );

          if (result != null && result is Map<String, dynamic>) {
            setState(() {
              recentOrders.insert(0, {
                'id': recentOrders.first['id'] + 1,
                'status': result['status'],
                'customer': result['customer'],
                'pickupDate': result['pickupDate'],
                'gst': result['gst'],
                'address': result['address'],
                'orderType': result['orderType'],
              });

              // Only keep latest 6 orders
              if (recentOrders.length > 6) {
                recentOrders = recentOrders.sublist(0, 6);
              }
            });
          }
        },
        label: Text(
          "Add Order",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        icon: const Icon(Icons.add, color: Colors.white),
        backgroundColor: AppColors.btntheamColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _buildOrderDetailRow(String label, dynamic value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label: ",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
          Expanded(
            child: Text(
              "$value",
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
