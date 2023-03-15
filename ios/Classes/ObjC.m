// Copyright (c) Huawei Technologies Co., Ltd. 2021. All rights reserved.

#import "ObjC.h"

@implementation ObjC 

+ (BOOL)catchException:(void(^)(void))tryBlock error:(__autoreleasing NSError **)error {
    @try {
        tryBlock();
        return YES;
    }
    @catch (NSException *exception) {
        *error = [[NSError alloc] initWithDomain:exception.reason code:0 userInfo:exception.userInfo];
        return NO;
    }
}


@end
