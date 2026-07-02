import 'package:flutter/material.dart';
import 'package:smart_pay/theme/app_colors.dart';

class RecoveryOption extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool selected;

  const RecoveryOption({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.textwhite,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor:
            selected ? Colors.teal : Colors.grey.shade300,
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(title),
                Text(subtitle),
              ],
            ),
          ),
          Icon(icon),
        ],
      ),
    );
  }
}