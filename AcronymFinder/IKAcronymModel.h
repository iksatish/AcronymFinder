//
//  IKAcronymModel.h
//  AcronymFinder
//
//  Created by Satish Kumar R Kancherla on 2/9/16.
//  Copyright © 2016 Satish Kumar R Kancherla. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IKAcronymModel : NSObject
- (id)initWithDictionary:(NSDictionary *)data;

@property (nonatomic, strong) NSArray *results;

@end
