//
//  AppKeyChain.h
//  camera
//
//  Created by Long Vu on 4/4/19.
//  Copyright © 2019 IoT FTEL. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppKeyChain : NSObject
+ (AppKeyChain *) shared;
-(NSString *)IMEI;
@end

NS_ASSUME_NONNULL_END
