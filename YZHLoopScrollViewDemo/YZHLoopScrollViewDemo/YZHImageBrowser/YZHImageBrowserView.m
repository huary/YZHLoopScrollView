//
//  YZHImageBrowserView.m
//  YZHLoopScrollViewDemo
//
//  Created by yuan on 2019/8/11.
//  Copyright © 2019 yuan. All rights reserved.
//

#import "YZHImageBrowserView.h"
#import "YZHImageCell.h"

@implementation YZHImageBrowserView


- (BOOL)panGestureRecognizer:(UIPanGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIPanGestureRecognizer *)otherPanGestureRecognizer
{
    BOOL ret = [super panGestureRecognizer:gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:otherPanGestureRecognizer];
    return ret;
}

- (BOOL)panGestureRecognizerShouldBegin:(UIPanGestureRecognizer *)panGestureRecognizer
{
    BOOL ret = [super panGestureRecognizerShouldBegin:panGestureRecognizer];
    if (ret == NO) {
        return ret;
    }
    
    CGPoint ts = [panGestureRecognizer translationInView:panGestureRecognizer.view];
    YZHImageCell *currentShowCell = (YZHImageCell*)self.loopScrollView.currentShowCell;
    
    UIScrollView *scrollView = currentShowCell.zoomView.scrollView;
    CGSize size = scrollView.bounds.size;
    CGSize contentSize = scrollView.contentSize;
    CGPoint contentOffset = scrollView.contentOffset;
    
    
    if (self.loopScrollView.scrollDirection == YZHLoopViewScrollDirectionHorizontal) {
        if (contentSize.height <= size.height) {
            return YES;
        }
        else {
            if (contentOffset.y<= 0.0 && ts.y > 0.0) {
                return YES;
            }
            else if (contentOffset.y >= contentSize.height - size.height && ts.y < 0) {
                return YES;
            }
        }
    }
    else {
        if (contentSize.width <= size.width) {
            return YES;
        }
        else {
            if (contentOffset.x<= 0.0 && ts.x > 0.0) {
                return YES;
            }
            else if (contentOffset.x >= contentSize.width - size.width && ts.x < 0.0) {
                return YES;
            }
        }
    }
    return NO;
    
}

@end
