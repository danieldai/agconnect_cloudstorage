// Copyright (c) Huawei Technologies Co., Ltd. 2021-2021. All rights reserved.

part of agconnect_cloudstorage;

/// File metadata. Operations related to directory metadata are not supported.
class AGCStorageMetadata {
  /// Reference to a file or directory.
  final AGCStorageReference storageReference;

  /// Name of a file on the cloud.
  final String name;

  /// Path to a file on the cloud. For example: images/demo.jpg
  final String path;

  /// Size of a file on the cloud, in bytes.
  final int size;

  /// Name of a storage instance.
  final String bucket;

  /// Cache control setting of a user.
  final String cacheControl;

  /// Content type of a file on the cloud.
  final String contentType;

  /// Content disposition setting of a user.
  final String contentDisposition;

  /// Content encoding setting of a user.
  final String contentEncoding;

  /// Content language setting of a user.
  final String contentLanguage;

  /// SHA-256 value set during file upload.
  final String sha256Hash;

  /// Custom attributes.
  final Map<String, String> customMetadata;

  /// Creation time.
  final DateTime creationTime;

  /// Last update time.
  final DateTime updatedTime;

  AGCStorageMetadata._(this.storageReference, Map<String, dynamic> metadata)
      : name = metadata['name'],
        path = metadata['path'],
        size = metadata['size'],
        bucket = metadata['bucket'],
        cacheControl = metadata['cacheControl'],
        contentType = metadata['contentType'],
        contentDisposition = metadata['contentDisposition'],
        contentEncoding = metadata['contentEncoding'],
        contentLanguage = metadata['contentLanguage'],
        sha256Hash = metadata['sha256Hash'],
        customMetadata = Map<String, String>.from(metadata['customMetadata']),
        creationTime = DateTime.parse(metadata['creationTimeMillis']),
        updatedTime = DateTime.parse(metadata['updatedTimeMillis']);

  @override
  String toString() {
    return '$AGCStorageMetadata(name: $name, path: $path, size: $size, bucket: $bucket, cacheControl: $cacheControl, '
        'contentType: $contentType, contentDisposition: $contentDisposition, contentEncoding: $contentEncoding, '
        'contentLanguage: $contentLanguage, sha256Hash: $sha256Hash, creationTime: $creationTime, updatedTime: $updatedTime, '
        'customMetadata: $customMetadata)';
  }
}

/// File settable metadata. Operations related to directory metadata are not supported.
class AGCStorageSettableMetadata {
  /// Cache control setting for the standard HTTP header.
  final String? cacheControl;

  /// Content type setting for the standard HTTP header.
  final String? contentType;

  /// Content disposition setting for the standard HTTP header.
  final String? contentDisposition;

  /// Content encoding setting for the standard HTTP header.
  final String? contentEncoding;

  /// Content language setting for the standard HTTP header.
  final String? contentLanguage;

  /// SHA-256 value for file upload verification.
  /// This parameter is invalid when metadata is updated.
  final String? sha256Hash;

  /// Custom attributes, which are case insensitive and must comply with the standard HTTP header specifications.
  final Map<String, String>? customMetadata;

  const AGCStorageSettableMetadata({
    this.cacheControl,
    this.contentType,
    this.contentDisposition,
    this.contentEncoding,
    this.contentLanguage,
    this.sha256Hash,
    this.customMetadata,
  });

  Map<String, dynamic> _toMap() {
    return <String, dynamic>{
      'cacheControl': cacheControl,
      'contentType': contentType,
      'contentDisposition': contentDisposition,
      'contentEncoding': contentEncoding,
      'contentLanguage': contentLanguage,
      'sha256Hash': sha256Hash,
      'customMetadata': customMetadata,
    };
  }
}
