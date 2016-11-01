//
//  YDMDataTableViewCell.h
//  YDMDataTableView
//
//  Created by LeeSungJu on 2015. 7. 31..
//  Copyright (c) 2015년 LeeSungJu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YDMDataTableViewCell : UITableViewCell
@property (nonatomic,strong) NSDictionary * dataDict;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier itemSize:(CGSize)size headerArray:(NSArray*)headerArray;

@end
