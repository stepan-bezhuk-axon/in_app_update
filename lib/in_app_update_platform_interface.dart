import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'enums/app_update_result.dart';
import 'in_app_update.dart';
import 'in_app_update_method_channel.dart';

abstract class InAppUpdatePlatform extends PlatformInterface {
  /// Constructs a InAppUpdatePlatform.
  InAppUpdatePlatform() : super(token: _token);

  static final Object _token = Object();

  static InAppUpdatePlatform _instance = InAppUpdate();

  /// The default instance of [InAppUpdatePlatform] to use.
  ///
  /// Defaults to [lInAppUpdate].
  static InAppUpdatePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [InAppUpdatePlatform] when
  /// they register themselves.
  static set instance(InAppUpdatePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Has to be called before being able to start any update.
  ///
  /// Returns [AppUpdateInfo], which can be used to decide if
  /// [startFlexibleUpdate] or [performImmediateUpdate] should be called.
  Future<AppUpdateInfo> checkForUpdate();

  /// Performs an immediate update that is entirely handled by the Play API.
  ///
  /// [checkForUpdate] has to be called first to be able to run this.
  Future<AppUpdateResult> performImmediateUpdate();

  /// Starts the download of the app update.
  ///
  /// Throws a [PlatformException] if the download fails.
  /// When the returned [Future] is completed without any errors,
  /// [completeFlexibleUpdate] can be called to install the update.
  ///
  /// [checkForUpdate] has to be called first to be able to run this.
  Future<AppUpdateResult> startFlexibleUpdate();

  /// Installs the update downloaded via [startFlexibleUpdate].
  /// [startFlexibleUpdate] has to be completed successfully.
  Future<void> completeFlexibleUpdate();
}
