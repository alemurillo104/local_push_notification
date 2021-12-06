import 'package:flutter/material.dart';
import 'package:localnotification/src/pages/push_notif_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'pushNotifPage',
      routes: {
        'pushNotifPage' : ( _ ) => PushNotifPage(),
      },
      
    );
  }
}