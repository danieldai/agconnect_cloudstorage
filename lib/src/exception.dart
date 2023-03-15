// Copyright (c) Huawei Technologies Co., Ltd. 2021-2021. All rights reserved.

part of agconnect_cloudstorage;

class AGCStorageException implements Exception {
  final String code;
  final String message;
  final String _type;

  const AGCStorageException._({
    required this.code,
    required this.message,
    required String type,
  }) : _type = type;

  factory AGCStorageException._from(dynamic e) {
    if (e is AGCStorageException) {
      return e;
    } else {
      if (e is PlatformException) {
        return AGCStorageException._(
          code: e.code,
          message: e.message ?? 'Something went wrong.',
          type: Map<String, dynamic>.from(
                  e.details ?? <String, dynamic>{})['exceptionType'] ??
              'UnknownException',
        );
      } else {
        return AGCStorageException._(
          code: 'UNKNOWN',
          message: e is String ? e : 'Something went wrong.',
          type: 'PluginException',
        );
      }
    }
  }

  @override
  String toString() {
    return '$AGCStorageException(code: $code, message: $message, type: $_type)';
  }
}
