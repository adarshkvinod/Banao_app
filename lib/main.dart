import 'package:banao_ui/UI/home_page.dart';
import 'package:banao_ui/provider/lessonsprovider.dart';
import 'package:banao_ui/provider/programprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(_) => ProgramProvider()),
        ChangeNotifierProvider(create:(_) => LessonsProvider()),
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        
        home: HomePage(),
        
      ),
    );
   
  }
}

