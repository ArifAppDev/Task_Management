// lib/common_windgets/task_card.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String description;
  final String? imagePath;
  final bool isCompleted;
  final Function(bool?)? onChanged;

  const TaskCard({
    super.key,
    required this.title,
    required this.description,
    this.imagePath,
    this.isCompleted = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: const Color(0xFFb3daff),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                checkColor: Colors.white,
                activeColor: Colors.cyanAccent,
                value: isCompleted,
                onChanged: onChanged,
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    decoration: isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),

          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
              decoration: isCompleted
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),

          if (imagePath != null && imagePath!.isNotEmpty) ...[
            SizedBox(height: 12.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.file(
                File(imagePath!),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 180.h,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
