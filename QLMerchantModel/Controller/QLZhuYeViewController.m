//
//  QLZhuYeViewController.m
//  WTDemo
//
//  Created by 计恩良 on 2018/12/31.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLZhuYeViewController.h"
#import "QLMerchantNetWorkingUtil.h"
@interface QLZhuYeViewController ()
@property (nonatomic,copy) NSDictionary *businessInfo;
@end

@implementation QLZhuYeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.title = @"主页";
//    [self getData];
}

- (void)getData {
    [WTLoadingView1 showLoadingInView:self.view];
    [QLMerchantNetWorkingUtil getBusinessDetail:self.businessId successHandler:^(id json) {
        [WTLoadingView1 hideAllLoadingForView:self.view];
        self.businessInfo = json[@"businessInfo"][0];
        [self initForm];
    } failHandler:^(NSString *message) {
        [WTLoadingView1 hideAllLoadingForView:self.view];
        [WTLoadFailView showFailInView:self.view retryPress:^{
            [self getData];
        }];
    }];
}

- (void)initForm {
    self.navBar.title = [WTUtil strRelay:self.businessInfo[@"name"]];
    [self.navBar setNeedsLayout];
    
    WT(bself);
    NSMutableArray *sectionArray = [NSMutableArray array];
    RETableViewSection *section0 = [RETableViewSection section];


    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    [self.formTable reloadData];
}
@end
