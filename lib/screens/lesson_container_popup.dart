import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LessonContainerPopUp extends StatefulWidget {
  const LessonContainerPopUp({super.key});

  @override
  _LessonContainerPopUpState createState() => _LessonContainerPopUpState();
}

class _LessonContainerPopUpState extends State<LessonContainerPopUp> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<String> items = ['Item 1', 'Item 2', 'Item 3']; // Example list items

  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();

  void addItem() {
    final int index = items.length;
    items.add('Item ${index + 1}');
    _listKey.currentState!.insertItem(index);
  }

  void removeItem(int index) {
    final removedItem = items.removeAt(index);
    builder(context, animation) {
      return buildItem(removedItem, animation);
    }

    _listKey.currentState!.removeItem(index, builder);
  }

  Widget buildItem(String item, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: ListTile(
        title: Text(item),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            removeItem(items.indexOf(item));
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AppBar(
          title: const Text('Horizontal Animated List in Bottom Sheet'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: textController1,
                  decoration: const InputDecoration(
                    labelText: 'Input 1',
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: TextField(
                  controller: textController2,
                  decoration: const InputDecoration(
                    labelText: 'Input 2',
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  addItem();
                  textController1.clear();
                  textController2.clear();
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: AnimatedList(
            key: _listKey,
            initialItemCount: items.length,
            scrollDirection: Axis.horizontal, // Make the list horizontal
            itemBuilder: (context, index, animation) {
              return buildItem(items[index], animation);
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    textController1.dispose();
    textController2.dispose();
    super.dispose();
  }
}
// import 'package:flutter/material.dart';
// import 'package:timetable/codebehind/helper_functions.dart';

// class LessonContainerPopUp extends StatefulWidget {
//   const LessonContainerPopUp({super.key});

//   @override
//   _LessonContainerPopUpState createState() => _LessonContainerPopUpState();
// }

// class _LessonContainerPopUpState extends State<LessonContainerPopUp> {
//   final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
//   List<String> items = ['Item 1', 'Item 2', 'Item 3']; // Example list items

//   void addItem() {
//     final int index = items.length;
//     items.add('Item ${index + 1}');
//     _listKey.currentState!.insertItem(index);
//   }

//   void removeItem(int index) {
//     final removedItem = items.removeAt(index);
//     builder(context, animation) {
//       return buildItem(removedItem, animation);
//     }

//     _listKey.currentState!.removeItem(index, builder);
//   }

//   Widget buildItem(String item, Animation<double> animation) {
//     return SizeTransition(
//       sizeFactor: animation,
//       child: ListTile(
//         title: Text(item),
//         trailing: IconButton(
//           icon: Icon(Icons.delete),
//           onPressed: () {
//             removeItem(items.indexOf(item));
//           },
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: getWidth(context),
//       child: Column(
//         children: <Widget>[
//           AppBar(
//             title: Text('Animated List in Bottom Sheet'),
//           ),
//           Expanded(
//             child: AnimatedList(
//               key: _listKey,
//               scrollDirection: Axis.horizontal,
//               initialItemCount: items.length,
//               itemBuilder: (context, index, animation) {
//                 return buildItem(items[index], animation);
//               },
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               addItem();
//             },
//             child: Text('Add Item'),
//           ),
//         ],
//       ),
//     );
//   }
// }
