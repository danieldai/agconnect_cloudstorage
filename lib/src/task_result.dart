// Copyright (c) Huawei Technologies Co., Ltd. 2021-2021. All rights reserved.

part of agconnect_cloudstorage;

abstract class AGCStorageTaskResult {
  /// AGCStorageReference instance corresponding to the task.
  final AGCStorageReference storageReference;

  /// Number of transferred bytes.
  final int bytesTransferred;

  /// Total number of bytes.
  final int totalByteCount;

  AGCStorageTaskResult._(this.storageReference, Map<String, dynamic> result)
      : bytesTransferred = result['bytesTransferred'] ?? 0,
        totalByteCount = result['totalByteCount'] ?? 1;
}

/// Result of an upload task.
class AGCStorageUploadResult extends AGCStorageTaskResult {
  /// Metadata of an uploaded file.
  final AGCStorageMetadata? metadata;

  AGCStorageUploadResult._(
      AGCStorageReference storageReference, Map<String, dynamic> result)
      : metadata = Map<String, dynamic>.from(result['metadata']).isNotEmpty
            ? AGCStorageMetadata._(
                storageReference, Map<String, dynamic>.from(result['metadata']))
            : null,
        super._(storageReference, result);

  @override
  String toString() {
    return '$AGCStorageUploadResult(bytesTransferred: $bytesTransferred, totalByteCount: $totalByteCount, metadata: $metadata)';
  }
}

/// Result of a download task.
class AGCStorageDownloadResult extends AGCStorageTaskResult {
  AGCStorageDownloadResult._(
      AGCStorageReference storageReference, Map<String, dynamic> result)
      : super._(storageReference, result);

  @override
  String toString() {
    return '$AGCStorageDownloadResult(bytesTransferred: $bytesTransferred, totalByteCount: $totalByteCount)';
  }
}
