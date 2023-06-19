import 'dart:async';
import 'package:first_app/fitness_app_view.dart';
import 'package:first_app/ui/pages/home/index.dart';
import 'package:first_app/ui/screens/login_screen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app.dart';
import 'firebase_options.dart';


void main() async{
  
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // If we run on web, do not use Crashlytics (not supported on web yet)
  if (kIsWeb) {
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.dumpErrorToConsole(details);
    };
    runApp(await getApp(web: true));
  } else {
    // Use dart zone to define Crashlytics as error handler for errors
    // that occur outside runApp
    runZonedGuarded<Future<void>>(() async {
      // Pass all uncaught errors from the framework to Crashlytics.
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
      runApp(await getApp());
    },
        (error, stack) =>
            FirebaseCrashlytics.instance.recordError(error, stack));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'taieb',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
         
        primarySwatch: Colors.blue,
      ),
      //home: const Auth(),
      routes: {
      
      
        '/login' :(context) => const  LoginScreen(),
        '/fines':(context) =>  FitnessAppHomeScreen(),
        '/map':(context)  =>const  HomePage()
      },
    );
  }
}


