import 'package:EOR/services/connectivity_service.dart';
import 'package:EOR/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'enums/connectivity_status.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return StreamProvider<ConnectivityStatus>(
      create: (context) =>
      ConnectivityService().connectionStatusController.stream,
      child: MaterialApp(
        title: 'EOR',
        theme: ThemeData(
            textTheme: Theme.of(context)
                .textTheme
                .apply(bodyColor: Colors.white, displayColor: Colors.white)),
        home: SplashPage(),
      ),
    );
  }
}