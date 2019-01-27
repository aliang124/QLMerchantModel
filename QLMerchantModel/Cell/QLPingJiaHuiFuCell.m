//
//  QLTieBaShopCell.h
//  QLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLPingJiaHuiFuCell.h"
#import "UIImageView+WebImage.h"
#import "QLStarView.h"

@implementation QLPingJiaHuiFuItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 50;
    }
    return self;
}

@end

@interface QLPingJiaHuiFuCell()
{
}
@end

@implementation QLPingJiaHuiFuCell

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
@end
