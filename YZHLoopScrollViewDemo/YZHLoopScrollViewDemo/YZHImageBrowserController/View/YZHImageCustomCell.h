//
//  YZHImageCustomCell.h
//  YZHLoopScrollViewDemo
//
//  Created by yuan on 2019/8/7.
//  Copyright © 2019 yuan. All rights reserved.
//

#import "YZHImageCell.h"

@class YZHImageCustomCell;
@protocol YZHImageCustomCellDelegate <NSObject>

- (void)imageCustomCell:(YZHImageCustomCell *)cell didClickCustomButton:(UIButton*)button;

@end

NS_ASSUME_NONNULL_BEGIN

@interface YZHImageCustomCell : YZHImageCell

@property (nonatomic, strong, readonly) UIButton *button;

@property (nonatomic, weak) id<YZHImageCustomCellDelegate> customCellDelegate;

@end

NS_ASSUME_NONNULL_END
