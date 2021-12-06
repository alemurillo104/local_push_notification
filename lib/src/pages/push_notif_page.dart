
import 'package:flutter/material.dart';
import 'package:localnotification/src/controllers/push_notifications_controller.dart';
import 'package:localnotification/src/pages/navigatable_page.dart';

class PushNotifPage extends StatefulWidget {

  @override
  State<PushNotifPage> createState() => _PushNotifPageState();
}

class _PushNotifPageState extends State<PushNotifPage> {

  @override
  void initState() {
    super.initState();
    PushNotificationsController.instance.initFunction(onSelectNotification);
  }
    
  // ignore: missing_return
  Future onSelectNotification(String payload) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return NavigatablePage(
            payload: payload,
          );
        }
      )
    );
  }

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(milliseconds: 3000), PushNotificationsController.instance.showNotification );

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: new Text('Flutter notification demo'),
      ),
      body: new Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: PushNotificationsController.instance.showNotification,
              child: new Text( 'showNotification'),
            ),
            ElevatedButton(
              onPressed: PushNotificationsController.instance.cancelNotification,
              child: new Text( 'cancelNotification' ),
            ),
            ElevatedButton(
              onPressed: PushNotificationsController.instance.scheduleNotification,
              child: new Text( 'scheduleNotification' ),
            ),
            ElevatedButton(
              onPressed: PushNotificationsController.instance.showBigPictureNotification,
              child: new Text( 'showBigPictureNotification' ),
            ),
            ElevatedButton(
              onPressed: PushNotificationsController.instance.showNotificationMediaStyle,
              child: new Text( 'showNotificationMediaStyle' ),
            ),
          ],
        ),
      ),
    );
  }
}