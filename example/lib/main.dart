import 'package:flutter/material.dart';
import 'package:i_updater/i_updater.dart';

void main() {
  runApp(const _MyApp());
}

class _MyApp extends StatefulWidget {
  const _MyApp();

  @override
  State<_MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<_MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Updater(
      countryCode: LanguageCodes.tr.name, // optional arg
      language: LanguageCodes.en, // optional arg
      // versionRequiredStatus: VersionRequiredStatus.require, // optional arg
      // title: const Text('Custom title'), // optional arg
      // content: const Text('Custom content'), // optional arg
      // onCloseTap: () => log('onCloseTap'), // optional arg
      // showVersions: false, // optional arg
      child: Scaffold(
        appBar: AppBar(
          title: const Text('IUpdater'),
        ),
      ),
    );
  }
}
