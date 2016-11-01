//
//  ViewController.m
//  YDMDataTableView
//
//  Created by 杨殿铭 on 2016/10/31.
//  Copyright © 2016年 杨殿铭. All rights reserved.
//

#import "ViewController.h"
#import "YDMDataTableView.h"

#define kWindowWidth                        ([[UIScreen mainScreen] bounds].size.width)

#define kWindowHeight                       ([[UIScreen mainScreen] bounds].size.height)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray * headerAarray = [[NSArray alloc] initWithObjects:@"Name", @"value1", @"value2", @"value3", @"value4", nil];
    NSMutableArray *dataArray = [NSMutableArray new];
    for (int i = 0 ; i< 50; i++) {
        NSMutableDictionary *dataDict = [NSMutableDictionary new];
        [dataDict setObject:[NSString stringWithFormat:@"name_%d",i] forKey:[headerAarray objectAtIndex:0]];
        [dataDict setObject:[NSString stringWithFormat:@"value1_%d",i] forKey:[headerAarray objectAtIndex:1]];
        [dataDict setObject:[NSString stringWithFormat:@"value2_%d",i] forKey:[headerAarray objectAtIndex:2]];
        [dataDict setObject:[NSString stringWithFormat:@"value3_%d",i] forKey:[headerAarray objectAtIndex:3]];
        [dataDict setObject:[NSString stringWithFormat:@"value4_%d",i] forKey:[headerAarray objectAtIndex:4]];
        [dataArray addObject:dataDict];
    }
    
    YDMDataTableView * table =[[YDMDataTableView alloc] initWithFrame:CGRectMake(0, 20, kWindowWidth, kWindowHeight-20) headerSize:CGSizeMake((kWindowWidth/[headerAarray count]), 50)];
    [table setHeaderArray:headerAarray dataArray:dataArray];
    [self.view addSubview:table];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
