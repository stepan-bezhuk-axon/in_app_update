class InstallStatus {
  InstallStatus._();

  static int get unknown => 0;
  static int get pending => 1;
  static int get downloading => 2;
  static int get installing => 3;
  static int get installed => 4;
  static int get failed => 5;
  static int get canceled => 6;
  static int get downloaded => 11;
}

class UpdateAvailability {
  UpdateAvailability._();

  static int get unknown => 0;
  static int get updateNotAvailable => 1;
  static int get updateAvailable => 2;

  /// An update has been triggered by the developer and is in progress.
  static int get developerTriggeredUpdateInProgress => 3;
}

class AppUpdateInfo {
  final int updateAvailability;
  final int installStatus;
  final int updatePriority;

  final int? availableVersionCode;
  final int? clientVersionStalenessDays;

  final bool immediateUpdateAllowed, flexibleUpdateAllowed;

  final String packageName;

  AppUpdateInfo(
    this.updateAvailability,
    this.immediateUpdateAllowed,
    this.flexibleUpdateAllowed,
    this.availableVersionCode,
    this.installStatus,
    this.packageName,
    this.clientVersionStalenessDays,
    this.updatePriority,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AppUpdateInfo &&
              runtimeType == other.runtimeType &&
              updateAvailability == other.updateAvailability &&
              immediateUpdateAllowed == other.immediateUpdateAllowed &&
              flexibleUpdateAllowed == other.flexibleUpdateAllowed &&
              availableVersionCode == other.availableVersionCode &&
              installStatus == other.installStatus &&
              packageName == other.packageName &&
              clientVersionStalenessDays == other.clientVersionStalenessDays &&
              updatePriority == other.updatePriority;

  @override
  int get hashCode =>
      updateAvailability.hashCode ^
      immediateUpdateAllowed.hashCode ^
      flexibleUpdateAllowed.hashCode ^
      availableVersionCode.hashCode ^
      installStatus.hashCode ^
      packageName.hashCode ^
      clientVersionStalenessDays.hashCode ^
      updatePriority.hashCode;

  @override
  String toString() => 'InAppUpdateState{updateAvailability: $updateAvailability, '
      'immediateUpdateAllowed: $immediateUpdateAllowed, '
      'flexibleUpdateAllowed: $flexibleUpdateAllowed, '
      'availableVersionCode: $availableVersionCode, '
      'installStatus: $installStatus, '
      'packageName: $packageName, '
      'clientVersionStalenessDays: $clientVersionStalenessDays, '
      'updatePriority: $updatePriority}';
}
