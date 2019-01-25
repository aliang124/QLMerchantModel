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
    self.item.cellHeight = (16+12+160+(self.item.qinZiArray.count-1)*12)*QL_MULPITLE;
}

@end
