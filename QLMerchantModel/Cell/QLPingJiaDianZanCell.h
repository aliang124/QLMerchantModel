//
//  QLPingJiaDianZanCell.h
//  WQLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCore.h"
#import "QLBusiness.h"
@interface QLPingJiaDianZanItem : RETableViewItem
@end

@interface QLPingJiaDianZanCell : RETableViewCell
@property (strong, readwrite, nonatomic) QLPingJiaDianZanItem *item;
@end
