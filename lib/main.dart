import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:universities/presentation/routes/routes.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SentryFlutter.init((options) {
    options.dsn =
        'https://67987282a90b4289a6d8d5d02f4c3ef9@o4504108157829120.ingest.sentry.io/4504108158812160';
    options.tracesSampleRate = 1.0;
  },
      appRunner: () => SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
          ]).then((_) {
            runApp(const MyApp());
          }));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Universities',
      getPages: Pages.routes,
      initialRoute: Pages.home,
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
    );
  }
}
