//
//  ViewController.m
//  YZHLoopScrollViewDemo
//
//  Created by yuan on 2019/8/5.
//  Copyright © 2019 yuan. All rights reserved.
//

#import "ViewController.h"

#import "YZHImageBrowser.h"
#import "YZHImageCellModel.h"
#import "YZHImageBrowserViewController.h"



@interface ViewController ()<YZHImageBrowserDelegate, YZHImageBrowserViewControllerDelegate>

//@property (nonatomic, strong) YZHLoopScrollView *loopScrollView;
//
//@property (nonatomic, strong) YZHLoopCustomCellModel *cellModel;
//
//@property (nonatomic, assign) NSInteger limit;

@property (nonatomic, strong) YZHImageBrowser *imageBrowser;

@property (nonatomic, strong) UIImageView *imageView;

/** <#注释#> */
@property (nonatomic, strong) YZHImageCellModel *showCellModel;

/** <#name#> */
@property (nonatomic, assign) NSInteger maxIdx;

/** <#name#> */
@property (nonatomic, assign) NSInteger minIdx;

/** <#注释#> */
@property (nonatomic, strong) YZHImageBrowserViewController *imageBrowserVC;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.maxIdx = 17;
    self.minIdx = 1;
    [self _test];
//    self.limit = 100;
}

//-(YZHLoopScrollView*)loopScrollView
//{
//    if (_loopScrollView == nil) {
//        _loopScrollView = [[YZHLoopScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
////        _loopScrollView.scrollPageSize =
//        _loopScrollView.delegate = self;
//    }
//    return _loopScrollView;
//}
//
//- (YZHLoopCustomCellModel*)cellModel
//{
//    if (_cellModel == nil) {
//        _cellModel = [YZHLoopCustomCellModel new];
//        _cellModel.text = @"0";
//    }
//    return _cellModel;
//}

- (YZHImageBrowser*)imageBrowser
{
    if (_imageBrowser == nil) {
        _imageBrowser = [YZHImageBrowser new];
        _imageBrowser.delegate = self;
    }
    return _imageBrowser;
}

- (YZHImageBrowserViewController*)imageBrowserVC
{
    if (_imageBrowserVC == nil) {
        _imageBrowserVC = [YZHImageBrowserViewController new];
        _imageBrowserVC.delegate = self;
    }
    return _imageBrowserVC;
}

-(void)_test {
    [self _setupChildView];
}

-(NSString*)_randomImageName
{
    NSInteger random = 2;//arc4random() % 17 + 1;
    NSString *name = [NSString stringWithFormat:@"%@.jpg",@(random)];
    UIImage *image = [UIImage imageNamed:name];
    if (!image) {
        name = [NSString stringWithFormat:@"%@.png",@(random)];
    }
    return name;
}

-(NSString*)_imageNameFrom:(NSInteger)idx next:(BOOL)next
{
    if (next) {
        if (idx >= self.maxIdx) {
            return nil;
        }
        idx = idx + 1;
        NSString *name = [NSString stringWithFormat:@"%@.jpg",@(idx)];
        UIImage *image = [UIImage imageNamed:name];
        if (!image) {
            name = [NSString stringWithFormat:@"%@.png",@(idx)];
        }
        return name;
    }
    else {
        if (idx <= self.minIdx) {
            return nil;
        }
        idx = idx - 1;
        NSString *name = [NSString stringWithFormat:@"%@.jpg",@(idx)];
        UIImage *image = [UIImage imageNamed:name];
        if (!image) {
            name = [NSString stringWithFormat:@"%@.png",@(idx)];
        }
        return name;
    }
}

-(YZHImageCellModel*)_newCellModel
{
    YZHImageCellModel *cellModel = [YZHImageCellModel new];
    cellModel.updateBlock = ^(id<YZHImageCellModelProtocol> model, YZHImageCell *imageCell) {
        YZHImageCellModel *tmp = (YZHImageCellModel *)model;
        imageCell.zoomView.image = tmp.image;
        
    };
    return cellModel;
}

-(YZHImageCellModel*)showCellModel
{
    if (_showCellModel == nil) {
        _showCellModel = [self _newCellModel];
        _showCellModel.imageName = [self _randomImageName];
        _showCellModel.image = [UIImage imageNamed:_showCellModel.imageName];
    }
    return _showCellModel;
}


-(void)_setupChildView
{
    self.imageView = [UIImageView new];
    UIImage *img = self.showCellModel.image;

    CGFloat x = 50;
    CGFloat y = 80;
    CGFloat w = 100;
    CGFloat h = img.size.height * w/ img.size.width;
    
    self.imageView.frame = CGRectMake(x, y, w, h);
    self.imageView.image = img;
    [self.view addSubview:self.imageView];
    
    self.imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapAction:)];
    [self.imageView addGestureRecognizer:tap];
    
//    NSLog(@"tap.view=%@,self.imgView=%@",tap.view,self.imageView);
//    [self.loopScrollView showInView:nil fromView:nil withModel:self.cellModel];
}

