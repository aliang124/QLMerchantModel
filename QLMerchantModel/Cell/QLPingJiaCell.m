//
//  QLMerchantTitleCell.h
//  QLTieBa
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLPingJiaCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"
#import "UIImageView+WebImage.h"

@implementation QLPingJiaItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 32;
    }
    return self;
}

@end

@interface QLPingJiaCell()
{
    UIView *headPingJiaView;
    UIImageView *starImg1;
    UIImageView *starImg2;
    UIImageView *starImg3;
    UIImageView *starImg4;
    UIImageView *starImg5;
    UILabel *scoreLab;
    UILabel *descLab;
    
    //底部
    UIView *bottomView;
    UILabel *liuYanCountLab;
    UIImageView *liuYanIcon;
    UILabel *liulanCountLab;
    UIImageView *liulanIcon;
    
    UIImageView *lineImg;
}
@end

@implementation QLPingJiaCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    [self createSocreArea];
    [self createDescLab];
    [self createBottomView];
    
    lineImg = [[UIImageView alloc] initWithFrame:CGRectMakes(12, 0, 360-12-12, 0.5)];
    lineImg.backgroundColor = QL_Border_LineColor;
    [self.contentView addSubview:lineImg];

}

- (void)cellWillAppear
{
    [super cellWillAppear];
    [self setScoreAreaValue];
    descLab.text = @"店里很卫生，安全设施很好，吃的很放心味道也挺好，菜都很精致。";
    [descLab sizeToFit];
    [self createPictures];
    
    float pictureHeight = 0;
    if (self.item.pictureArray.count>0) {
        pictureHeight = 96*QL_MULPITLE;
    }
    self.item.cellHeight = descLab.bottom+pictureHeight+(28*QL_MULPITLE);
    
    bottomView.top = self.item.cellHeight- (28*QL_MULPITLE);
    [self setBottomView];
    lineImg.top = self.item.cellHeight-(0.5*QL_MULPITLE);
}

- (void)setBottomView {
    //留言数
    liuYanCountLab.text = @"1214";
    [liuYanCountLab sizeToFit];
    liuYanCountLab.top = (bottomView.height-liuYanCountLab.height)/2;
    liuYanCountLab.left = WTScreenWidth-(16*QL_MULPITLE)-liuYanCountLab.width;
    
    liuYanIcon.top = 9*QL_MULPITLE;
    liuYanIcon.left = liuYanCountLab.left-(15*QL_MULPITLE);
    //浏览数
    liulanCountLab.text = @"1212";
    liulanCountLab.top = 9*QL_MULPITLE;
    [liulanCountLab sizeToFit];
    liulanCountLab.left = liuYanIcon.left-(16*QL_MULPITLE)-liulanCountLab.width;
    
    liulanIcon.top = 9*QL_MULPITLE;
    liulanIcon.left = liulanCountLab.left-(15*QL_MULPITLE);

}
- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)createBottomView {
    bottomView = [[UIView alloc] initWithFrame:CGRectMakes(0, 0, 360, 28)];
    bottomView.userInteractionEnabled = NO;
    [self.contentView addSubview:bottomView];
    //留言数
    liuYanCountLab = [[UILabel alloc] initWithFrame:CGRectMakes(360-12, 9, 9, 7)];
    liuYanCountLab.font = WTFontSys(10*QL_MULPITLE);
    liuYanCountLab.textColor = QL_DescColor_Gray;
    [bottomView addSubview:liuYanCountLab];
    
    liuYanIcon = [[UIImageView alloc] initWithFrame:CGRectMakes(0, 0, 10, 10)];
    [liuYanIcon setImage:[UIImage imageNamed:@"liuyan"]];
    
    //浏览数
    liulanCountLab = [[UILabel alloc] initWithFrame:CGRectMakes(360-12, 9, 9, 7)];
    liulanCountLab.font = WTFontSys(10*QL_MULPITLE);
    liulanCountLab.textColor = QL_DescColor_Gray;
    [bottomView addSubview:liulanCountLab];
    
    liulanIcon = [[UIImageView alloc] initWithFrame:CGRectMakes(0, 0, 10, 10)];
    [liulanIcon setImage:[UIImage imageNamed:@"liulan"]];
    [bottomView addSubview:liulanIcon];
    
    [bottomView addSubview:liuYanIcon];
}

- (void)createPictures {
    [[self.contentView viewWithTag:12345] removeFromSuperview];
    if (self.item.pictureArray.count>0) {
        UIView *pictureView = [[UIView alloc] initWithFrame:CGRectMake(0, descLab.bottom+(8*QL_MULPITLE), WTScreenWidth, 88*QL_MULPITLE)];
        pictureView.userInteractionEnabled = NO;
        pictureView.tag = 12345;
        [self.contentView addSubview:pictureView];
        
        float offsetX = 16;
        for (int i = 0; i < self.item.pictureArray.count; i++) {
            offsetX = 16+(i*100)+(i*14);
            
            UIButton *picBtn = [[UIButton alloc] initWithFrame:CGRectMakes(offsetX, 0, 100, 88)];
            picBtn.backgroundColor = [UIColor redColor];
            [pictureView addSubview:picBtn];
        }
    }
}

