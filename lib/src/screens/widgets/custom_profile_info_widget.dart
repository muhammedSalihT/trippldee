import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trippldee_task/src/screens/view_model/tasks_provider.dart';
import 'package:trippldee_task/src/screens/widgets/display_name_widget.dart';

class ProfileInfoWidget extends StatefulWidget {
  const ProfileInfoWidget({
    super.key,
    required this.userId,
  });

  final num userId;

  @override
  State<ProfileInfoWidget> createState() => _ProfileInfoWidgetState();
}

class _ProfileInfoWidgetState extends State<ProfileInfoWidget> {
  @override
  void initState() {
    final taskProvider = Provider.of<TasksProvider>(context, listen: false);
    taskProvider.fetchUserData(currentUserId: widget.userId.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProvider>(builder: (context, taskProvider, _) {
      return taskProvider.userData != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey, width: 5)),
                  child: ClipOval(
                    child: Image.network(
                      taskProvider.userData!.data.avatar,
                      height: 70,
                      width: 70,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DisplayName(
                        firstName: taskProvider.userData!.data.firstName,
                        secondName: taskProvider.userData!.data.lastName,
                        style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w800,
                            fontSize: 30),
                      ),
                      Text(
                        taskProvider.userData!.data.email,
                      )
                    ],
                  ),
                ),
              ],
            )
          : const Text(
              'Loading...',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
            );
    });
  }
}
