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
#import "UIImageView+WebImage.h"

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
        [self.contentView addSubview:btn];
        
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMakes(0, 0, 162, 100)];
        [imageV setWebImageWithUrl:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547976453468&di=0730fb64aadc80b0f2490a430f51aebb&imgtype=0&src=http%3A%2F%2Fimg5.duitang.com%2Fuploads%2Fitem%2F201105%2F31%2F20110531094303_d5JZB.jpg" placeHolder:nil];
        [btn addSubview:imageV];
        
        UILabel *tagLab = [[UILabel alloc] init];
        tagLab.font = WTFontSys(10*QL_MULPITLE);
        tagLab.textColor = QL_TagTextColor_Green;
        tagLab.backgroundColor = QL_TagColor_Green;
        tagLab.text = @"西餐";
        tagLab.textAlignment = NSTextAlignmentCenter;
        [btn addSubview:tagLab];
        [tagLab sizeToFit];
        tagLab.left = 20*QL_MULPITLE;
        tagLab.width = tagLab.width+(10*QL_MULPITLE);
        tagLab.top = 106*QL_MULPITLE;
        tagLab.height = 14*QL_MULPITLE;
    }
}

@end
