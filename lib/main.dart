import 'package:flutter/material.dart';

/// Flutter code sample for [NavigationBar].

void main() => runApp(const MybtApp());

class MybtApp extends StatelessWidget {
  const MybtApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const Mybt(),
    );
  }
}

class Mybt extends StatefulWidget {
  const Mybt({super.key});

  @override
  State<Mybt> createState() => _MybtState();
}

class _MybtState extends State<Mybt> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.blueAccent,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.history_outlined),
            icon: Icon(Icons.history),
            label: 'Log',
          ),
          NavigationDestination(
              icon: Icon(Icons.directions_run), label: 'Exercises'),
        ],
      ),
      body: <Widget>[
        /// Home page
        Column(children: <Widget>[Center(child: Text('Master your body'))]),

        /// Messages page
        ListView.builder(
          reverse: true,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'Hello',
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: theme.colorScheme.onPrimary),
                  ),
                ),
              );
            }
            return Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'Hi!',
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: theme.colorScheme.onPrimary),
                ),
              ),
            );
          },
        ),

        /// Notifications page
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Center(
                child: Text('Exercises'),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.one_k),
                  title: Text('Push-up'),
                  subtitle: Text('Chest bodyweight exercise'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.one_k_plus),
                  title: Text('Pull-up'),
                  subtitle: Text(
                      'Lift entire bodyweight above a bar. Back & biceps intensive.'),
                ),
              ),
            ],
          ),
        ),
      ][currentPageIndex],
    );
  }
}