- (void)createDescLab {
    descLab = [[UILabel alloc] initWithFrame:CGRectMakes(16, 32, 360-16-21, 12)];
    descLab.font = WTFontSys(QL_MULPITLE*12);
    descLab.textColor = QL_DescColor_Gray;
    descLab.numberOfLines = 0;
    [self.contentView addSubview:descLab];
}

- (void)createSocreArea {
    headPingJiaView = [[UIView alloc] initWithFrame:CGRectMakes(0, 0, 360, 32)];
    headPingJiaView.userInteractionEnabled = NO;
    [self.contentView addSubview:headPingJiaView];
    
    UILabel *pingFenLab = [[UILabel alloc] initWithFrame:CGRectMakes(15, 0, 100, 32)];
    pingFenLab.font = WTFontSys(QL_MULPITLE*10);
    pingFenLab.text = @"评分:";
    pingFenLab.textColor = QL_DescColor_Gray;
    [headPingJiaView addSubview:pingFenLab];
    [pingFenLab sizeToFit];
    pingFenLab.top = (headPingJiaView.height-pingFenLab.height)/2;
    
    starImg1 = [[UIImageView alloc] initWithFrame:CGRectMakes(pingFenLab.right+7, 11.5, 9, 9)];
    [headPingJiaView addSubview:starImg1];
    
    starImg2 = [[UIImageView alloc] initWithFrame:CGRectMakes(starImg1.right+4, 11.5, 9, 9)];
    [headPingJiaView addSubview:starImg2];
    
    starImg3 = [[UIImageView alloc] initWithFrame:CGRectMakes(starImg2.right+4, 11.5, 9, 9)];
    [headPingJiaView addSubview:starImg3];
    
    starImg4 = [[UIImageView alloc] initWithFrame:CGRectMakes(starImg3.right+4, 11.5, 9, 9)];
    [headPingJiaView addSubview:starImg4];
    
    starImg5 = [[UIImageView alloc] initWithFrame:CGRectMakes(starImg4.right+4, 11.5, 9, 9)];
    [headPingJiaView addSubview:starImg5];
    
    scoreLab = [[UILabel alloc] initWithFrame:CGRectMakes(starImg5.right+11, 0, 100, 32)];
    scoreLab.font = WTFontSys(QL_MULPITLE*10);
    scoreLab.textColor = QL_DescColor_Gray;
    [headPingJiaView addSubview:scoreLab];
}

- (void)setScoreAreaValue {
    int starCount = (int)[[WTUtil strRelay:self.item.scoreText] intValue];
    [starImg1 setImage:[UIImage imageNamed:@"starGray"]];
    [starImg2 setImage:[UIImage imageNamed:@"starGray"]];
    [starImg3 setImage:[UIImage imageNamed:@"starGray"]];
    [starImg4 setImage:[UIImage imageNamed:@"starGray"]];
    [starImg5 setImage:[UIImage imageNamed:@"starGray"]];
    if (starCount==1) {
        [starImg1 setImage:[UIImage imageNamed:@"starYellow"]];
        [starImg2 setImage:[UIImage imageNamed:@"starGray"]];
        [starImg3 setImage:[UIImage imageNamed:@"starGray"]];
        [starImg4 setImage:[UIImage imageNamed:@"starGray"]];
        [starImg5 setImage:[UIImage imageNamed:@"starGray"]];
    } else if (starCount==2) {
        [starImg1 setImage:[UIImage imageNamed:@"starYellow"]];
        [starImg2 setImage:[UIImage imageNamed:@"starYellow"]];
        [starImg3 setImage:[UIImage imageNamed:@"starGray"]];
        [starImg4 setImage:[UIImage imageNamed:@"starGray"]];
        [starImg5 setImage:[UIImage imageNamed:@"starGray"]];
    } else if (starCount==3) {
        [starImg1 setImage:[UIImage imageNamed:@"starYellow"]];
        [starImg2 setImage:[UIImage imageNamed:@"starYellow"]];
        [starImg3 setImage:[UIImage imageNamed:@"starYellow"]];
        [starImg4 setImage:[UIImage imageNamed:@"starGray"]];
        [starImg5 setImage:[UIImage imageNamed:@"starGray"]];
    } else if (starCount==4) {
        [starImg1 setImage:[UIImage imageNamed:@"starYellow"]];
        [starImg2 setImage:[UIImage imageNamed:@"starYellow"]];
        [starImg3 setImage:[UIImage imageNamed:@"starYellow"]];
        [starImg4 setImage:[UIImage imageNamed:@"starYellow"]];
        [starImg5 setImage:[UIImage imageNamed:@"starGray"]];
    } else if (starCount==5) {
        [starImg1 setImage:[UIImage imageNamed:@"starYellow"]];
        [starImg2 setImage:[UIImage imageNamed:@"starYellow"]];
        [starImg3 setImage:[UIImage imageNamed:@"starYellow"]];
        [starImg4 setImage:[UIImage imageNamed:@"starYellow"]];
        [starImg5 setImage:[UIImage imageNamed:@"starYellow"]];
    }
    scoreLab.text = @"3.7";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

@end
