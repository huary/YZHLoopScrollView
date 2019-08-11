//
//  YZHLoopCustomCellModel.h
//  YZHLoopScrollViewDemo
//
//  Created by yuan on 2019/8/5.
//  Copyright © 2019 yuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YZHLoopCellModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface YZHLoopCustomCellModel : NSObject <YZHLoopCellModelProtocol>

/** <#注释#> */
@property (nonatomic, copy) NSString *text;

@end

NS_ASSUME_NONNULL_END
