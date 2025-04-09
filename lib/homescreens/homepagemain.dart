import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl/commanwidgets/buttonscomman.dart';
import 'package:krl/utils/hieghtwidth.dart';
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
        title: Text(
          "Dashboard",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            child: Icon(Icons.person, color: Colors.black),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Consignment Booking",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: 8,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.85,
                  ),
                  itemBuilder: (context, index) {
                    final items = [
                      {'icon': LucideIcons.users, 'label': 'Customers'},
                      {'icon': LucideIcons.package, 'label': 'Parcels'},
                      {'icon': LucideIcons.truck, 'label': 'Fleet'},
                      {'icon': LucideIcons.mapPin, 'label': 'Locations'},
                      {'icon': LucideIcons.settings, 'label': 'Settings'},
                      {'icon': LucideIcons.barChart3, 'label': 'Analytics'},
                      {'icon': LucideIcons.wrench, 'label': 'Maintenance'},
                      {'icon': LucideIcons.userCheck, 'label': 'Staff'},
                    ];

                    return IconLabelCard(
                      icon: items[index]['icon'] as IconData,
                      label: items[index]['label'] as String,
                    );
                  },
                );
              },
            ),
            15.height,
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
