import 'package:flutter_test/flutter_test.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:in_app_update/in_app_update_platform_interface.dart';
import 'package:in_app_update/in_app_update_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockInAppUpdatePlatform
    with MockPlatformInterfaceMixin
    implements InAppUpdatePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final InAppUpdatePlatform initialPlatform = InAppUpdatePlatform.instance;

  test('$lInAppUpdate is the default instance', () {
    expect(initialPlatform, isInstanceOf<lInAppUpdate>());
  });

  test('getPlatformVersion', () async {
    InAppUpdate inAppUpdatePlugin = InAppUpdate();
    MockInAppUpdatePlatform fakePlatform = MockInAppUpdatePlatform();
    InAppUpdatePlatform.instance = fakePlatform;

    expect(await inAppUpdatePlugin.getPlatformVersion(), '42');
  });
}
