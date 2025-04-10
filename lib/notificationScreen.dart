import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl/utils/colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: AppColors.btntheamColor,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            buildNotificationTile(
              icon: Icons.check_circle_outline,
              title: "Task Completed",
              message: "Your task 'UI Design' has been marked as completed.",
              time: "Just now",
              iconColor: Colors.green,
            ),
            buildNotificationTile(
              icon: Icons.schedule_outlined,
              title: "Meeting Reminder",
              message: "You have a meeting scheduled at 3:00 PM today.",
              time: "15 mins ago",
              iconColor: Colors.orange,
            ),
            buildNotificationTile(
              icon: Icons.update,
              title: "App Update Available",
              message: "New version 2.0.1 is available. Update now!",
              time: "1 hour ago",
              iconColor: Colors.blue,
            ),
            buildNotificationTile(
              icon: Icons.info_outline,
              title: "New Feature",
              message: "Check out our latest feature: Dark Mode 🌙",
              time: "Yesterday",
              iconColor: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNotificationTile({
    required IconData icon,
    required String title,
    required String message,
    required String time,
    required Color iconColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: iconColor.withOpacity(0.1),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  time,
                  style: GoogleFonts.poppins(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
