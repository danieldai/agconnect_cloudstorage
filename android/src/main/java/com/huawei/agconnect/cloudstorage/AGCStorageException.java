/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2021-2021. All rights reserved.
 */

package com.huawei.agconnect.cloudstorage;

import com.huawei.agconnect.cloud.storage.core.StorageException;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import io.flutter.Log;

public class AGCStorageException extends Exception {
    private final String errorCode;
    private final String errorMessage;
    private final Map<String, Object> errorDetails = new HashMap<>();

    public AGCStorageException(String code, String message) {
        this(code, message, "PluginException");
    }

    private AGCStorageException(String code, String message, String exceptionType) {
        this.errorCode = code;
        this.errorMessage = message;
        this.errorDetails.put("exceptionType", exceptionType);

        Log.e("AGCStorageException", String.format(Locale.ENGLISH, "(%s) %s: %s", exceptionType, this.errorCode, this.errorMessage));
    }

    public static AGCStorageException from(Exception e) {
        if (e instanceof AGCStorageException) {
            return (AGCStorageException) e;
        } else {
            if (e instanceof StorageException) {
                return new AGCStorageException(((StorageException) e).getErrorCode() + "", ((StorageException) e).getErrMsg(), "SDKException");
            } else {
                return new AGCStorageException("UNKNOWN", e.getMessage(), "SDKException");
            }
        }
    }

    public String getErrorCode() {
        return this.errorCode;
    }

    public String getErrorMessage() {
        return this.errorMessage;
    }

    public Map<String, Object> getErrorDetails() {
        return this.errorDetails;
    }
}
