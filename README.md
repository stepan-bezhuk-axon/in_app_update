# In app update

![](https://img.shields.io/badge/plugin-1.0.0-blue)

# Contents
- [Installed](#Installed)
- [Use](#Use)
- [Native docs](#Native-docs)

# Installed
To connect the plugin you need to register the dependency in the file pubspec.yaml
If your plugin is located locally, specify the path to the plugin

```yaml
 dependencies:
  ....
   in_app_update:
    path: '../'
  ....
```

⚠️ Warning:
Minimal tools version:
***dart sdk: '>=2.18.0 <3.0.0'
flutter sdk: ">=2.5.0"***

# Use
This plugin is currently supported only by Android devices, in the future 
it will work for iOS as well, for its use, you are provided with a basic set of methods

```dart Future<AppUpdateInfo> checkForUpdate()```: Checks if there's an update available
```dart Future<void> performImmediateUpdate()```: Performs an immediate update (full-screen)
```dart Future<void> startFlexibleUpdate()```: Starts a flexible update (background download)
```dart Future<void> completeFlexibleUpdate()```: Actually installs an available flexible update

# Native docs
This plugin integrates the official Android APIs to perform in app updated that were released in 2019: https://developer.android.com/guide/app-bundle/in-app-updates

⚠️ Warning:
If your get error `ERROR_API_NOT_AVAILABLE`

Be aware that this plugin cannot be tested locally. It must be installed via Google Play to work. 
Please check the official documentation about In App Updates from Google.# in_app_update
