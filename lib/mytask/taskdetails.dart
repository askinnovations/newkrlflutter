import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl/commanwidgets/appbarcomma.dart';
import 'package:krl/utils/colors.dart';

class TaskDetailScreen extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isDone;

  const TaskDetailScreen({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isDone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: CustomAppBar(title: 'Task Details'),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          width: double.infinity,
          height: 320,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection("Title", title),
              const SizedBox(height: 20),
              _buildSection("Due Time", subtitle),
              const SizedBox(height: 20),
              _buildSection(
                "Status",
                isDone ? "Completed" : "Pending",
                color: isDone ? Colors.green : Colors.orange,
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  label: Text(
                    "Back",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.btntheamColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String label, String value, {Color? color}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: color ?? Colors.black87,
          ),
        ),
      ],
    );
  }
}
