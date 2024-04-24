import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_study/pages/audo_dispose_family/auto_dispose_family_page.dart';
import 'package:riverpod_study/pages/audo_dispose_family_test/auto_dispose_family_test_page.dart';
import 'package:riverpod_study/pages/auto_dispose/auto_dispose_page.dart';
import 'package:riverpod_study/pages/basic/basic_page.dart';
import 'package:riverpod_study/pages/collections_page.dart';
import 'package:riverpod_study/pages/family/family_page.dart';
import 'package:riverpod_study/pages/hotel_list_page.dart';
import 'package:riverpod_study/pages/method_page.dart';
import 'package:riverpod_study/pages/mutable_person_page.dart';
import 'package:riverpod_study/pages/person_page.dart';
import 'package:riverpod_study/widgets/custom_button.dart';

void main() {
  runApp(
    ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Freezed Data Class',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(20),
          children: [
            CustomButton(
              title: 'Person',
              child: PersonPage(),
            ),
            CustomButton(
              title: 'MutablePerson',
              child: MutablePersonPage(),
            ),
            CustomButton(
              title: 'Collections',
              child: CollectionsPage(),
            ),
            CustomButton(
              title: 'Method',
              child: MethodPage(),
            ),
            CustomButton(
              title: 'Hotel List',
              child: HotelListPage(),
            ),
            CustomButton(
              title: 'Provider',
              child: BasicPage(),
            ),
            CustomButton(
              title: 'AutoDispose Provider',
              child: AutoDisposePage(),
            ),
            CustomButton(
              title: 'Family Provider',
              child: FamilyPage(),
            ),
            CustomButton(
              title: 'Auto Dispose Family Provider',
              child: AutoDisposeFamilyPage(),
            ),
            CustomButton(
              title: 'Auto Dispose Family Test Provider',
              child: AutoDisposeFamilyTestPage(),
            ),
          ],
        ),
      ),
    );
  }
}
