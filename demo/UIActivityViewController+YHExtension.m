//
//  UIActivityViewController+YHExtension.m
//  demo
//
//  Created by tangyuhua on 2017/4/13.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "UIActivityViewController+YHExtension.h"
@import ObjectiveC;

@implementation UIActivityViewController (YHExtension)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       
        Method original, swizzled;
        original = class_getInstanceMethod(objc_getClass("_UIActivityGroupListViewController"), @selector(numberOfSectionsInCollectionView:));
        swizzled = class_getInstanceMethod(self, @selector(yh_numberOfSectionsInCollectionView:));
        method_exchangeImplementations(original, swizzled);
        
    });
}

#pragma mark - Method Swizzling

- (void)test {
    
    // po [self.view recursiveDescription];
    UIView *p_smallView = self.view.subviews[0];
    
   // UICollectionViewControllerWrapperView *p_wrapperView = p_smallView.subviews[0];
    UICollectionView *p_collectionView = p_smallView.subviews[0].subviews[0] ;
    NSInteger section = [p_collectionView numberOfSections];
    NSInteger row = [p_collectionView numberOfItemsInSection:1];
    
    id dataSource = p_collectionView.dataSource;
  //  PrintObjectMethods(NSStringFromClass([dataSource class]));
    // po [(UIViewController *)dataSource view]
    
}

- (NSInteger)yh_numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

@end
