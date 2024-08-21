/// An enumeration of version requirement statuses for app updates.
///
/// The `VersionRequiredStatus` enum defines whether an app update is optional or required.
/// This can be used to determine the behavior of the update dialog and how the app handles
/// the availability of new versions.
enum VersionRequiredStatus {
  optional, // The update is optional and the user can choose to ignore it.
  require, // The update is mandatory and the user must update to continue using the app.
}
