//
//  YZHImageBrowserViewController.m
//  YZHLoopScrollViewDemo
//
//  Created by yuan on 2019/8/7.
//  Copyright © 2019 yuan. All rights reserved.
//

#import "YZHImageBrowserViewController.h"
#import "YZHImageBrowser.h"
#import "YZHImageCustomCell.h"

@interface YZHImageBrowserViewController () <YZHImageBrowserDelegate, YZHImageCustomCellDelegate>

/**  */
@property (nonatomic, strong) YZHImageBrowser *imageBrowser;

@end

@implementation YZHImageBrowserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _setupDefault];
    
    [self _setupImageBrowserVCChildView];
}


- (YZHImageBrowser*)imageBrowser
{
    if (_imageBrowser == nil) {
        _imageBrowser = [YZHImageBrowser new];
        _imageBrowser.delegate = self;
        _imageBrowser.imageCellClass =[YZHImageCustomCell class];
        _imageBrowser.actionOptions = YZHImageBrowserActionOptionsDoubleTapZoomScale;
    }
    return _imageBrowser;
}

- (void)_setupDefault
{
    self.separatorSpace = 20;
}

- (void)_setupImageBrowserVCChildView
{
    self.view.backgroundColor = [UIColor purpleColor];
    self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    self.modalPresentationStyle = UIModalPresentationOverFullScreen;
    
//    CGFloat dx = 20;
    [self.view addSubview:self.imageBrowser.imageBrowserView];
    self.imageBrowser.imageBrowserView.frame = self.view.bounds;
    self.imageBrowser.separatorSpace = self.separatorSpace;
    [self.showCellModel updateCellModelUpdateBlockWithCellDelegate:self];
    [self.imageBrowser.imageBrowserView.loopScrollView loadViewWithModel:self.showCellModel];    
}

- (void)setSeparatorSpace:(CGFloat)separatorSpace
{
    _separatorSpace = separatorSpace;
    self.imageBrowser.separatorSpace = separatorSpace;
}

#pragma mark YZHImageBrowserDelegate
- (id<YZHImageCellModelProtocol>)imageBrowser:(YZHImageBrowser * _Nonnull)imageBrowser nextModelWithCurrentShowModel:(id<YZHImageCellModelProtocol>_Nullable)currentShowModel possibleModel:(id<YZHImageCellModelProtocol> _Nullable)possibleModel
{
    YZHImageCellModel *cellModel = nil;
    if ([self.delegate respondsToSelector:@selector(imageBrowserViewController:nextModelWithCurrentShowModel:possibleModel:)]) {
        cellModel = [self.delegate imageBrowserViewController:self nextModelWithCurrentShowModel:currentShowModel possibleModel:possibleModel];
    }
    [cellModel updateCellModelUpdateBlockWithCellDelegate:self];
    return cellModel;
}

- (id<YZHImageCellModelProtocol>)imageBrowser:(YZHImageBrowser * _Nonnull)imageBrowser prevModelWithCurrentShowModel:(id<YZHImageCellModelProtocol>_Nullable)currentShowModel possibleModel:(id<YZHImageCellModelProtocol> _Nullable)possibleModel
{
    YZHImageCellModel *cellModel = nil;
    if ([self.delegate respondsToSelector:@selector(imageBrowserViewController:prevModelWithCurrentShowModel:possibleModel:)]) {
        cellModel = [self.delegate imageBrowserViewController:self prevModelWithCurrentShowModel:currentShowModel possibleModel:possibleModel];
    }
    [cellModel updateCellModelUpdateBlockWithCellDelegate:self];
    return cellModel;
}

- (void)imageBrowser:(YZHImageBrowser * _Nonnull)imageBrowser didTapImageCell:(YZHImageCell*)imageCell
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imageBrowser:(YZHImageBrowser * _Nonnull)imageBrowser didDoubleTapImageCell:(YZHImageCell*)imageCell
{
    NSLog(@"%s",__FUNCTION__);
}

