// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

/// Returns if widget is on screen.
/// Source: https://stackoverflow.com/questions/56602769/how-to-check-if-widget-is-visible-using-flutterdriver
isPresent(SerializableFinder byValueKey, FlutterDriver driver,
    {Duration timeout = const Duration(seconds: 1)}) async {
  try {
    await driver.waitFor(byValueKey, timeout: timeout);
    return true;
  } catch (exception) {
    return false;
  }
}

void main() {
  group('TDDC73 Project', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final passwordStrengthMeterWidget = find.byValueKey('Password Strength Meter');
    final strengthMeter = find.byValueKey('Strength Meter');
    final validateButton = find.byValueKey('validate button');
    final obscureTextButton = find.byValueKey('Obscure text button');


    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('widget is rendered', () async {
      expect(await isPresent(passwordStrengthMeterWidget, driver), true);
      expect(await isPresent(strengthMeter, driver), true);
      expect(await isPresent(validateButton, driver), true);
    });

    test('enter text in text field', () async {
      await driver.tap(passwordStrengthMeterWidget);  // acquire focus
      await driver.enterText('Hello!');  // enter text
      await driver.waitFor(find.text('Hello!'));  // verify text appears on UI
    });

    test('validate validate text', () async {
      await driver.tap(validateButton); // taps validate button
      await driver.getWidgetDiagnostics(passwordStrengthMeterWidget);
    });

    test('obscure text', () async {
      await driver.tap(obscureTextButton); // taps validate button
    });

  });
}
