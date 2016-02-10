//
//  IKAcronymModel.m
//  AcronymFinder
//
//  Created by Satish Kumar R Kancherla on 2/9/16.
//  Copyright © 2016 Satish Kumar R Kancherla. All rights reserved.
//

#import "IKAcronymModel.h"

@interface IKAcronymModel()
@property (nonatomic, strong) NSDictionary *data;
@end

@implementation IKAcronymModel

@synthesize data=_data;

- (id)init {
    if (self = [self initWithDictionary:nil]) {
    }
    return self;
}

- (id)initWithDictionary:(NSDictionary *)data {
    if (self = [super init]) {
        _data = data;
        if (_data == nil) {
            _data = [NSDictionary dictionary];
        }
    }
    return self;
}

- (NSArray *)results {
    return self.data[@"lfs"];
}

@end
