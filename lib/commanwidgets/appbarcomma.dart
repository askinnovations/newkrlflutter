import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl/utils/colors.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backButtonColor;
  final VoidCallback? onBackPress;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.backButtonColor = Colors.white,
    this.onBackPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.btntheamColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: AppBar(
        titleSpacing: -7,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 30),
          color: backButtonColor,
          onPressed: () {
            if (onBackPress != null) {
              onBackPress!();
            } else {
              Navigator.pop(context);
            }
          },
        ),
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
        centerTitle: false,
        elevation: 0,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
