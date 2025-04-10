import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl/homescreens/homepagemain.dart';
import 'package:krl/mytask/mytask.dart';
import 'package:krl/notificationScreen.dart';
import 'package:krl/profileScreens/profilemain.dart';
import 'package:krl/utils/colors.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    MyTasksScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.95),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black12.withOpacity(0.08),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(4, (index) {
              IconData icon;
              String label;

              switch (index) {
                case 0:
                  icon = Icons.home_outlined;
                  label = "Home";
                  break;
                case 1:
                  icon = Icons.task;
                  label = "My Task";
                  break;
                case 2:
                  icon = Icons.notification_add_outlined;
                  label = "Notifications";
                  break;
                case 3:
                default:
                  icon = Icons.person_outline;
                  label = "Profile";
              }

              bool isSelected = _selectedIndex == index;

              return GestureDetector(
                onTap: () => _onItemTapped(index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color:
                        isSelected ? Colors.blue.shade50 : Colors.transparent,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        icon,
                        color:
                            isSelected
                                ? AppColors.btntheamColor
                                : Colors.grey.shade600,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        label,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight:
                              isSelected ? FontWeight.w600 : FontWeight.w400,
                          color:
                              isSelected
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
