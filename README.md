# 🔔 FCM 알림 실습 앱

이 프로젝트는 **firebase_messaging** 패키지를 사용하여 FCM(파이어베이스 클라우드 메시징) 알림을 구현하는 Flutter 앱이다.  Firebase Cloud Messaging(FCM)을 통해 앱에 푸시 알림을 전송하고, 이를 처리하는 방법을 배우는 데 중점을 둔다.

## 🛠️ 1. 실행 과정

### 1.1 패키지 설치
<details>
<summary>firebase_messaging 패키지 설치</summary>
<div markdown="1">

FCM 알림을 구현하기 위해 **firebase_messaging** 패키지를 사용한다. 아래 링크를 통해 패키지를 설치할 수 있다.:

- **패키지 링크**: [firebase_messaging](https://pub.dev/packages/firebase_messaging)

```yaml
dependencies:
  firebase_core: latest_version
  firebase_messaging: latest_version
```

Firebase와 연동하기 위해 firebase_core 패키지도 함께 설치한다.

</div> </details>

### 1.2 Firebase 설정
<details> <summary>Firebase 설정 및 연동</summary> <div markdown="1">
  
Firebase 프로젝트 생성: Firebase 콘솔에서 새 프로젝트를 생성한다.
앱에 Firebase 추가: 프로젝트에 Android 및 iOS 앱을 추가합니다. 이 과정에서 google-services.json(Android) 또는 GoogleService-Info.plist(iOS)를 다운로드하여 프로젝트에 포함시킨다.
Firebase 초기화: Flutter 앱에서 Firebase를 초기화해야 한다.
  
```dart
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
```

</div> </details>

### 1.3 FCM 알림 설정
<details> <summary>FCM 알림 수신 및 처리</summary> <div markdown="1">
Flutter 앱에서 FCM 알림을 수신하고 처리하는 기본 코드는 다음과 같다:

```dart
 @override
  void initState() {
    super.initState();

    _firebaseMessaging.getToken().then((token) {
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _showForegroundNotification(message.notification!);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // TODO: 알림을 처리하는 로직을 추가하세요.
    });

    _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
```

onMessage: 앱이 포그라운드 상태에서 FCM 메시지를 수신했을 때 호출된다.
onMessageOpenedApp: 사용자가 알림을 클릭하여 앱을 열 때 호출된다.
</div> </details>

## 🎥 2. 실행 화면
아래는 앱 실행 화면의 예시이다. FCM 알림을 수신하고 처리하는 과정이 어떻게 이루어지는지 확인할 수 있다.

<p align="center"> <img src="https://github.com/user-attachments/assets/d0620341-7193-4587-a9fb-082d615b0b3a" alt="FCM Demo" width="300">