- (void)imageBrowser:(YZHImageBrowser * _Nonnull)imageBrowser didLongPressImageCell:(YZHImageCell*)imageCell
{
//    NSLog(@"%s",__FUNCTION__);
}


#pragma mark YZHImageCustomCellDelegate
- (void)imageCustomCell:(YZHImageCustomCell *)cell didClickCustomButton:(UIButton *)button
{
    
}

#pragma mark public
-(void)setButtonType:(ZYImageBrowseButtonType)buttonType
{
    _buttonType = buttonType;
    [self _setupButton];
}

-(void)_setupButton
{
    CGRect frame = CGRectZero;
    switch (self.buttonType) {
//        case ZYImageBrowseButtonTypeSend: {
//
//            frame.size = CGSizeMake(kW_RATIO(123), 52);
//            frame.origin = CGPointMake((self.view.width - frame.size.width)/2, self.view.height - frame.size.height - 46);
//            self.imageBrowseView.button.frame = frame;
//
//            self.imageBrowseView.button.layer.cornerRadius = frame.size.height/2;
//            self.imageBrowseView.button.layer.masksToBounds = YES;
//
//            CAGradientLayer *gradientLayer = [CAGradientLayer layer];
//            gradientLayer.frame = self.imageBrowseView.button.bounds;
//
//            gradientLayer.colors = @[(__bridge id) RGBColor(215, 154, 255).CGColor,
//                                     (__bridge id)RGBColor(126, 159, 254).CGColor];
//
//            gradientLayer.startPoint = CGPointMake(0, 0.5);
//            gradientLayer.endPoint = CGPointMake(1.0, 0.5);
//            //            [self.imageBrowseView.button.layer addSublayer:gradientLayer];
//            [self.imageBrowseView.button.layer insertSublayer:gradientLayer below:self.imageBrowseView.button.imageView.layer];
//
//            self.gradientLayer = gradientLayer;
//
//            self.imageBrowseView.button.titleLabel.font = [LZFontMgr PingFangSC_Medium_size:20];
//            [self.imageBrowseView.button setTitle:ZYLS(@"发送") forState:UIControlStateNormal];
//            [self.imageBrowseView.button setTitleColor:[ZYColor whiteColor] forState:UIControlStateNormal];
//            UIImage *image = [UIImage zy_imageWithIcon:zyIconFontImageBrowseSend color:[ZYColor whiteColor] size:24];
//            [self.imageBrowseView.button setImage:image forState:UIControlStateNormal];
//            [self.imageBrowseView.button setGap:6 position:ZYButtonImageRight];
//            break;
//        }
//        case ZYImageBrowseButtonTypeSave: {
//            [self.gradientLayer removeFromSuperlayer];
//
//            frame.size = CGSizeMake(kW_RATIO(40), kW_RATIO(40));
//            frame.origin = CGPointMake(self.view.width - frame.size.width - 16, self.view.height - frame.size.height - 46);
//            self.imageBrowseView.button.frame = frame;
//            self.imageBrowseView.button.layer.cornerRadius = frame.size.width/2;
//            self.imageBrowseView.button.layer.masksToBounds = YES;
//            self.imageBrowseView.button.backgroundColor = [ZYColor mainColor_01:ZYAlpha_050];
//            self.imageBrowseView.button.titleLabel.font = [LZFontMgr zy_iconFontSize:24];
//            [self.imageBrowseView.button setTitle:zyIconFontImageBrowseSave forState:UIControlStateNormal];
//            [self.imageBrowseView.button setTitleColor:[ZYColor whiteColor] forState:UIControlStateNormal];
//            [self.imageBrowseView.button resetFrameToFitRTL];
//
//            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapAction:)];
//            [self.imageBrowseView addGestureRecognizer:tap];
//            break;
//        }
        default:
            break;
    }
}



@end
