import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

// ignore: implementation_imports, depend_on_referenced_packages
import 'package:riverpod/src/framework.dart';

import 'collections/saved_receipt.dart';
import 'pages/home_page.dart';
import 'repository/receipts_repository.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/',
  routes: <RouteBase>[GoRoute(path: '/', builder: (BuildContext context, GoRouterState state) => const HomePage())],
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final Directory dir = await getApplicationSupportDirectory();

  final Isar isar = await Isar.open(<CollectionSchema<dynamic>>[
    SavedReceiptSchema,
    SavedReceiptItemSchema,
  ], directory: dir.path);

  runApp(ProviderScope(overrides: <Override>[isarProvider.overrideWithValue(isar)], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'レシート読み取り',
      // 黒基調
      theme: ThemeData(
        colorSchemeSeed: Colors.teal,
        brightness: Brightness.dark,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
      ),
      routerConfig: router,
    );
  }
}
