//
//  IKAPIClient.h
//  AcronymFinder
//
//  Created by Satish Kumar R Kancherla on 2/9/16.
//  Copyright © 2016 Satish Kumar R Kancherla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface IKAPIClient : NSObject

+ (IKAPIClient *)instance;

+ (void)findAcronym:(NSString *)acronym success:(void (^)(NSURLSessionDataTask *task, id response))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;
@end
