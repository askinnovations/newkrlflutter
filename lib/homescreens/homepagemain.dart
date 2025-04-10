import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl/commanwidgets/buttonscomman.dart';
import 'package:krl/homescreens/bookingscreen/booking.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Image.asset('assets/images/logo.png', height: 35, width: 35),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            child: Icon(Icons.notification_add, color: Colors.black),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildGridSection(
              title: "Consignment Booking",
              items: [
                {
                  'icon': LucideIcons.clipboardList,
                  'label': 'Order Booking',
                  'onTap': () {
                    Get.to(OrderBookingScreen());
                  },
                },
                {'icon': LucideIcons.fileText, 'label': 'Consignment Notes'},
                {'icon': LucideIcons.truck, 'label': 'Freight Bill'},
              ],
              crossAxisCount: 3,
              aspectRatio: 1.1,
            ),

            buildGridSection(
              title: "Warehouse",
              items: [
                {'icon': LucideIcons.warehouse, 'label': 'Warehouse List'},
                {'icon': LucideIcons.box, 'label': 'Stock In'},
              ],
              crossAxisCount: 3,
              aspectRatio: 1.2,
            ),

            buildGridSection(
              title: "Accounts",
              items: [
                {'icon': LucideIcons.receipt, 'label': 'Voucher'},
                {'icon': LucideIcons.bookOpen, 'label': 'Ledgers'},
                {'icon': LucideIcons.arrowUpCircle, 'label': 'Acc.Receivable'},
                {'icon': LucideIcons.arrowDownCircle, 'label': 'Acc.Payable'},
                {'icon': LucideIcons.trendingUp, 'label': 'Profit/Loss'},
                {'icon': LucideIcons.scale, 'label': 'Balance/Sheet'},
                {'icon': LucideIcons.dollarSign, 'label': 'Cash Flow'},
                {'icon': LucideIcons.activity, 'label': 'Fund Flow'},
                {'icon': LucideIcons.percent, 'label': 'TDS'},
                {'icon': LucideIcons.fileBadge, 'label': 'GST'},
              ],
              crossAxisCount: 4,
              aspectRatio: 0.8,
            ),

            buildGridSection(
              title: "HR",
              items: [
                {'icon': LucideIcons.users, 'label': 'Employees'},
                {'icon': LucideIcons.userCog, 'label': 'Drivers'},
                {'icon': LucideIcons.calendarCheck, 'label': 'Attendance'},
                {'icon': LucideIcons.wallet, 'label': 'Payroll'},
              ],
              crossAxisCount: 4,
              aspectRatio: 0.8,
            ),

            buildGridSection(
              title: "Fleet",
              items: [
                {'icon': LucideIcons.bus, 'label': 'Vehicles'},
                {'icon': LucideIcons.wrench, 'label': 'Maintenance'},
                {'icon': LucideIcons.circleDashed, 'label': 'Tyres'},
              ],
              crossAxisCount: 3,
              aspectRatio: 1.2,
            ),

            buildGridSection(
              title: "Master",
              items: [
                {'icon': LucideIcons.userCheck, 'label': 'Customer'},
                {'icon': LucideIcons.hammer, 'label': 'Vendor'},
              ],
              crossAxisCount: 3,
              aspectRatio: 1.2,
            ),

            buildGridSection(
              title: "Reports",
              items: [
                {'icon': LucideIcons.fileSearch, 'label': 'Order Reports'},
                {'icon': LucideIcons.fileText, 'label': 'LR Report'},
                {
                  'icon': LucideIcons.fileBarChart,
                  'label': 'Freight Bill Report',
                },
              ],
              crossAxisCount: 3,
              aspectRatio: 1.2,
            ),

            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: const [
                DashboardCard(
                  title: 'Total Revenue',
                  value: '₹ 865.2k',
                  subtitle: '+₹20.9k Since last week',
                  icon: LucideIcons.trendingUp,
                  color: Colors.green,
                ),
                DashboardCard(
                  title: 'Completed Deliveries',
                  value: '6258',
                  subtitle: '-29 Deliveries Since last week',
                  icon: LucideIcons.truck,
                  color: Colors.red,
                ),
                DashboardCard(
                  title: 'Total Expenditure',
                  value: '₹ 4.32M',
                  subtitle: '+₹2.8k Since last week',
                  icon: LucideIcons.creditCard,
                  color: Colors.orange,
                ),
                DashboardCard(
                  title: 'Profit Margin',
                  value: '12.57%',
                  subtitle: '+2.95% Since last week',
                  icon: LucideIcons.percent,
                  color: Colors.blue,
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              "Fleet Dashboard",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: const [
                DashboardCard(
                  title: 'Vehicle RTO Registration',
                  value: '132',
                  subtitle: '+12 Since last month',
                  icon: LucideIcons.clipboardSignature,
                  color: Colors.purple,
                ),
                DashboardCard(
                  title: 'Active Notification',
                  value: '58',
                  subtitle: '+8 Since last week',
                  icon: LucideIcons.bell,
                  color: Colors.teal,
                ),
                DashboardCard(
                  title: 'Maintenance Cost',
                  value: '₹ 1.25M',
                  subtitle: '+₹200k Since last month',
                  icon: LucideIcons.wrench,
                  color: Colors.deepPurple,
                ),
                DashboardCard(
                  title: 'Tyre Replacement',
                  value: '32',
                  subtitle: '+5 Since last month',
                  icon: LucideIcons.settings,
                  color: Colors.indigo,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
