//
//  ZInputToolbar.m
//  test
//
//  Created by lishu tech on 17/1/11.
//  Copyright © 2017年 manyueyunma. All rights reserved.
//

#import "ZInputToolbar.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"

//输入框高度
#define kInputHeight 38
//按钮高
#define kButtonH 38
//按钮宽
#define kButtonW 74
//按钮距离下边距离
#define kButtonMargin 8

@interface ZInputToolbar () <UITextViewDelegate>

/***文本输入框最高高度***/
@property (nonatomic, assign)NSInteger textInputMaxHeight;

/***文本输入框高度***/
@property (nonatomic, assign)CGFloat textInputHeight;

/***键盘高度***/
@property (nonatomic, assign)CGFloat keyboardHeight;

/***当前键盘是否可见*/
@property (nonatomic,assign)BOOL keyboardIsVisiable;
// 发送按钮
@property (nonatomic, strong) UIButton *sendBtn;

@property (nonatomic,assign) CGFloat origin_y;

@end

@implementation ZInputToolbar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.origin_y = frame.origin.y;
        [self initView];
        [self setupSubviews];
        [self addEventListening];
    }
    return self;
}

-(void)initView
{
    self.backgroundColor = [UIColor whiteColor];
    if (!self.textViewMaxLine || self.textViewMaxLine == 0) {
        self.textViewMaxLine = 4;
    }
}
- (void)setTextViewMaxLine:(NSInteger)textViewMaxLine
{
    _textViewMaxLine = textViewMaxLine;
    _textInputMaxHeight = ceil(self.textInput.font.lineHeight * (textViewMaxLine - 1) +
                               self.textInput.textContainerInset.top + self.textInput.textContainerInset.bottom);
}

// 添加通知
-(void)addEventListening
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHidden:) name:UIKeyboardWillHideNotification object:nil];
}

/**
 初始化UI
 */
-(void)setupSubviews {
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, 0.5)];
    line.backgroundColor = QL_Border_LineColor;
    [self addSubview:line];
    
    self.textInput = [[UITextView alloc] initWithFrame:CGRectMake(5, (self.height - kInputHeight)/2, self.width - kButtonW - 20, kButtonH)];;
    self.textInput.font = [UIFont systemFontOfSize:15];
    self.textInput.layer.cornerRadius = 5;
    self.textInput.layer.borderColor = QL_Border_LineColor.CGColor;
    self.textInput.layer.borderWidth = 1;
    self.textInput.layer.masksToBounds = YES;
    self.textInput.returnKeyType = UIReturnKeySend;
    self.textInput.enablesReturnKeyAutomatically = YES;
    self.textInput.delegate = self;
    [self addSubview:self.textInput];
    
    self.placeholderLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, (self.height - kInputHeight)/2, self.width - kButtonW - 20, kButtonH)];
    self.placeholderLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    self.placeholderLabel.font = self.textInput.font;
    if (!self.placeholderLabel.text.length) {
        self.placeholderLabel.text = @" ";
    }
    [self addSubview:self.placeholderLabel];
    
    self.sendBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.width - kButtonW - 10, self.height - kButtonH - kButtonMargin, kButtonW, kButtonH)];
    //边框圆角
    [self.sendBtn.layer setBorderWidth:1.0];
    [self.sendBtn.layer setCornerRadius:5.0];
    self.sendBtn.layer.borderColor=[UIColor grayColor].CGColor;
    self.sendBtn.enabled = NO;
    self.sendBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [self.sendBtn setTitle:@"发送" forState:UIControlStateNormal];
    [self.sendBtn setTitleColor:QL_UserName_TitleColor_Black forState:UIControlStateNormal];
    [self.sendBtn addTarget:self action:@selector(didClickSendBtn) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.sendBtn];
}
#pragma mark keyboardnotification
- (void)keyboardWillShow:(NSNotification *)notification
{
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    _keyboardHeight = keyboardFrame.size.height;
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationCurve:7];
    self.top = keyboardFrame.origin.y - self.height;
    [UIView commitAnimations];
    self.keyboardIsVisiable = YES;
    if (self.keyIsVisiableBlock) {
        self.keyIsVisiableBlock(YES);
    }
}
- (void)keyboardWillHidden:(NSNotification *)notification
{
    
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [UIView animateWithDuration:duration animations:^{
        self.top = self.origin_y;
    }];
    self.keyboardIsVisiable = NO;
    if (self.keyIsVisiableBlock) {
        self.keyIsVisiableBlock(NO);
    }
}
#pragma mark UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView
{
    self.placeholderLabel.hidden = textView.text.length;
    if (textView.text.length) {
        self.sendBtn.enabled = YES;
        [self.sendBtn setTitleColor:QL_UserName_TitleColor_Black forState:UIControlStateNormal];
    }else {
        self.sendBtn.enabled = NO;
        [self.sendBtn setTitleColor:QL_DescColor_Gray forState:UIControlStateNormal];
    }
    _textInputHeight = ceilf([self.textInput sizeThatFits:CGSizeMake(self.textInput.width, MAXFLOAT)].height);
    self.textInput.scrollEnabled = _textInputHeight > _textInputMaxHeight && _textInputMaxHeight > 0;
    if (self.textInput.scrollEnabled) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration:0.3];
        [UIView setAnimationCurve:7];
        self.textInput.height = 5 + _textInputMaxHeight;
        self.top = WTScreenHeight - _keyboardHeight - _textInputMaxHeight - 5 - 10;
        self.height = _textInputMaxHeight + 15;
        self.sendBtn.top = self.height - kButtonH - kButtonMargin;
        [UIView commitAnimations];
    } else {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration:0.3];
        [UIView setAnimationCurve:7];
        self.textInput.height = _textInputHeight;
        self.top = WTScreenHeight - _keyboardHeight - _textInputHeight - 5 - 8;
        self.height = _textInputHeight + 15;
        self.sendBtn.top = self.height - kButtonH - kButtonMargin;
        [UIView commitAnimations];
    }
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    // 点击return按钮
    if ([text isEqualToString:@"\n"]){
        if ([_delegate respondsToSelector:@selector(inputToolbar:sendContent:)]) {
            [_delegate inputToolbar:self sendContent:self.textInput.text];
        }
        return NO;
    }
    return YES;
}
// 发送按钮
-(void)didClickSendBtn {
    if ([_delegate respondsToSelector:@selector(inputToolbar:sendContent:)]) {
        [_delegate inputToolbar:self sendContent:self.textInput.text];
    }
}
// 发送成功 清空文字 更新输入框大小
-(void)sendSuccessEndEditing {
    self.textInput.text = nil;
    [self.textInput.delegate textViewDidChange:self.textInput];
    [self endEditing:YES];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
