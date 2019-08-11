//
//  YZHImageCustomCell.m
//  YZHLoopScrollViewDemo
//
//  Created by yuan on 2019/8/7.
//  Copyright © 2019 yuan. All rights reserved.
//

#import "YZHImageCustomCell.h"

@interface YZHImageCustomCell ()


@end

@implementation YZHImageCustomCell

@synthesize button = _button;


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _setupCustomChildView];
    }
    return self;
}

- (UIButton*)button
{
    if (_button == nil) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button addTarget:self action:@selector(_buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (void)_setupCustomChildView
{
    [self.contentView addSubview:self.button];
//    self.contentView.backgroundColor = [UIColor orangeColor];
}

- (void)_buttonAction:(UIButton*)sender
{
    if ([self.customCellDelegate respondsToSelector:@selector(imageCustomCell:didClickCustomButton:)]) {
        [self.customCellDelegate imageCustomCell:self didClickCustomButton:sender];
    }
}

@end
