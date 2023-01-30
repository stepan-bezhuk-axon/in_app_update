enum AppUpdateResult {
  /// The user has accepted the update. For immediate updates, you might not receive this callback because the update should already be completed by Google Play by the time the control is given back to your app.
  success,

  /// The user has denied or cancelled the update.
  userDeniedUpdate,

  /// Some other error prevented either the user from providing consent or the update to proceed.
  inAppUpdateFailed,
}