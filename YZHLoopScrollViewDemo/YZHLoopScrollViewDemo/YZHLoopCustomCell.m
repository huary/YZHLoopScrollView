//
//  YZHLoopCustomCell.m
//  YZHLoopScrollViewDemo
//
//  Created by yuan on 2019/8/5.
//  Copyright © 2019 yuan. All rights reserved.
//

#import "YZHLoopCustomCell.h"

@interface YZHLoopCustomCell ()

/** <#注释#> */
@property (nonatomic, strong) UILabel *label;

@end

@implementation YZHLoopCustomCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _setupChildView];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.label.frame = self.bounds;
}

-(void)_setupChildView
{
    self.label = [UILabel new];
    self.label.textColor = [UIColor blackColor];
    self.label.font = [UIFont systemFontOfSize:30];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.backgroundColor = [UIColor redColor];
    [self addSubview:self.label];
}

-(void)setModel:(id<YZHLoopCellModelProtocol>)model
{
    [super setModel:model];
    YZHLoopCustomCellModel *cellModel = model;
    self.label.text = cellModel.text;
}

@end
