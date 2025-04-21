import 'package:flutter/material.dart';
import 'package:gemini/routes/routes.dart';
import 'package:gemini/views/Gemini/gemini_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: GeminiProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: Rouets().allRoutes,
      ),
    );
  }
}
