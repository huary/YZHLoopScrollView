//
//  YZHImageCellModel.h
//  YZHLoopScrollViewDemo
//
//  Created by yuan on 2019/8/7.
//  Copyright © 2019 yuan. All rights reserved.
//

#import "YZHImageBrowser.h"

NS_ASSUME_NONNULL_BEGIN

@interface YZHImageCellModel : NSObject <YZHImageCellModelProtocol>

@property (nonatomic, copy) YZHImageCellUpdateBlock updateBlock;

//该model绑定的cell
@property (nonatomic, weak) YZHImageCell *bindImageCell;

/** imageView的contentMode */
@property (nonatomic, assign) UIViewContentMode imageViewContentMode;

/** 是否已经到尽头 */
@property (nonatomic, assign) BOOL isEnd;

@property (nonatomic, strong) id target;

@end

NS_ASSUME_NONNULL_END
