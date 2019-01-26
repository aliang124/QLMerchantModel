//
//  QLBottomView.m
//  WTDemo
//
//  Created by 计恩良 on 2019/1/26.
//  Copyright © 2019年 计恩良. All rights reserved.
//

#import "QLBottomView.h"

@implementation QLBottomView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        float width = (WTScreenWidth-8-8-8)/2;
        
        WTCustomButton *leftBtn = [[WTCustomButton alloc] initWithFrame:CGRectMake(8, 8, width, 38)];
        [self setRounct:leftBtn titleText:@"我要评价"];
        [self addSubview:leftBtn];
        
        WTCustomButton *rightBtn = [[WTCustomButton alloc] initWithFrame:CGRectMake(leftBtn.right+8, 8, width, 38)];
        [self setRounct:rightBtn titleText:@"商家主页"];
        [self addSubview:rightBtn];
    }
    return self;
}

- (void)setRounct:(WTCustomButton *)btn titleText:(NSString *)titleText {
    btn.layer.cornerRadius = 4;
    btn.layer.borderColor = QL_Border_LineColor.CGColor;
    btn.layer.borderWidth = 0.5;
    [btn setBackgroundImage:[WTUtil createImageFromColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [btn setBackgroundImage:[WTUtil createImageFromColor:WTColorHex(0xFAFAF7)] forState:UIControlStateHighlighted];
    
}
@end
