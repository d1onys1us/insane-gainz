import 'package:flutter/material.dart';
import 'package:insane_gainz/views/master_workout_list.dart';

class SettingsView extends StatefulWidget {
  SettingsView({Key key}) : super(key: key);

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return MasterWorkoutList();
  }
}
