import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl/homescreens/homepagemain.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    Center(child: Text('Orders')),
    Center(child: Text('Profile')),
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
            children: List.generate(3, (index) {
              IconData icon;
              String label;

              switch (index) {
                case 0:
                  icon = Icons.home_outlined;
                  label = "Home";
                  break;
                case 1:
                  icon = Icons.receipt_long_outlined;
                  label = "Orders";
                  break;
                case 2:
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
                        color: isSelected ? Colors.blue : Colors.grey.shade600,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        label,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight:
                              isSelected ? FontWeight.w600 : FontWeight.w400,
                          color:
                              isSelected ? Colors.blue : Colors.grey.shade600,
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
