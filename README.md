# i_updater

## Update Plugin for Flutter

## Overview

The Update Plugin for Flutter provides an easy way to prompt users to update your app to the latest version. This ensures that users always have access to the latest features, improvements, and security patches.

## Table of contents

- [Features](#features)

- [Installation](#installation)

- [Usage](#usage)

- [Properties](#properties)

- [Screenshots](#screenshots)

- [Contributing](#contributing)

- [License](#license)

## Features

- **Version Checking**: Compare the current app version with the latest version available.
- **Update Prompt**: Show a customizable dialog to users prompting them to update the app.
- **Flexible Configuration**: Configure update behavior and UI.
- **Platform Support**: Works on both Android and iOS.

## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  i_updater: ^0.0.5
```
Then, run flutter pub get to install the package.

## Usage

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

## Properties

| Properties              | Required | Default                   | Description                                                                                                                                                                   |
| ----------------------- | -------- | ------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| key                     | false    |                           | Widget key.                                                                                                                                                                   |
| child                   | true     |                           | Where you want to announce the new version (usually splash is preferred)                                                                                                                                              |
| countryCode        | false     |  `en`     | It represents the language code. This is the statement that will appear in the endpoint when fetching store information. (e.g. 'en', 'tr'...).                                                                                           |
| language                    | false     |       `LanguageCodes.en`   | Specifies the alert dialog language. Currently 11 languages are supported.                                                                                                                                |
| versionRequiredStatus             | false    | `VersionRequiredStatus.optional` | Indicates whether the update is mandatory or not. |
| showVersions          | false    |       `true`          | Determines whether version information is shown in the Dialog.                                                                                                     |
| title             | false    |                           | Sets the update notification title.                                                                                                                                                    |
| content              | false    |                    |  Determines the content of the update notification.                                                                                                                                          |
| onCloseTap | false    |       `Navigator.of(context).pop()`    | Determines the shutdown function (Maybe later button).                                                                   |              


## Screenshots

#### iOS

<p float="left">
<table>
    <tbody>
            <td align="center" style="background-color: white">
                <img width="175" src="https://github.com/iwalletmobilecase/i_updater/assets/105479937/e79b6b32-cb8a-422b-8ba7-a758fc415f81"/></a>
            </td>
            <td align="center" style="background-color: white">
               <img src="https://github.com/iwalletmobilecase/i_updater/assets/105479937/61095f32-06b9-4b52-8ee6-8d3a3460c19a" width="175"/></a>
            </td>
              <td align="center" style="background-color: white">
                <img src="https://github.com/iwalletmobilecase/i_updater/assets/105479937/a4b911d7-ffa7-4e97-b7da-6ddc47814139" width="175"/></a>
            </td>
            <td align="center" style="background-color: white">
                <img src="https://github.com/iwalletmobilecase/i_updater/assets/105479937/90bfa53c-00c0-4557-aaf8-672509d1d6a4" width="175"/></a>
            </td>
    </tbody>
</table>
</p>

#### Android

<table>
    <tbody>
            <td align="center" style="background-color: white">
                <img width="175" src="https://github.com/iwalletmobilecase/i_updater/assets/105479937/1153a1fc-37f8-48ef-a2bd-0149d7421605"/></a>
            </td>
            <td align="center" style="background-color: white">
               <img src="https://github.com/iwalletmobilecase/i_updater/assets/105479937/2019889f-797e-45ff-8654-69027c4cbc1c" width="175"/></a>
            </td>
              <td align="center" style="background-color: white">
                <img src="https://github.com/iwalletmobilecase/i_updater/assets/105479937/28800a9b-95eb-46b4-b42b-4e1fb09211c1" width="175"/></a>
            </td>
            <td align="center" style="background-color: white">
                <img src="https://github.com/iwalletmobilecase/i_updater/assets/105479937/14cc5bcb-4cc4-41a5-b3bf-46ddda8a21a2" width="175"/></a>
            </td>
    </tbody>
</table>

# Contributing

If you would like to contribute to the plugin (e.g. by improving the documentation, solving a bug, or adding a cool new feature), please carefully review our [contribution guide](./CONTRIBUTING.md) and send us your [pull request](https://github.com/iwalletmobile/i_updater/pulls).

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
