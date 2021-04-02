import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insane_gainz/main.dart';

class ExerciseForm extends HookWidget {
  final List<DropdownMenuItem> _tierRange = [3, 4, 5, 6, 8, 9, 10].map((e) {
    return DropdownMenuItem(
      value: e,
      child: Text(e.toString()),
    );
  }).toList();

  final List<DropdownMenuItem> _tierTypes =
      ["Tier 1", "Tier 2", "Tier 3"].map((e) {
    return DropdownMenuItem(
      value: e,
      child: Text(e.toString()),
    );
  }).toList();

  @override
  Widget build(BuildContext context) {
    final exercises = useProvider(exerciseProvider.state);
    final dropdownValue = useState(exercises[0]);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tier: ",
                style: DefaultTextStyle.of(context)
                    .style
                    .apply(fontSizeFactor: 1.25),
              ),
              DropdownButton(
                value: _tierTypes[0].value,
                onChanged: (newValue) {
                  //dropdownValue.value = newValue;
                },
                items: _tierTypes,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Exercise: ",
                style: DefaultTextStyle.of(context)
                    .style
                    .apply(fontSizeFactor: 1.25),
              ),
              DropdownButton(
                value: dropdownValue.value,
                onChanged: (newValue) {
                  dropdownValue.value = newValue;
                },
                items: exercises.map((String exercise) {
                  return DropdownMenuItem(
                    value: exercise,
                    child: Text(exercise),
                  );
                }).toList(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Rep Max: ",
                style: DefaultTextStyle.of(context)
                    .style
                    .apply(fontSizeFactor: 1.25),
              ),
              DropdownButton(
                value: _tierRange[0].value,
                onChanged: (newValue) {
                  //dropdownValue.value = newValue;
                },
                items: _tierRange,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ElevatedButton(
                child: Text("Add Workout"),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
