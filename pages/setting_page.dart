// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
              title: const Text('Dark Mode'),
              value: _isDarkModeEnabled,
              onChanged: (value) {
                _toggleDarkMode(context, value);
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _toggleDarkMode(BuildContext context, bool value) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm'),
          content: Text('Are you sure you want to switch to ${value ? 'dark' : 'light'} mode?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _isDarkModeEnabled = value;
                  _updateTheme(value);
                });
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  void _updateTheme(bool isDarkModeEnabled) {
    ThemeMode themeMode = isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ThemeManager.of(context)?.setThemeMode(themeMode);
    });
  }
}

class ThemeManager extends StatefulWidget {
  final Widget child;

  const ThemeManager({super.key, required this.child});

  static _ThemeManagerState? of(BuildContext context) {
    return context.findAncestorStateOfType<_ThemeManagerState>();
  }

  @override
  _ThemeManagerState createState() => _ThemeManagerState();
}

class _ThemeManagerState extends State<ThemeManager> {
  ThemeMode _themeMode = ThemeMode.light;

  void setThemeMode(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      home: widget.child,
    );
  }
}

void main() {
  runApp(
    const ThemeManager(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SettingsPage(),
    );
  }
}
