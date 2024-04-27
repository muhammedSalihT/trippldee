import 'package:flutter/material.dart';
import 'package:trippldee_task/src/screens/tasks/widgets/custom_dropdown_widget.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomDropdownWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
