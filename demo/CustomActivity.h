//
//  CustomActivity.h
//  demo
//
//  Created by tangyuhua on 2017/4/13.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomActivity : UIActivity
@property (nonatomic) UIImage *shareImage;
@property (nonatomic, copy) NSString *URL;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSArray *shareContentArray;
-(instancetype)initWithImage:(UIImage *)shareImage atURL:(NSString *)URL atTitle:(NSString *)title atShareContentArray:(NSArray *)shareContentArray;

@end
