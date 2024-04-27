import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trippldee_task/src/screens/view_model/tasks_provider.dart';

class CustomDropdownWidget extends StatefulWidget {
  const CustomDropdownWidget({super.key});

  @override
  CustomDropdownWidgetState createState() => CustomDropdownWidgetState();
}

class CustomDropdownWidgetState extends State<CustomDropdownWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProvider>(builder: (context, taskProvider, _) {
      return DropdownButton<String>(
        value: taskProvider.currentCustomDropDownItem,
        hint: const Text('More Actions'),
        onChanged: (String? value) {
          taskProvider.changeDropDownItem(value: value!);
        },
        items: taskProvider.customDropDownItemList.map(
          (String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(color: value == 'Delete' ? Colors.red : null),
              ),
            );
          },
        ).toList(),
      );
    });
  }
}
