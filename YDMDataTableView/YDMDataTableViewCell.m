//
//  YDMDataTableViewCell.m
//  YDMDataTableView
//
//  Created by LeeSungJu on 2015. 7. 31..
//  Copyright (c) 2015년 LeeSungJu. All rights reserved.
//

#import "YDMDataTableViewCell.h"

#define UIColorRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

@implementation YDMDataTableViewCell
{
    UILabel *headLabel;
    UIView * bgView;
    NSMutableArray * labelArray;
    NSMutableArray * bgArray;
    CGSize itemSize;
    NSArray * keyArray;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier itemSize:(CGSize)size headerArray:(NSArray*)headerArray
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        itemSize = size;
        keyArray = headerArray;
        labelArray = [NSMutableArray new];
        bgArray = [NSMutableArray new];
        [self setupLabel];
    }
    return self;
}
//表格内部lable  column
- (void)setupLabel
{
    for (int i = 0; i < [keyArray count]; i++)
    {
        bgView = [[UIView alloc] initWithFrame:CGRectMake(i*itemSize.width, 0, itemSize.width, itemSize.height)];
        [self addSubview:bgView];
        
        //cell元素大小
        headLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, itemSize.width, itemSize.height)];
        [headLabel setAdjustsFontSizeToFitWidth:YES];//自动适应行高
        //headLabel.numberOfLines = 0;
        [headLabel setTextColor:UIColorRGBA(51, 51, 51, 1)];
        headLabel.font = [UIFont systemFontOfSize:14];//换行设置12
        [bgView addSubview:headLabel];
        [labelArray addObject:headLabel];
        [bgArray addObject:bgView];
        
    }
}

-(void)setDataDict:(NSDictionary *)dataDict
{
    _dataDict = dataDict;
    
    for (int i = 0; i < [labelArray count]; i++)
    {
        UILabel * tempLabel = [labelArray objectAtIndex:i];
        
        
        switch (i) {
            case 0:
                [tempLabel setText:[dataDict objectForKey:[keyArray objectAtIndex:i]]];
                [tempLabel setTextAlignment:NSTextAlignmentCenter];
                break;
                
            case 1:
                [tempLabel setText:[dataDict objectForKey:[keyArray objectAtIndex:i]]];
                [tempLabel setTextAlignment:NSTextAlignmentCenter];
                break;
                
            case 2:
                [tempLabel setText:[dataDict objectForKey:[keyArray objectAtIndex:i]]];
                [tempLabel setTextAlignment:NSTextAlignmentCenter];
                break;
                
            case 3:
                [tempLabel setText:[dataDict objectForKey:[keyArray objectAtIndex:i]]];
                [tempLabel setTextAlignment:NSTextAlignmentCenter];
                break;
                
            case 4:
                [tempLabel setText:[dataDict objectForKey:[keyArray objectAtIndex:i]]];
                [tempLabel setTextAlignment:NSTextAlignmentCenter];
                break;
                
            default:
                break;
        }
    }
    
}

@end
