import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insane_gainz/main.dart';
import 'package:insane_gainz/models/master_exercise.dart';

class MasterWorkoutList extends HookWidget {
  List<Widget> _formatExercises(BuildContext context, List<String> exercises) {
    List<Widget> retExercises = [];
    for (int i = 0; i < exercises.length; i++) {
      Widget w = Card(
        child: ListTile(
          title: Text(exercises[i]),
          trailing: TextButton(
            style: TextButton.styleFrom(primary: Colors.red),
            child: Text("Delete"),
            onPressed: () => context.read(exerciseProvider).delete(i),
          ),
        ),
      );
      retExercises.add(w);
    }
    return retExercises;
  }

  void _addExercise(BuildContext context, TextEditingValue value) {
    MasterExercise masterExercise = new MasterExercise(value.text);
    context.read(exerciseProvider).add(masterExercise);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final exercises = useProvider(exerciseProvider.state);
    final _controller = TextEditingController();

    Future<void> _showDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                        child: TextFormField(
                          controller: _controller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Exercise Name',
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            child: Text('Cancel'),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          TextButton(
                            child: Text('Add'),
                            onPressed: () =>
                                _addExercise(context, _controller.value),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Column(
      children: [
        Expanded(
          child: ListView(
            children: _formatExercises(context, exercises),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => _showDialog(),
            child: Text("Add Exercise"),
          ),
        ),
      ],
    );
  }
}
