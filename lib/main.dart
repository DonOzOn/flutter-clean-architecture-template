import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/common/infra/router.dart';
import 'package:flutter_clean_architecture/presentation/splash/splash.page.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'config/app_dependency.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppDependencies.initialize();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AppDependencies.sl.allReady(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MaterialApp(
            onGenerateRoute: AppRouter.generateRoute,
            // initialRoute: AppRouter.ROUTE_SPLASH,
            title: "Flutter clean architecture",
            theme: ThemeData(
              primarySwatch: Colors.green,
            ),
            home: SplashPage(),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
