// Copyright (c) Huawei Technologies Co., Ltd. 2021. All rights reserved.

#import <Foundation/Foundation.h>
@interface ObjC : NSObject

+ (BOOL)catchException:(void(^)(void))tryBlock error:(__autoreleasing NSError **)error;
@end
