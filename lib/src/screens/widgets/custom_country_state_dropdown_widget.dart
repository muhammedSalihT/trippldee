import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trippldee_task/src/screens/view_model/tasks_provider.dart';

class CustomCuntryStateDropDownWidget extends StatefulWidget {
  const CustomCuntryStateDropDownWidget({super.key});

  @override
  CustomCuntryStateDropDownWidgetState createState() =>
      CustomCuntryStateDropDownWidgetState();
}

class CustomCuntryStateDropDownWidgetState
    extends State<CustomCuntryStateDropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProvider>(builder: (context, taskProvider, _) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DropdownButton<String>(
            value: taskProvider.currentSelectedCountry,
            onChanged: (value) {
              taskProvider.onChangeCountry(value: value!);
            },
            items: taskProvider.countryList.map(
              (String country) {
                return DropdownMenuItem<String>(
                  value: country,
                  child: Text(country),
                );
              },
            ).toList(),
          ),
          const SizedBox(width: 20),
          DropdownButton<String>(
            value: taskProvider.currentSelectedState,
            onChanged: (value) {
              taskProvider.changeState(value: value!);
            },
            items: taskProvider
                    .countryStateMap[taskProvider.currentSelectedCountry]
                    ?.map(
                  (String state) {
                    return DropdownMenuItem<String>(
                      value: state,
                      child: Text(state),
                    );
                  },
                ).toList() ??
                [],
          ),
        ],
      );
    });
  }
}
