import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trippldee_task/src/screens/view/tasks_view.dart';
import 'package:trippldee_task/src/screens/view_model/tasks_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TasksProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Trippldee_test',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),

        //task 5,Flutter router that displays user profile data

        // use initialRoute route for routing,

        initialRoute: '#/user/6',
        onGenerateRoute: (settings) {
          if (settings.name!.startsWith('#/user/')) {
            // The user ID is read from the URL
            var userId = int.tryParse(settings.name!.split('/').last);
            if (userId != null) {
              return MaterialPageRoute(
                builder: (context) => TasksView(userId: userId),
              );
            }
          }
          // If the route is not recognized, return a default route
          return MaterialPageRoute(
            builder: (context) => const TasksView(),
          );
        },
      ),
    );
  }
}
