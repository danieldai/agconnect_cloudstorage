/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2021-2021. All rights reserved.
 */

package com.huawei.agconnect.cloudstorage;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

public class AGCStorageMethodHandler implements MethodCallHandler {
    private final FlutterPluginBinding flutterPluginBinding;

    public AGCStorageMethodHandler(@NonNull FlutterPluginBinding flutterPluginBinding) {
        this.flutterPluginBinding = flutterPluginBinding;
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        try {
            if (call.method.startsWith("AGCStorage#")) {
                AGCStorage.getInstance(flutterPluginBinding).innerMethodHandler(call, result);
            } else if (call.method.startsWith("AGCStorageReference#")) {
                AGCStorageReference.getInstance(flutterPluginBinding).innerMethodHandler(call, result);
            } else if (call.method.startsWith("AGCStorageTask#")) {
                AGCStorageTask.getInstance().innerMethodHandler(call, result);
            } else {
                result.notImplemented();
            }
        } catch (RuntimeException | AGCStorageException e) {
            final AGCStorageException exception = AGCStorageException.from(e);
            result.error(exception.getErrorCode(), exception.getErrorMessage(), exception.getErrorDetails());
        }
    }
}
