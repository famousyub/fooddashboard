
import 'package:first_app/HomePage.dart';
import 'package:flutter/material.dart';


void main7() {
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({Key? key}) : super(key: key);

// This widget is the root of your application.
@override
Widget build(BuildContext context) {
	return MaterialApp(
	// on below line we are specifying title of our app
	title: 'uio',
	// on below line we are hiding debug banner
	debugShowCheckedModeBanner: false,
	theme: ThemeData(
		// on below line we are specifying theme
		primarySwatch: Colors.green,
	),
	// First screen of our app
	home: const HomePage(),
	);
}
}
