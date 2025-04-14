import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Map<String, dynamic>> notifications = [
    {
      'title': 'Order #1023 Delivered',
      'subtitle': 'Your order has been successfully delivered.',
      'time': DateTime.now().subtract(const Duration(minutes: 10)),
      'type': 'success',
    },
    {
      'title': 'New Freight Bill Generated',
      'subtitle': 'Freight bill #FB204 has been generated.',
      'time': DateTime.now().subtract(const Duration(hours: 2)),
      'type': 'info',
    },
    {
      'title': 'Pending LR Reminder',
      'subtitle': 'You have 5 pending Lorry Receipts.',
      'time': DateTime.now().subtract(const Duration(days: 1)),
      'type': 'warning',
    },
    {
      'title': 'Order Cancelled',
      'subtitle': 'Order #1019 was cancelled by customer.',
      'time': DateTime.now().subtract(const Duration(days: 2)),
      'type': 'danger',
    },
  ];

  IconData getIcon(String type) {
    switch (type) {
      case 'success':
        return Icons.check_circle_outline;
      case 'info':
        return Icons.info_outline;
      case 'warning':
        return Icons.warning_amber_rounded;
      case 'danger':
        return Icons.cancel_outlined;
      default:
        return Icons.notifications;
    }
  }

  Color getColor(String type) {
    switch (type) {
      case 'success':
        return Colors.green;
      case 'info':
        return Colors.blueAccent;
      case 'warning':
        return Colors.orange;
      case 'danger':
        return Colors.redAccent;
      default:
        return Colors.grey;
    }
  }

  String formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 60) {
      return "${difference.inMinutes} mins ago";
    } else if (difference.inHours < 24) {
      return "${difference.inHours} hrs ago";
    } else {
      return DateFormat('dd MMM, hh:mm a').format(dateTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        foregroundColor: Colors.black,
      ),
      backgroundColor: const Color(0xFFF5F7FA),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final notif = notifications[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.all(14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  getIcon(notif['type']),
                  color: getColor(notif['type']),
                  size: 28,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notif['title'],
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        notif['subtitle'],
                        style: GoogleFonts.poppins(
                          fontSize: 13.5,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        formatTime(notif['time']),
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right_rounded, color: Colors.grey),
              ],
            ),
          );
        },
      ),
    );
  }
}
