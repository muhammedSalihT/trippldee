import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trippldee_task/src/screens/widgets/custom_profile_info_widget.dart';
import 'package:trippldee_task/src/screens/widgets/display_name_widget.dart';
import 'package:trippldee_task/src/screens/widgets/custom_dropdown_widget.dart';
import 'package:trippldee_task/src/screens/widgets/custom_country_state_dropdown_widget.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key, this.userId});

  final num? userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomDropdownWidget(),
              const CustomCuntryStateDropDownWidget(),
              const DisplayName(
                firstName: "Muhammed",
                secondName: "Salih",
                prefix: "Mr.",
                suffix: "T",
              ),
              ProfileInfoWidget(
                userId: userId ?? 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
