# responsive_class

A new Flutter plugin.

## Getting Started
```dart
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveClass(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'Responsive Sizer Example',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Home(),
        );
      },
      ///
      maxTabletWidth: 900, // Optional
    );
  }
}
```
