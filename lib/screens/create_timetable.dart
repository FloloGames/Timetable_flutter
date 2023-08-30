import 'package:flutter/material.dart';
import 'package:timetable/codebehind/lesson.dart';

import '../codebehind/helper_functions.dart';

class CreateTimetableScreen extends StatefulWidget {
  const CreateTimetableScreen({super.key});

  @override
  State<CreateTimetableScreen> createState() => _CreateTimetableScreenState();
}

class _CreateTimetableScreenState extends State<CreateTimetableScreen> {
  List<LessonContainer> _lessonContainers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Stundenplan Erstellen"),
      ),
      body: Center(
        child: Column(
          children: [
            _lessonContainersRow(),
          ],
        ),
      ),
    );
  }

  List<Widget> _createLessonContainerWidgets() {
    List<Widget> widgets = [];
    for (int i = 0; i < _lessonContainers.length; i++) {
      Widget lessonWidget = _createLessonWidget(i);
      widgets.add(lessonWidget);
    }
    Widget addLessonWidget = Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2), // Outline properties
        borderRadius: BorderRadius.circular(8), // Rounded corners
      ),
      child: IconButton(
        icon: const Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: () {
          LessonContainer lessonContainer = LessonContainer();
          _lessonContainers.add(lessonContainer);
          setState(() {});
        },
      ),
    );
    widgets.add(addLessonWidget);
    return widgets;
  }

  Widget _createLessonWidget(int index) {
    LessonContainer lessonContainer = _lessonContainers[index];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white, // Background color
          elevation: 3, // Depth of the button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(
              color: Colors.grey,
              width: 2,
            ),
          ),
          padding: const EdgeInsets.all(16),
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              final TextEditingController nameController =
                  TextEditingController();

              final TextEditingController teacherController =
                  TextEditingController();

              nameController.text = lessonContainer.getName();
              teacherController.text = lessonContainer.getTeacher();

              double widthScaler = 0.5;
              double heightScaler = 0.5;

              return SizedBox(
                width: getWidth(context) * widthScaler,
                height: getHeight(context) * heightScaler,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(labelText: 'Name'),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: teacherController,
                        decoration:
                            const InputDecoration(labelText: 'Lehrkraft'),
                      ),
                      // const SizedBox(height: 8),
                      // Expanded(
                      //   child: Column(
                      //     children: [
                      //       ListView.builder(
                      //         itemCount: 1,
                      //         itemBuilder: (context, index) {
                      //           return Container(
                      //             color: Colors.red,
                      //             width: 30,
                      //             height: 30,
                      //           );
                      //         },
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              String newName = nameController.text;
                              String newTeacher = teacherController.text;

                              lessonContainer.setName(newName);
                              lessonContainer.setTeacher(newTeacher);

                              Navigator.pop(context);
                            },
                            child: const Text('Speichern'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _lessonContainers.remove(lessonContainer);
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Löschen',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ).then((value) {
            setState(() {});
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              lessonContainer.getName(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8), // Space between text elements
            Text(
              lessonContainer.getTeacher(),
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _lessonContainersRow() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _createLessonContainerWidgets(),
      ),
    );
  }
}
