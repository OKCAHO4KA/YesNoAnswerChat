import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/pages/chat_screen.dart';
import 'package:yes_no_app/providers/chat_provider.dart';
import 'package:yes_no_app/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChatProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme(selectedColor: 3).theme(),
          title: 'Yes No App',
          home: const ChatScreen()),
    );
  }
}
