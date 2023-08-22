import 'package:flutter/material.dart';

const Color _customColor = Color(0xff5C11d4);
const List<Color> _colorTheme = [
  _customColor,
  Colors.blue,
  Colors.orange,
  Colors.teal,
  Colors.indigo,
  Colors.pink
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= _colorTheme.length - 1,
            'Colors must be between 0 and ${_colorTheme.length}');

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorTheme[selectedColor],
      // brightness: Brightness.dark
    );
  }
}
