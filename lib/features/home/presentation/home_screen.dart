// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do/common_windgets/task_card.dart';
import 'package:to_do/helpers/all_routes.dart';
import 'package:to_do/helpers/navigation_service.dart';
import 'package:to_do/provider/task_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFcce6ff),
      appBar: AppBar(
        title: const Text("To Do"),
        centerTitle: true,
        backgroundColor: const Color(0xFFb3daff),
      ),
      body: taskProvider.tasks.isEmpty
          ? const Center(
              child: Text(
                "No tasks yet. Tap + to add one!",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            )
          : ListView.builder(
              itemCount: taskProvider.tasks.length,
              itemBuilder: (context, index) {
                final task = taskProvider.tasks[index];

                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 10.w,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                        ),
                        builder: (_) {
                          return Padding(
                            padding: EdgeInsets.all(20.w),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 4,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFcce6ff),
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                ListTile(
                                  leading: const Icon(
                                    Icons.delete,
                                    color: Colors.black,
                                  ),
                                  title: const Text(
                                    "Delete Task",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  onTap: () {
                                    taskProvider.removeTaskAt(index);
                                    Navigator.pop(context);

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Task deleted"),
                                        backgroundColor: Colors.red,
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(height: 10.h),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: TaskCard(
                      title: task.title,
                      description: task.description,
                      imagePath: task.imagePath,
                      isCompleted: task.isCompleted,
                      onChanged: (val) => taskProvider.toggleTask(index),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFb3daff),
        onPressed: () async {
          await NavigationService.navigateTo(Routes.addtaskscreen);

          if (taskProvider.tasks.isNotEmpty) {
            final lastTask = taskProvider.tasks.last;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Task '${lastTask.title}' added"),
                backgroundColor: Colors.green,
                duration: const Duration(seconds: 2),
              ),
            );
          }
        },
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
