// Copyright (c) Huawei Technologies Co., Ltd. 2021. All rights reserved.

#import "AGCStoragePlugin.h"
#if __has_include(<agconnect_cloudstorage/agconnect_cloudstorage-Swift.h>)
#import <agconnect_cloudstorage/agconnect_cloudstorage-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "agconnect_cloudstorage-Swift.h"
#endif

@implementation AGCStoragePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [AGConnectStoragePluginHandler registerWithRegistrar:registrar];
}
@end
