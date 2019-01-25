//
//  QLMerchantQinZiCell.h
//  QLTieBa
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLMerchantQinZiCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"

@implementation QLMerchantQinZiItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 34*QL_MULPITLE;
    }
    return self;
}

@end

@interface QLMerchantQinZiCell()
{
}
@end

@implementation QLMerchantQinZiCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = [UIColor whiteColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)cellWillAppear
{
    [super cellWillAppear];
    int xxx = (int)self.item.qinZiArray.count/2;
    if (self.item.qinZiArray.count%2!=0) {
        xxx = xxx + 1;
    }
    self.item.cellHeight = (16+12+(160*xxx)+(xxx-1)*12)*QL_MULPITLE;
    
    [self.contentView removeAllSubviews];
    float offsetY = 16;
    float offsetX = 12;
    for (int i = 0; i < self.item.qinZiArray.count; i++) {
        int yyy = i/2;
        int xxx = i%2;
        
        offsetY = 16+(160*yyy)+(12*yyy);
        offsetX = 12+(162*xxx)+(12*xxx);
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMakes(offsetX, offsetY, 162, 160)];
        btn.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:btn];
    }
}

@end
