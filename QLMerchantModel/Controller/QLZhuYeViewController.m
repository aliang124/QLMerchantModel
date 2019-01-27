//
//  QLZhuYeViewController.m
//  WTDemo
//
//  Created by 计恩良 on 2018/12/31.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLZhuYeViewController.h"
#import "QLMerchantNetWorkingUtil.h"
#import "QLZhuYeHeadCell.h"
@interface QLZhuYeViewController ()
@property (nonatomic,copy) NSDictionary *memberInfo;
@end

@implementation QLZhuYeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.title = @"个人主页";
    self.formManager[@"QLZhuYeHeadItem"] = @"QLZhuYeHeadCell";
//    [self getData];
    [self initForm];
}

- (void)getData {
    NSDictionary *param = [NSDictionary dictionaryWithObject:[WTUtil strRelay:self.memberId] forKey:@"memberId"];
    [WTLoadingView1 showLoadingInView:self.view top:WT_NavBar_Height];
    [QLMerchantNetWorkingUtil getZhuYeInfo:param successHandler:^(id json) {
        [WTLoadingView1 hideAllLoadingForView:self.view];
        self.memberInfo = json[@"memberInfo"];
        [self initForm];
    } failHandler:^(NSString *message) {
        [WTLoadingView1 hideAllLoadingForView:self.view];
        [WTLoadFailView showFailInView:self.view retryPress:^{
            [self getData];
        }];
    }];
}

- (void)initForm {
//    self.navBar.title = [WTUtil strRelay:self.businessInfo[@"name"]];
//    [self.navBar setNeedsLayout];
    
    WT(bself);
    NSMutableArray *sectionArray = [NSMutableArray array];
    RETableViewSection *section0 = [RETableViewSection section];

    WTEmptyItem *itEmp = [WTEmptyItem initWithHeight:12];
    itEmp.bgColor = [UIColor whiteColor];
    [section0 addItem:itEmp];

    QLZhuYeHeadItem *itZhuYe = [[QLZhuYeHeadItem alloc] init];
    [section0 addItem:itZhuYe];
    
    
    
    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    [self.formTable reloadData];
}
@end
