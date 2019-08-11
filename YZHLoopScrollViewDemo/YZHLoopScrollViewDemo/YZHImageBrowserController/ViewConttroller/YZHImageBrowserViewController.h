//
//  YZHImageBrowserViewController.h
//  YZHLoopScrollViewDemo
//
//  Created by yuan on 2019/8/7.
//  Copyright © 2019 yuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YZHImageCellModel.h"

typedef NS_ENUM(NSInteger, ZYImageBrowseButtonType)
{
    ZYImageBrowseButtonTypeSend = 0,
    ZYImageBrowseButtonTypeSave = 1,
};

@class YZHImageBrowserViewController;
@protocol YZHImageBrowserViewControllerDelegate <NSObject>

- (YZHImageCellModel *_Nullable)imageBrowserViewController:(YZHImageBrowserViewController * _Nonnull)imageBrowserViewController nextModelWithCurrentShowModel:(YZHImageCellModel * _Nullable)currentShowModel possibleModel:(YZHImageCellModel *_Nullable)possibleModel;

- (YZHImageCellModel *_Nullable)imageBrowserViewController:(YZHImageBrowserViewController * _Nonnull)imageBrowserViewController prevModelWithCurrentShowModel:(YZHImageCellModel * _Nullable)currentShowModel possibleModel:(YZHImageCellModel *_Nullable)possibleModel;

- (void)imageBrowserViewController:(YZHImageBrowserViewController * _Nonnull)imageBrowserViewController didClickButton:(UIButton *_Nonnull)button;

@end

NS_ASSUME_NONNULL_BEGIN

@interface YZHImageBrowserViewController : UIViewController

@property (nonatomic, weak) id<YZHImageBrowserViewControllerDelegate> delegate;

//默认20
@property (nonatomic, assign) CGFloat separatorSpace;

@property (nonatomic, strong) YZHImageCellModel *showCellModel;

@property (nonatomic, assign) ZYImageBrowseButtonType buttonType;



@end

NS_ASSUME_NONNULL_END
