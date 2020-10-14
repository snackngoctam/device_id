//
//  AppKeyChain.m
//  camera
//
//  Created by Long Vu on 4/4/19.
//  Copyright © 2019 IoT FTEL. All rights reserved.
//

#import "AppKeyChain.h"
#import "FDKeychain.h"

@implementation AppKeyChain

static AppKeyChain *shareManager;
+ (AppKeyChain * )shared {
    return shareManager ? shareManager : [[AppKeyChain alloc]init];
}
- (id) init{
    static dispatch_once_t once;
    dispatch_once(&once ,^{
        shareManager = self;
    });
    self = shareManager;
    return self;
}

static NSString * const KeychainItem_Service = @"AppKeyChain";
static NSString * const KeychainItem_UUID = @"Local";

-(NSString *)IMEI {
    NSString *CFUUID = nil;
    
    if (![FDKeychain itemForKey: KeychainItem_UUID
                     forService: KeychainItem_Service
                          error: nil]) {
        CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
        
        CFUUID = (NSString *)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault, uuid));
        
        [FDKeychain saveItem: CFUUID
                      forKey: KeychainItem_UUID
                  forService: KeychainItem_Service
                       error: nil];
        
    } else {
        CFUUID = [FDKeychain itemForKey: KeychainItem_UUID
                             forService: KeychainItem_Service
                                  error: nil];
    }
    
    return CFUUID;
}



@end
