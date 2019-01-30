//
//  QLTieBaShopCell.h
//  QLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLZhuYeHeadCell.h"
#import "UIImageView+WebImage.h"

@implementation QLZhuYeHeadItem

- (id)init{
    if (self = [super init]) {
        self.cellHeight = 154;
    }
    return self;
}

@end

@interface QLZhuYeHeadCell()
{
    UIImageView *userIcon;
    UILabel *userNameLab;
    UILabel *cityLab;
    UILabel *ageLab;
}
@end

@implementation QLZhuYeHeadCell
@dynamic item;

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = [UIColor whiteColor];
    
    UIImageView *bgImg = [[UIImageView alloc] initWithFrame:CGRectMake(12, 0, WTScreenWidth-12-12, 154)];
    [bgImg setImage:[UIImage imageNamed:@"zhuyeBg"]];
    [self.contentView addSubview:bgImg];
    
    userIcon = [[UIImageView alloc] initWithFrame:CGRectMake((WTScreenWidth-52)/2, 20, 52, 52)];
    userIcon.layer.cornerRadius = 26;
    userIcon.layer.masksToBounds = YES;
    [self.contentView addSubview:userIcon];
    
    userNameLab = [[UILabel alloc] initWithFrame:CGRectMake(0, userIcon.bottom+6, WTScreenWidth, 13)];
    userNameLab.font = WTFontBoldSys(14);
    userNameLab.textAlignment = NSTextAlignmentCenter;
    userNameLab.textColor = QL_UserName_TitleColor_Black;
    [self.contentView addSubview:userNameLab];
    
    cityLab = [[UILabel alloc] initWithFrame:CGRectMake(0, userNameLab.bottom+7, (WTScreenWidth/2)-10, 9)];
    cityLab.font = WTFontSys(10);
    cityLab.textColor = QL_UserName_TitleColor_Black;
    cityLab.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:cityLab];

    UIImageView *lineImg = [[UIImageView alloc] initWithFrame:CGRectMake(WTScreenWidth/2, cityLab.top, 0.5, 10)];
    lineImg.backgroundColor = QL_UserName_TitleColor_Black;
    [self.contentView addSubview:lineImg];
    
    ageLab = [[UILabel alloc] initWithFrame:CGRectMake((WTScreenWidth/2)+10, userNameLab.bottom+7, (WTScreenWidth/2)-10, 9)];
    ageLab.font = WTFontSys(10);
    ageLab.textColor = QL_UserName_TitleColor_Black;
    [self.contentView addSubview:ageLab];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)cellWillAppear
{
    [super cellWillAppear];
    NSDictionary *dic = self.item.info;
    [userIcon setWebImageWithUrl:[WTUtil strRelay:self.item.info[@"image"]] placeHolder:[WTUtil createImageFromColor:QL_DateTextColor_Gray]];
    userNameLab.text = [WTUtil strRelay:self.item.info[@"nickName"]];
    cityLab.text = @"合肥";//[WTUtil strRelay:self.item.info[@"city"]];
    ageLab.text = @"3岁宝妈";
}

@end
