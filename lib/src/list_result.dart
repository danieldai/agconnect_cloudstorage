// Copyright (c) Huawei Technologies Co., Ltd. 2021-2021. All rights reserved.

part of agconnect_cloudstorage;

class AGCStorageListResult {
  /// References to all files in the list.
  final List<AGCStorageReference> fileList;

  /// References to all directories in the list.
  final List<AGCStorageReference> dirList;

  /// Pagination identifier for pagination query.
  final String? pageMarker;

  AGCStorageListResult._(AGCStorage storage, Map<String, dynamic> map)
      : fileList = List<String>.from(map['fileList'] ?? <String>[])
            .map((String path) => AGCStorageReference._(storage, path))
            .toList(growable: false),
        dirList = List<String>.from(map['dirList'] ?? <String>[])
            .map((String path) => AGCStorageReference._(storage, path))
            .toList(growable: false),
        pageMarker = map['pageMarker'];

  @override
  String toString() {
    return '$AGCStorageListResult(fileList: $fileList, dirList: $dirList, pageMarker: $pageMarker)';
  }
}
