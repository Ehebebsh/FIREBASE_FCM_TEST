import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();

    _firebaseMessaging.getToken().then((token) {
      print('FCM Token: $token');
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('포그라운드 메시지: ${message.notification!.body}');
      _showForegroundNotification(message.notification!);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Message clicked!');
      // TODO: 알림을 처리하는 로직을 추가하세요.
    });

    _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  void _showForegroundNotification(RemoteNotification notification) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(notification.title ?? '알림'),
        content: Text(notification.body ?? '내용이 없습니다.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('FCM Push 예제'),
      ),
      body: Center(
        child: Text('푸시 알림 예제'),
      ),
    );
  }
}