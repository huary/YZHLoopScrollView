//
//  YZHImageCellModelProtocol.h
//  YZHLoopScrollViewDemo
//
//  Created by yuan on 2019/8/6.
//  Copyright © 2019 yuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YZHImageCell.h"
#import "YZHLoopCellModelProtocol.h"

@protocol YZHImageCellModelProtocol;

typedef void(^YZHImageCellUpdateBlock)(id<YZHImageCellModelProtocol> model, YZHImageCell *imageCell);

typedef UIImageView*(^YZHImageCellDismissToImageViewBlock)(id<YZHImageCellModelProtocol> model, YZHImageCell *imageCell);


@protocol YZHImageCellModelProtocol <YZHLoopCellModelProtocol>

@property (nonatomic, copy) YZHImageCellUpdateBlock updateBlock;

@property (nonatomic, copy) YZHImageCellUpdateBlock didUpdateBlock;

@property (nonatomic, copy) YZHImageCellDismissToImageViewBlock dismissToImageViewBlock;

@end
