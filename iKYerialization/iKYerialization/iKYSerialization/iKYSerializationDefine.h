//
//  iKYSerializationDefine.h
//  iKYerialization
//
//  Created by 郑钦洪 on 16/5/23.
//  Copyright © 2016年 iKingsly. All rights reserved.
//

#ifndef iKYSerializationDefine_h
#define iKYSerializationDefine_h
#define iKY_AUTO_SERIALIZATION  \
\
+ (NSArray *)propertyOfSelf{  \
    unsigned int count = 0;  \
    Ivar *ivarList = class_copyIvarList(self, &count); \
    NSMutableArray *properNames =[NSMutableArray array]; \
    for (int i = 0; i < count; i++) { \
        Ivar ivar = ivarList[i]; \
        NSString *name = [NSString stringWithUTF8String:ivar_getName(ivar)]; \
        NSString *key = [name substringFromIndex:1]; \
        [properNames addObject:key]; \
    } \
    free(ivarList); \
    return [properNames copy];\
} \
- (void)encodeWithCoder:(NSCoder *)enCoder{ \
    NSArray *properNames = [[self class] propertyOfSelf]; \
    for (NSString *propertyName in properNames) { \
        [enCoder encodeObject:[self valueForKey:propertyName] forKey:propertyName]; \
    } \
} \
- (id)initWithCoder:(NSCoder *)aDecoder{ \
    NSArray *properNames = [[self class] propertyOfSelf]; \
    for (NSString *propertyName in properNames) { \
        [self setValue:[aDecoder decodeObjectForKey:propertyName] forKey:propertyName]; \
    } \
    return  self; \
} \
- (NSString *)description{ \
    NSMutableString *descriptionString = [NSMutableString stringWithFormat:@"\n"]; \
    NSArray *properNames = [[self class] propertyOfSelf]; \
    for (NSString *propertyName in properNames) { \
        NSString *propertyNameString = [NSString stringWithFormat:@"%@ - %@\n",propertyName,[self valueForKey:propertyName]]; \
        [descriptionString appendString:propertyNameString]; \
    } \
    return [descriptionString copy]; \
}

#endif /* iKYSerializationDefine_h */
