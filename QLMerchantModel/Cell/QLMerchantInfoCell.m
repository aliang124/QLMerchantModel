//
//  QLMerchantInfoCell.h
//  QLTieBa
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLMerchantInfoCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"

@implementation QLMerchantInfoItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 84;
    }
    return self;
}

@end

@interface QLMerchantInfoCell()
{
}
@end

@implementation QLMerchantInfoCell

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
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}
@end
