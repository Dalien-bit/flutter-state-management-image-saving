import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rider/providers/riders_provider.dart';
import 'package:rider/screens/add%20rider/add_detail_screen.dart';
import 'package:rider/screens/home/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RidersProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Riders',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const HomeScreen(),
        AddDetailScreen.routeName: (context) => const AddDetailScreen(),
        // AddDocumentsScreen.routeName: (context) => const AddDocumentsScreen(),
      },
    );
  }
}
