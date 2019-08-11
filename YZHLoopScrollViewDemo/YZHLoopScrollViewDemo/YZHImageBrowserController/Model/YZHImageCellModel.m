//
//  YZHImageCellModel.m
//  YZHLoopScrollViewDemo
//
//  Created by yuan on 2019/8/7.
//  Copyright © 2019 yuan. All rights reserved.
//

#import "YZHImageCellModel.h"

@implementation YZHImageCellModel

- (void)updateCellModelUpdateBlockWithCellDelegate:(id<YZHImageCustomCellDelegate>)delegate
{
    __weak typeof(delegate) weakDelegate = delegate;
    if (self.updateBlock) {
        YZHImageCellUpdateBlock updageBlock = self.updateBlock;
        self.updateBlock = ^(id<YZHImageCellModelProtocol> model, YZHImageCell *imageCell) {
            updageBlock(model, imageCell);
            YZHImageCustomCell *cell = (YZHImageCustomCell*)imageCell;
//            imageCell.delegate = weakDelegate;
            cell.customCellDelegate = weakDelegate;
        };
    }
    else {
        self.updateBlock = ^(id<YZHImageCellModelProtocol> model, YZHImageCell *imageCell) {
            YZHImageCellModel *cellModel = (YZHImageCellModel*)model;
            imageCell.zoomView.image = cellModel.image;
            YZHImageCustomCell *cell = (YZHImageCustomCell*)imageCell;
//            imageCell.delegate = weakDelegate;
            cell.customCellDelegate = weakDelegate;
        };
    }
}

@end
