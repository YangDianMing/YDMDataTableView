//
//  YDMDataTableView.m
//  YDMDataTableView
//
//  Created by 杨殿铭 on 2016/10/31.
//  Copyright © 2016年 杨殿铭. All rights reserved.
//

#import "YDMDataTableView.h"

#define UIColorRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

@interface YDMDataTableView ()
{
    float headerTotalWidth;
}

@property (nonatomic, strong) UIView * contentView;
@property (nonatomic, strong) UITableView *myTableView;

@property (nonatomic, strong) NSArray * headerArray;
@property (nonatomic, strong) NSArray * dataArray;
@property (nonatomic, assign) CGFloat headerWidth;
@property (nonatomic, assign) CGFloat headerHeight;

@end

@implementation YDMDataTableView

- (instancetype)initWithFrame:(CGRect)frame headerSize:(CGSize)size
{
    self = [super initWithFrame:frame];
    if(self){
        _headerWidth = size.width;
        _headerHeight = size.height;
    }
    return self;
}

- (void)setHeaderArray:(NSArray*)headerArray dataArray:(NSArray*)dataArray
{
    _headerArray = headerArray;
    _dataArray = dataArray;
    headerTotalWidth = _headerWidth * [headerArray count];
    [self setupViews];
}

- (void)reloadDataTable
{
    if(_contentView != nil){
        [_contentView removeFromSuperview];
        _contentView = nil;
        [self setupViews];
    }else{
        [self setupViews];
    }
}

- (void)setupViews
{
    if(_contentView == nil){
        //初始化内容
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width , self.frame.size.height)];
        [self addSubview:_contentView];
        //初始化表格
        UITableView *tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, headerTotalWidth, _contentView.frame.size.height) style:UITableViewStylePlain];
        tableView.delegate=self;
        tableView.dataSource=self;
        tableView.bounces=NO;
        self.myTableView=tableView;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //初始化滚动视图
        UIScrollView *myScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, _contentView.frame.size.width, _contentView.frame.size.height)];
        [myScrollView addSubview:tableView];
        myScrollView.bounces=NO;
        [myScrollView setShowsHorizontalScrollIndicator:NO];
        myScrollView.contentSize=CGSizeMake(headerTotalWidth, 0);
        //        [myScrollView showBorder];
        [_contentView addSubview:myScrollView];
        
    }
}

#pragma mark

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier=@"cell";
    if(indexPath.row == [_dataArray count]-1){
        cellIdentifier = @"lastCell";
    }
    YDMDataTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    //if(cell==nil){
        cell=[[YDMDataTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:cellIdentifier
                                              itemSize:CGSizeMake(_headerWidth, _headerHeight)
                                           headerArray:_headerArray];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    //}
    
    cell.dataDict=[_dataArray objectAtIndex:indexPath.row];
    
    if (indexPath.row %2 == 1) {
        cell.backgroundColor = UIColorRGBA(240, 240, 240, 1);
    }
    
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *tableViewHeadView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [_headerArray count]*_headerWidth, _headerHeight)];
    [tableViewHeadView setBackgroundColor:UIColorRGBA(25, 37, 51, 1)];//[UIColor whiteColor]
    for(int i = 0 ; i < [_headerArray count] ; i++){
        UILabel *headLabel=[[UILabel alloc]initWithFrame:CGRectMake(i*_headerWidth, 0, _headerWidth, _headerHeight)];
        [headLabel setText:[_headerArray objectAtIndex:i]];
        [headLabel setTextAlignment:NSTextAlignmentCenter];
        [headLabel setAdjustsFontSizeToFitWidth:YES];//自动适应行高
        headLabel.font = [UIFont systemFontOfSize:16];//头行字体
        headLabel.textColor = [UIColor whiteColor];
        [tableViewHeadView addSubview:headLabel];
    }
    
    return tableViewHeadView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return _headerHeight;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return _headerHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


#pragma mark - MSInventoryItemViewDelegate Methods

- (void)setSelectItemView:(UITableView *)tableViewCell indexPath:(NSIndexPath *)indexPath
{
    
}

@end
