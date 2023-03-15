// Copyright (c) Huawei Technologies Co., Ltd. 2021-2021. All rights reserved.

library agconnect_cloudstorage;

import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

part 'src/exception.dart';
part 'src/list_result.dart';
part 'src/metadata.dart';
part 'src/reference.dart';
part 'src/storage.dart';
part 'src/task.dart';
part 'src/task_result.dart';

const MethodChannel _methodChannel =
    MethodChannel('com.huawei.agconnect.cloudstorage/methodChannel/');