//- (YZHLoopCell*)loopScrollView:(YZHLoopScrollView *)loopScrollView cellForModel:(id<YZHLoopCellModelProtocol>)model withReusableCell:(YZHLoopCell *)reusableCell
//{
//    YZHLoopCustomCell *cell = (YZHLoopCustomCell*)reusableCell;
//    if (!cell) {
//        cell = [[YZHLoopCustomCell alloc] init];
//    }
//    return cell;
//}
//
//- (YZHLoopCell*)loopScrollView:(YZHLoopScrollView *)loopScrollView prevCellWithCurrentShowModel:(id<YZHLoopCellModelProtocol>)currentShowModel withReusableCell:(YZHLoopCell *)reusableCell
//{
//    YZHLoopCustomCellModel *showModel = currentShowModel;
//    NSInteger tag = [showModel.text integerValue];
//    if (tag <= -self.limit) {
//        return nil;
//    }
//    YZHLoopCustomCell *cell = nil;//(YZHLoopCustomCell*)reusableCell;
//    if (!cell) {
//        cell = [[YZHLoopCustomCell alloc] init];
//    }
//    YZHLoopCustomCellModel *cellModel = [YZHLoopCustomCellModel new];
//    cellModel.text = [NSString stringWithFormat:@"%@",@(tag - 1)];
//    cell.model = cellModel;
//    return cell;
//}
//
//- (YZHLoopCell*)loopScrollView:(YZHLoopScrollView *)loopScrollView nextCellWithCurrentShowModel:(id<YZHLoopCellModelProtocol>)currentShowModel withReusableCell:(YZHLoopCell *)reusableCell
//{
//    YZHLoopCustomCellModel *showModel = currentShowModel;
//    NSInteger tag = [showModel.text integerValue];
//    if (tag >= self.limit) {
//        return nil;
//    }
//    YZHLoopCustomCell *cell = nil;//(YZHLoopCustomCell*)reusableCell;
//    if (!cell) {
//        cell = [[YZHLoopCustomCell alloc] init];
//    }
//    YZHLoopCustomCellModel *cellModel = [YZHLoopCustomCellModel new];
//    cellModel.text = [NSString stringWithFormat:@"%@",@(tag + 1)];
//    cell.model = cellModel;
//    return cell;
//}


- (void)_tapAction:(UITapGestureRecognizer*)tap
{
    self.imageBrowser.separatorSpace = 20;
//    self.imageBrowser.imageBrowserView.loopScrollView.scrollDirection = YZHLoopViewScrollDirectionVertical;
    [self.imageBrowser showInView:nil fromView:(UIImageView*)tap.view withModel:self.showCellModel];
    
//    self.imageBrowserVC.showCellModel = self.showCellModel;
//    [self presentViewController:self.imageBrowserVC animated:YES completion:nil];
}


- (YZHImageCellModel*)_cellModelForCurrentShowModel:(YZHImageCellModel*)currentShowModel possibleModel:(YZHImageCellModel *)possibleModel next:(BOOL)next
{
    YZHImageCellModel *cellModel = currentShowModel;
    NSString *imgName = cellModel.imageName;
    NSInteger idx = [[[imgName componentsSeparatedByString:@"."] firstObject] integerValue];
    YZHImageCellModel *nextCellModel = nil;
    NSString *nextImgName = [self _imageNameFrom:idx next:next];
    if (nextImgName) {
        if ([possibleModel.imageName isEqualToString:nextImgName]) {
            return possibleModel;
        }
        
        nextCellModel = [self _newCellModel];
        nextCellModel.imageName = nextImgName;
        nextCellModel.image = [UIImage imageNamed:nextCellModel.imageName];
    }
    return nextCellModel;
}

- (id<YZHImageCellModelProtocol>)imageBrowser:(YZHImageBrowser * _Nonnull)imageBrowser nextModelWithCurrentShowModel:(id<YZHImageCellModelProtocol>_Nullable)currentShowModel possibleModel:(id<YZHImageCellModelProtocol> _Nullable)possibleModel
{
    return [self _cellModelForCurrentShowModel:currentShowModel possibleModel:possibleModel next:YES];
}

- (id<YZHImageCellModelProtocol>)imageBrowser:(YZHImageBrowser * _Nonnull)imageBrowser prevModelWithCurrentShowModel:(id<YZHImageCellModelProtocol>_Nullable)currentShowModel possibleModel:(id<YZHImageCellModelProtocol> _Nullable)possibleModel
{
    return [self _cellModelForCurrentShowModel:currentShowModel possibleModel:possibleModel next:NO];
}

- (void)imageBrowser:(YZHImageBrowser * _Nonnull)imageBrowser didTapImageCell:(YZHImageCell*)imageCell
{
    NSLog(@"%s",__FUNCTION__);
}

- (void)imageBrowser:(YZHImageBrowser * _Nonnull)imageBrowser didDoubleTapImageCell:(YZHImageCell*)imageCell
{
    NSLog(@"%s",__FUNCTION__);

}

- (void)imageBrowser:(YZHImageBrowser * _Nonnull)imageBrowser didLongPressImageCell:(YZHImageCell*)imageCell
{
    NSLog(@"%s",__FUNCTION__);
}


#pragma mark YZHImageBrowserViewControllerDelegate
- (YZHImageCellModel *)imageBrowserViewController:(YZHImageBrowserViewController * _Nonnull)imageBrowserViewController nextModelWithCurrentShowModel:(YZHImageCellModel * _Nullable)currentShowModel possibleModel:(YZHImageCellModel * _Nullable)possibleModel
{
    return [self _cellModelForCurrentShowModel:currentShowModel possibleModel:possibleModel next:YES];
}

- (YZHImageCellModel *)imageBrowserViewController:(YZHImageBrowserViewController * _Nonnull)imageBrowserViewController prevModelWithCurrentShowModel:(YZHImageCellModel * _Nullable)currentShowModel possibleModel:(YZHImageCellModel * _Nullable)possibleModel
{
    return [self _cellModelForCurrentShowModel:currentShowModel possibleModel:possibleModel next:NO];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
}




@end
