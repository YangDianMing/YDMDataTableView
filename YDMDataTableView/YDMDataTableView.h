//
//  YDMDataTableView.h
//  YDMDataTableView
//
//  Created by 杨殿铭 on 2016/10/31.
//  Copyright © 2016年 杨殿铭. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YDMDataTableViewCell.h"


@interface YDMDataTableView : UIView <UITableViewDataSource, UITableViewDelegate>

- (instancetype)initWithFrame:(CGRect)frame headerSize:(CGSize)size;
- (void)setHeaderArray:(NSArray*)headerArray dataArray:(NSArray*)dataArray;
- (void)reloadDataTable;

@end
