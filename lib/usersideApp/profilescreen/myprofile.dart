import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl/usersideApp/passwordchange.dart';
import 'package:krl/usersideApp/profilescreen/editProfile.dart';
import 'package:krl/utils/colors.dart';
// import 'package:image_picker/image_picker.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: Text(
          "My Profile",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 45,
                            backgroundImage: const AssetImage(
                              'assets/images/logo.png',
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.btntheamColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                                padding: const EdgeInsets.all(6),
                                child: const Icon(
                                  Icons.edit,
                                  size: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "John Doe",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "johndoe@example.com",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            buildProfileOption(
              Icons.edit,
              "Edit Profile",
              onTapAction: () {
                Get.to(EditProfileScreen());
              },
            ),
            buildProfileOption(
              Icons.lock,
              "Change Password",
              onTapAction: () {
                Get.to(ChangePasswordScreen());
              },
            ),
            buildProfileOption(Icons.settings, "Settings", onTapAction: () {}),
            buildProfileOption(
              Icons.help_outline,
              "Help & Support",
              onTapAction: () {},
            ),
            buildProfileOption(
              Icons.logout,
              'Logout',
              isLogout: true,
              onTapAction: () {
                // _logout();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProfileOption(
    IconData icon,
    String title, {
    bool isLogout = false,
    required Function() onTapAction, // Accept a callback function
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isLogout ? AppColors.btntheamColor : AppColors.btntheamColor,
        ),
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: isLogout ? AppColors.btntheamColor : Colors.black,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: AppColors.btntheamColor,
        ),
        onTap: onTapAction, // Call the dynamic function when tapped
      ),
    );
  }
}
