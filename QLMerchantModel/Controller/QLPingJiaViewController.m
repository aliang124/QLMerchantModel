//
//  QLPingJiaViewController.m
//  WTDemo
//
//  Created by 计恩良 on 2018/12/31.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLPingJiaViewController.h"
#import "QLMerchantNetWorkingUtil.h"
#import "QLPingJiaHeadView.h"
#import "WTKStarView.h"
#import "UITextView+Placeholder.h"
@interface QLPingJiaViewController ()
@property (nonatomic,copy) NSDictionary *businessInfo;
@property (nonatomic,strong) UILabel *titleLab;
@property (nonatomic,strong) WTKStarView *starView;
@property (nonatomic,strong) UITextView *contentText;
@property (nonatomic,strong) UIButton *btn1;
@property (nonatomic,strong) UIButton *btn2;
@end

@implementation QLPingJiaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.title = @"评价";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, WT_NavBar_Height+26, WTScreenWidth, 15)];
    _titleLab.font = WTFontBoldSys(16);
    _titleLab.textColor = QL_UserName_TitleColor_Black;
    _titleLab.textAlignment = NSTextAlignmentCenter;
    _titleLab.text = @"Lunaluz露娜家亲子餐厅";
    [self.view addSubview:_titleLab];
    
    UIImageView *lineImg = [[UIImageView alloc] initWithFrame:CGRectMake(12, WT_NavBar_Height+64, WTScreenWidth-12-12, 0.5)];
    lineImg.backgroundColor = QL_Border_LineColor;
    [self.view addSubview:lineImg];
    
    UILabel *pingFenLab = [[UILabel alloc] initWithFrame:CGRectMake(12, WT_NavBar_Height+90, 50, 13)];
    pingFenLab.font = WTFontSys(14);
    pingFenLab.textColor = QL_UserName_TitleColor_Black;
    pingFenLab.text = @"评分：";
    [self.view addSubview:pingFenLab];

    _starView = [[WTKStarView alloc]initWithFrame:CGRectMake(pingFenLab.right+20, WT_NavBar_Height+82, 164, 20) starSize:CGSizeZero withStyle:WTKStarTypeInteger];
    _starView.starBlock = ^(NSString *star){
        NSLog(@"%@",star);
    };
    [self.view addSubview:_starView];
    
    UIView *contentBg = [[UIView alloc] initWithFrame:CGRectMake(16, WT_NavBar_Height+124, WTScreenWidth-16-16, 160)];
    contentBg.backgroundColor = WTColorHex(0xFAFAF7);
    contentBg.layer.cornerRadius = 3;
    contentBg.layer.masksToBounds = YES;
    [self.view addSubview:contentBg];
    
    self.contentText = [[UITextView alloc] initWithFrame:CGRectMake(12, 11, contentBg.width-12-12, contentBg.height-11-11)];
    self.contentText.placeholder = @"写下你的关顾体验与其他人一起参与讨论~";
    self.contentText.font = WTFontSys(14);
    self.contentText.backgroundColor = [UIColor clearColor];
    self.contentText.placeholderColor = WTColorHex(0xCCC9BB);
    self.contentText.textColor = QL_UserName_TitleColor_Black;
    [contentBg addSubview:self.contentText];
    
    self.btn1 = [[UIButton alloc] initWithFrame:CGRectMake(11, 12+contentBg.bottom, 24, 24)];
    [self.btn1 setImage:[UIImage imageNamed:@"Radio_nocheck"] forState:UIControlStateNormal];
    [self.btn1 setImage:[UIImage imageNamed:@"Radio_checked"] forState:UIControlStateSelected];
    self.btn1.selected = YES;
    [self.btn1 addTarget:self action:@selector(btn1Press) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn1];

    UILabel *tipLab1 = [[UILabel alloc] initWithFrame:CGRectMake(self.btn1.right+6, contentBg.bottom+19, 40, 11)];
    tipLab1.font = WTFontSys(12);
    tipLab1.textColor = QL_DescColor_Gray;
    tipLab1.text = @"公开";
    [self.view addSubview:tipLab1];
    
    self.btn2 = [[UIButton alloc] initWithFrame:CGRectMake(76, 12+contentBg.bottom, 24, 24)];
    [self.btn2 setImage:[UIImage imageNamed:@"Radio_nocheck"] forState:UIControlStateNormal];
    [self.btn2 setImage:[UIImage imageNamed:@"Radio_checked"] forState:UIControlStateSelected];
    [self.btn2 addTarget:self action:@selector(btn2Press) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn2];

    UILabel *tipLab2 = [[UILabel alloc] initWithFrame:CGRectMake(self.btn2.right+6, contentBg.bottom+19, 140, 11)];
    tipLab2.font = WTFontSys(12);
    tipLab2.textColor = QL_DescColor_Gray;
    tipLab2.text = @"匿名评价";
    [self.view addSubview:tipLab2];
    
    UIButton *commitBtn = [[UIButton alloc] initWithFrame:CGRectMake(8, WTScreenHeight-8-38-WT_SafeArea_BOTTOM, WTScreenWidth-8-8, 38)];
    [commitBtn setBackgroundImage:[WTUtil createImageFromColor:QL_NavBar_BgColor_Yellow] forState:UIControlStateNormal];
    [commitBtn setTitle:@"确认评价" forState:UIControlStateNormal];
    commitBtn.titleLabel.font = WTFontSys(14);
    [commitBtn setTitleColor:QL_UserName_TitleColor_Black forState:UIControlStateNormal];
    commitBtn.layer.cornerRadius = 2;
    commitBtn.layer.masksToBounds = YES;
    [commitBtn addTarget:self action:@selector(commitBtnPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:commitBtn];
}

- (void)btn1Press {
    self.btn1.selected = YES;
    self.btn2.selected = NO;
}

- (void)btn2Press {
    self.btn1.selected = NO;
    self.btn2.selected = YES;
}

- (void)commitBtnPress {
    if (self.contentText.text.length==0) {
        [WTToast makeText:@"请输入评价类容"];
        return;
    }
    if (self.starView.star<=0) {
        [WTToast makeText:@"请给评价打分"];
        return;
    }
}
@end
