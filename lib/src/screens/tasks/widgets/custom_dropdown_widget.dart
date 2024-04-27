import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trippldee_task/src/screens/tasks/view_model/tasks_provider.dart';

class CustomDropdownWidget extends StatefulWidget {
  const CustomDropdownWidget({super.key});

  @override
  CustomDropdownWidgetState createState() => CustomDropdownWidgetState();
}

class CustomDropdownWidgetState extends State<CustomDropdownWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProvider>(builder: (context, taskPro, _) {
      return DropdownButton<String>(
        value: taskPro.currentCustomDropDownItem,
        hint: const Text('More Actions'),
        onChanged: (String? value) {
          taskPro.changeDropDownItem(value: value!);
        },
        items: taskPro.customDropDownItemList.map(
          (String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                // red color for delete'
                style: TextStyle(color: value == 'Delete' ? Colors.red : null),
              ),
            );
          },
        ).toList(),
      );
    });
  }
}
