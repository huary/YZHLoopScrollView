//
//  YZHImageCellModel.h
//  YZHLoopScrollViewDemo
//
//  Created by yuan on 2019/8/7.
//  Copyright © 2019 yuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YZHImageCellModelProtocol.h"
#import "YZHImageCustomCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface YZHImageCellModel : NSObject <YZHImageCellModelProtocol>

@property (nonatomic, copy) YZHImageCellUpdateBlock updateBlock;

@property (nonatomic, copy) YZHImageCellUpdateBlock didUpdateBlock;

@property (nonatomic, copy) YZHImageCellDismissToImageViewBlock dismissToImageViewBlock;

@property (nonatomic, copy) NSString *imageName;

@property (nonatomic, strong) UIImage *image;

@property (nonatomic, strong) id target;

- (void)updateCellModelUpdateBlockWithCellDelegate:(id<YZHImageCustomCellDelegate>)delegate;


@end

NS_ASSUME_NONNULL_END
