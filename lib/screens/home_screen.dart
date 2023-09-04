import 'package:flutter/material.dart';
import '../codebehind/helper_functions.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Stundenplaner"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                showSnackBar(context, "Stundenplan Erstellen");
                Navigator.of(context).pushNamed("/createTimetable");
              },
              child: const Text("Stundenplan Erstellen"),
            ),
            TextButton(
              onPressed: () {
                showSnackBar(context, "Stundenplan Laden");
              },
              child: const Text("Stundenplan Laden"),
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
