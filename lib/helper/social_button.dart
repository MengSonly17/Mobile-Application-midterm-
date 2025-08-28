import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class SocialButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? icon;
  final String? label;

  const SocialButton({
    super.key,
    required this.onPressed,
    this.icon,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
        backgroundColor: WidgetStatePropertyAll(HexColor("#F5F9FE")),
        padding: WidgetStatePropertyAll(EdgeInsets.all(16)),
      ),
      child: Row(
        children: [
          icon == null
              ? SizedBox()
              : Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Image.asset(icon!, width: 24),
                ),

          Text(
            label ?? '',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: HexColor('#61677D'),
            ),
          ),
        ],
      ),
    );
  }
}
