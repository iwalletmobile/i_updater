class AppInfo {
  final String? version;
  final String? storeUrl;

  AppInfo({this.version, required this.storeUrl});

  factory AppInfo.fromJson(Map<String, dynamic> json) {
    return AppInfo(
      version: json['version'] as String?,
      storeUrl: json['trackViewUrl'] as String?,
    );
  }
}

class AppStoreResponse {
  final List<AppStoreResult> results;

  AppStoreResponse({required this.results});

  factory AppStoreResponse.fromJson(Map<String, dynamic> json) {
    var list = json['results'] as List;
    List<AppStoreResult> resultsList =
        list.map((i) => AppStoreResult.fromJson(i)).toList();
    return AppStoreResponse(results: resultsList);
  }
}

class AppStoreResult {
  final String trackId;
  final String version;
  final String trackViewUrl;

  AppStoreResult({
    required this.trackId,
    required this.version,
    required this.trackViewUrl,
  });

  factory AppStoreResult.fromJson(Map<String, dynamic> json) {
    return AppStoreResult(
      trackId: json['trackId'],
      version: json['version'],
      trackViewUrl: json['trackViewUrl'],
    );
  }
}
