import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:in_app_update/enums/error_code.dart';

import 'enums/app_update_result.dart';
import 'in_app_update.dart';
import 'in_app_update_platform_interface.dart';

/// An implementation of [InAppUpdatePlatform] that uses method channels.
class InAppUpdate extends InAppUpdatePlatform {
  static const MethodChannel _channel = MethodChannel('in_app_update');

  @override
  Future<AppUpdateInfo> checkForUpdate() async {
    final result = await _channel.invokeMethod('checkForUpdate');

    return AppUpdateInfo(
      result['updateAvailability'],
      result['immediateAllowed'],
      result['flexibleAllowed'],
      result['availableVersionCode'],
      result['installStatus'],
      result['packageName'],
      result['clientVersionStalenessDays'],
      result['updatePriority'],
    );
  }

  @override
  Future<AppUpdateResult> performImmediateUpdate() async {
    try {
      await _channel.invokeMethod('performImmediateUpdate');
      return AppUpdateResult.success;
    } on PlatformException catch (e) {
      if (e.code == ErrorCode.USER_DENIED_UPDATE.name) {
        return AppUpdateResult.userDeniedUpdate;
      } else if (e.code == ErrorCode.IN_APP_UPDATE_FAILED.name) {
        return AppUpdateResult.inAppUpdateFailed;
      }

      rethrow;
    }
  }

  @override
  Future<AppUpdateResult> startFlexibleUpdate() async {
    try {
      await _channel.invokeMethod('startFlexibleUpdate');
      return AppUpdateResult.success;
    } on PlatformException catch (e) {
      if (e.code == ErrorCode.USER_DENIED_UPDATE.name) {
        return AppUpdateResult.userDeniedUpdate;
      } else if (e.code == ErrorCode.IN_APP_UPDATE_FAILED.name) {
        return AppUpdateResult.inAppUpdateFailed;
      }

      rethrow;
    }
  }

  @override
  Future<void> completeFlexibleUpdate() async {
    return await _channel.invokeMethod('completeFlexibleUpdate');
  }
}
