//
//  QLMerchantDetailViewController.m
//  WTDemo
//
//  Created by 计恩良 on 2018/12/31.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLMerchantDetailViewController.h"
#import "WTLoadFailEmpty.h"
#import "QLMerchantNetWorkingUtil.h"
#import "QLMerchantPictureCell.h"
#import "QLMerchantInfoCell.h"
#import "QLPicturesViewController.h"

@interface QLMerchantDetailViewController ()
@property (nonatomic,copy) NSDictionary *businessInfo;
@end

@implementation QLMerchantDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.title = @"商家详情";
    self.formManager[@"QLMerchantPictureItem"] = @"QLMerchantPictureCell";
    self.formManager[@"QLMerchantInfoItem"] = @"QLMerchantInfoCell";
    [self getData];
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

    QLMerchantPictureItem *itPic = [[QLMerchantPictureItem alloc] init];
    itPic.info = self.businessInfo;
    itPic.selectionHandler = ^(id item) {
        QLPicturesViewController *picVC = [[QLPicturesViewController alloc] init];
        [bself.navigationController pushViewController:picVC animated:YES];
    };
    [section0 addItem:itPic];

    QLMerchantInfoItem *itInfo = [[QLMerchantInfoItem alloc] init];
    itInfo.info = self.businessInfo;
    [section0 addItem:itInfo];
    
    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    [self.formTable reloadData];
}
@end
