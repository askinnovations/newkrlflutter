import 'package:flutter/material.dart';
import 'package:krl/usersideApp/homescreen/homescreen.dart';
import 'package:krl/usersideApp/notification/notification.dart';
import 'package:krl/usersideApp/orderscreen/myordersscreen.dart';
import 'package:krl/usersideApp/profilescreen/myprofile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl/utils/colors.dart';

class UserDashboardScreen extends StatefulWidget {
  @override
  _UserDashboardScreenState createState() => _UserDashboardScreenState();
}

class _UserDashboardScreenState extends State<UserDashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    MyHomeScreen(),
    MyOrderScreen(),
    NotificationScreen(),
    MyProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<IconData> icons = [
    Icons.home_rounded,
    Icons.list_alt_rounded,
    Icons.notifications_active_rounded,
    Icons.person_rounded,
  ];

  final List<String> labels = ['Home', 'Orders', 'Notification', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(icons.length, (index) {
              final isActive = index == _selectedIndex;
              return GestureDetector(
                onTap: () => _onItemTapped(index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color:
                        isActive
                            ? AppColors.btntheamColor.withOpacity(0.1)
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        icons[index],
                        color:
                            isActive
                                ? AppColors.btntheamColor
                                : Colors.grey.shade600,
                        size: 26,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        labels[index],
                        style: GoogleFonts.poppins(
                          fontSize: 11.5,
                          fontWeight: FontWeight.w500,
                          color:
                              isActive
                                  ? AppColors.btntheamColor
                                  : Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
