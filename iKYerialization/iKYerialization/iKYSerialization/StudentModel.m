//
//  StudentModel.m
//  iKYSerialization
//
//  Created by 郑钦洪 on 15/10/23.
//  Copyright (c) 2015年 Kingsly. All rights reserved.
//

#import "StudentModel.h"
#import <objc/message.h>

@implementation StudentModel
// 存档的时候需要实现
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.sex forKey:@"sex"];
}
// 解档的时候需要实现
- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.sex  = [aDecoder decodeObjectForKey:@"sex"];
    }
    return self;
}
@end
