import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:i_updater/i_updater.dart';

void main() {
  testWidgets('Updater initializes correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Updater(
          language: LanguageCodes.tr,
          countryCode: LanguageCodes.tr.name,
          versionRequiredStatus: VersionRequiredStatus.optional,
          showVersions: true,
          content: Container(),
          title: Container(),
          onCloseTap: () {},
          child: Container(),
        ),
      ),
    );

    expect(find.byType(Container), findsOneWidget);
  });
}
