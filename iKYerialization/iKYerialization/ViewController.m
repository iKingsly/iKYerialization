//
//  ViewController.m
//  iKYerialization
//
//  Created by 郑钦洪 on 15/10/23.
//  Copyright (c) 2015年 iKingsly. All rights reserved.
//

#import "ViewController.h"
#import "StudentModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *file = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"person.data"];
    StudentModel *student = [[StudentModel alloc] init];
    student.name = @"ikingsly";
    student.sex  = @"man";
    [NSKeyedArchiver archiveRootObject:student toFile:file];
    
    StudentModel *Kingsly = [[StudentModel alloc] init];
    Kingsly = [NSKeyedUnarchiver unarchiveObjectWithFile:file];
    NSLog(@"%@",Kingsly);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
