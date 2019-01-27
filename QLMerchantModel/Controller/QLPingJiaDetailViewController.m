//
//  QLPingJiaViewController.m
//  WTDemo
//
//  Created by 计恩良 on 2018/12/31.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLPingJiaDetailViewController.h"
#import "QLMerchantNetWorkingUtil.h"
#import "QLPingJiaHeadView.h"

@interface QLPingJiaDetailViewController ()
@property (nonatomic,copy) NSDictionary *commentsData;
@end

@implementation QLPingJiaDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.title = @"评价详情";
    [self getData];
}

- (void)getData {
    [WTLoadingView1 showLoadingInView:self.view top:WT_NavBar_Height];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setObject:[WTUtil strRelay:self.businessId] forKey:@"businessId"];
    [param setObject:[WTUtil strRelay:self.commentId] forKey:@"commentsId"];
    [QLMerchantNetWorkingUtil getPingJiaDetail:param successHandler:^(id json) {
        [WTLoadingView1 hideAllLoadingForView:self.view];
        self.commentsData = json[@"commentsData"];
        [self initForm];
    } failHandler:^(NSString *message) {
        [WTLoadingView1 hideAllLoadingForView:self.view];
        [WTLoadFailView showFailInView:self.view retryPress:^{
            [self getData];
        }];
    }];
}

- (void)initForm {
    WT(bself);
    NSMutableArray *sectionArray = [NSMutableArray array];
    RETableViewSection *section0 = [RETableViewSection section];


    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    [self.formTable reloadData];
}
@end
