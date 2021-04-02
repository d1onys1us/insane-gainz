import 'package:flutter/material.dart';
import 'package:insane_gainz/riverpods/exercise_notifier.dart';
import 'package:insane_gainz/views/log_view.dart';
import 'views/add_exercise.dart';
import 'views/home_view.dart';
import 'views/settings_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exerciseProvider = StateNotifierProvider((ref) => ExerciseNotifier());
void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Insane Gainz',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => MyHomePage(title: 'Insane Gainz'),
          '/add_exercise': (context) => AddExercise(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _views = <Widget>[
    HomeView(),
    LogView(),
    SettingsView(),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _views.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timeline),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: _onTap,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
