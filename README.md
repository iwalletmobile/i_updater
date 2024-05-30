# iUpdater

## Update Plugin for Flutter

## Overview

The Update Plugin for Flutter provides an easy way to prompt users to update your app to the latest version. This ensures that users always have access to the latest features, improvements, and security patches.

## Features

- **Version Checking**: Compare the current app version with the latest version available.
- **Update Prompt**: Show a customizable dialog to users prompting them to update the app.
- **Flexible Configuration**: Configure update behavior and UI.
- **Platform Support**: Works on both Android and iOS.

## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  i_updater: ^1.0.0 
```
Then, run flutter pub get to install the package.

# Usage
## Basic Usage

Import the package:

```dart
import 'package:i_updater/i_updater.dart';
```

Initialize the plugin: Typically, this would be done in your main app widget.


```dart
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

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
```

# Contributing
Contributions are welcome! Please submit a pull request or open an issue to suggest improvements or report bugs.

# License
This project is licensed under the MIT License. See the LICENSE file for more details.
MIT License

Copyright (c) 2024 iWallet Türkiye

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
