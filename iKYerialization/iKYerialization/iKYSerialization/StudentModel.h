//
//  StudentModel.h
//  iKYSerialization
//
//  Created by 郑钦洪 on 15/10/23.
//  Copyright (c) 2015年 Kingsly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iKYSerializationDefine.h"
@interface StudentModel : NSObject
/** name */
@property (nonatomic,copy) NSString *name;
/** sex */
@property (nonatomic,copy) NSString *sex;

/** classNumber */
@property (nonatomic,copy) NSString *classNumber;

@property (nonatomic, assign)  int age;
@end
