
// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationsController {

    FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    //Singleton 
    static PushNotificationsController _instance = PushNotificationsController();
    static  PushNotificationsController get instance => _instance;


    void initFunction( Function onSelectNotification ) {

      var initializationSettingsAndroid = AndroidInitializationSettings('flutter_devs');
      var initializationSettingsIOs     = IOSInitializationSettings();
      var initSetttings = InitializationSettings( initializationSettingsAndroid, initializationSettingsIOs );

      _flutterLocalNotificationsPlugin.initialize(initSetttings, onSelectNotification: onSelectNotification );
    }

    Future<void> showNotificationMediaStyle() async {

      var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'media channel id',
        'media channel name',
        'media channel description',
        color: Colors.red,
        enableLights: true,
        largeIcon: DrawableResourceAndroidBitmap("flutter_devs"),
        styleInformation: MediaStyleInformation(),
      );

      var platformChannelSpecifics = NotificationDetails(androidPlatformChannelSpecifics, null);
      await _flutterLocalNotificationsPlugin.show( 0, 'notification title', 'notification body', platformChannelSpecifics);
    }

  Future<void> showBigPictureNotification() async {
    var bigPictureStyleInformation = BigPictureStyleInformation(
        DrawableResourceAndroidBitmap("flutter_devs"),
        largeIcon: DrawableResourceAndroidBitmap("flutter_devs"),
        contentTitle: 'flutter devs',
        htmlFormatContentTitle: true,
        summaryText: 'summaryText',
        htmlFormatSummaryText: true
    );

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'big text channel id',
        'big text channel name',
        'big text channel description',
        styleInformation: bigPictureStyleInformation
    );

    var platformChannelSpecifics = NotificationDetails(androidPlatformChannelSpecifics, null);

    await _flutterLocalNotificationsPlugin.show(
        0, 
        'big text title', 
        'silent body', 
        platformChannelSpecifics,
        payload: "big image notifications"
    );
  }

  Future<void> scheduleNotification() async {

    var scheduledNotificationDateTime = DateTime.now().add(Duration(seconds: 5));

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'channel id',
      'channel name',
      'channel description',
      icon: 'flutter_devs',
      largeIcon: DrawableResourceAndroidBitmap('flutter_devs'),
    );

    var iOSPlatformChannelSpecifics = IOSNotificationDetails();

    var platformChannelSpecifics = NotificationDetails( androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

    await _flutterLocalNotificationsPlugin.schedule(
        0,
        'scheduled title',
        'scheduled body',
        scheduledNotificationDateTime,
        platformChannelSpecifics
    );
  }

  Future<void> cancelNotification() async => await _flutterLocalNotificationsPlugin.cancel(0);
  

  showNotification() async {
    var android = new AndroidNotificationDetails(
        'id', 
        'channel ', 
        'description',
        priority: Priority.High, 
        importance: Importance.Max
    );

    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);

    await _flutterLocalNotificationsPlugin.show(
        0, 
        'Flutter devs', 
        'Flutter Local Notification Demo', 
        platform,
        payload: 'Welcome to the Local Notification demo '
    );
  }

}