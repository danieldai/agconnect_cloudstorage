// Copyright (c) Huawei Technologies Co., Ltd. 2021. All rights reserved.

import Foundation
import AGConnectStorage

class AGCStorageTaskEventHandler: NSObject, FlutterStreamHandler {
    
    var uploadTask: AGCStorageUploadTask?
    var downloadTask: AGCStorageDownloadTask?
    
    func uploadTaskAdd(uploadTask: AGCStorageUploadTask) {
        self.uploadTask = uploadTask
    }
    
    func downloadTaskAdd(downloadTask: AGCStorageDownloadTask) {
        self.downloadTask = downloadTask
    }
    
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        
        if (uploadTask != nil) {
            
            uploadTask!.onSuccess{(result) in
                
                events(FlutterStorageUtils.uploadResultToMap(taskState: "success", uploadResult: result!))
            }.onFailure{ [self](error) in
                
                postError(error: error, result: events)
                
            }.onProgress{(result) in
                events(FlutterStorageUtils.uploadResultToMap(taskState: "progress", uploadResult: result!))
                
            }.onPaused{(result) in
                
                events(FlutterStorageUtils.uploadResultToMap(taskState: "paused", uploadResult: result!))
                
            }.onCancel {
                var map = Dictionary<String, Any>()
                
                map["taskState"] = "canceled"
                events(map)
            }
        } else if (downloadTask != nil) {
            
            downloadTask!.onSuccess{(result) in
                
                events(FlutterStorageUtils.downloadResultToMap(taskState: "success", downloadResult: result!))
            }.onFailure{(error) in
                
                self.postError(error: error, result: events)
            }.onProgress{(result) in
                
                events(FlutterStorageUtils.downloadResultToMap(taskState: "progress", downloadResult: result!))
            }.onPaused{(result) in
                
                events(FlutterStorageUtils.downloadResultToMap(taskState: "paused", downloadResult: result!))
                
            }.onCancel {
                var map = Dictionary<String, Any>()
                
                map["taskState"] = "canceled"
                events(map)
            }
        }
        return nil
    }
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        
        return nil
    }
    
    func postError(error: Error?, result: FlutterEventSink) {
        let error = error as NSError?
        if error?.userInfo["PluginException"] != nil {
            result(FlutterError(
                code: error?.userInfo["PluginException"] as? String ?? "" ,
                message: error?.localizedDescription,
                details: [
                    "exceptionType": "PluginException"
                ]))
        } else {
            result(FlutterError(
                code: error?.code.description ?? "",
                message: error?.localizedDescription,
                details: [
                    "exceptionType": "SDKException"
                ]))
        }
    }
    
}
