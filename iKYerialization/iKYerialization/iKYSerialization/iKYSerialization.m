//
//  iKYSerialization.m
//  iKYSerialization
//
//  Created by 郑钦洪 on 15/10/22.
//  Copyright (c) 2015年 Kingsly. All rights reserved.
//

#import "iKYSerialization.h"
#import <objc/message.h>

@implementation iKYSerialization
// 返回self的所有对象名称
+ (NSArray *)propertyOfSelf{
    unsigned int count = 0;
    
    // 1. 获得类中的所有成员变量
    Ivar *ivarList = class_copyIvarList(self, &count);
    
    NSMutableArray *properNames =[NSMutableArray array];
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivarList[i];
        
        // 获得成员属性名
        NSString *name = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
        // 除去下划线，从第一个角标开始截取
        NSString *key = [name substringFromIndex:1];
        
        [properNames addObject:key];
    }
    free(ivarList);
    return [properNames copy];
}

// 归档
- (void)encodeWithCoder:(NSCoder *)enCoder{
    // 取得所有成员变量名
    NSArray *properNames = [[self class] propertyOfSelf];
    
    for (NSString *propertyName in properNames) {
        [enCoder encodeObject:[self valueForKey:propertyName] forKey:propertyName];
    }
}

// 解档
- (id)initWithCoder:(NSCoder *)aDecoder{
    // 取得所有成员变量名
    NSArray *properNames = [[self class] propertyOfSelf];
    
    for (NSString *propertyName in properNames) {
        
        [self setValue:[aDecoder decodeObjectForKey:propertyName] forKey:propertyName];
    }
    return  self;
}

- (NSString *)description{
    NSMutableString *descriptionString = [NSMutableString stringWithFormat:@"\n"];
    // 取得所有成员变量名
    NSArray *properNames = [[self class] propertyOfSelf];
    for (NSString *propertyName in properNames) {
        NSString *propertyNameString = [NSString stringWithFormat:@"%@ - %@\n",propertyName,[self valueForKey:propertyName]];
        [descriptionString appendString:propertyNameString];
    }
    
    return [descriptionString copy];
}
@end
