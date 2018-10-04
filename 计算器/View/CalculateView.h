//
//  CalculateView.h
//  计算器
//
//  Created by 强淑婷 on 2018/9/26.
//  Copyright © 2018年 强淑婷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculateView : UIView
@property (nonatomic, strong)UITextView *textView;
@property (nonatomic, strong)UIButton *cancelButton;
@property (nonatomic, strong)UIButton *addSubtractButton;
@property (nonatomic, strong)UIButton *percentButton;
@property (nonatomic, strong)UIButton *multiplyButton;
@property (nonatomic, strong)UIButton *divideButton;
@property (nonatomic, strong)UIButton *subtractButton;
@property (nonatomic, strong)UIButton *addButton;
@property (nonatomic, strong)UIButton *equalButton;
@property (nonatomic, strong)UIButton *pointButton;
@property (nonatomic, strong)UIButton *zeroButton;
@property (nonatomic, strong)UIButton *oneButton;
@property (nonatomic, strong)UIButton *twoButton;
@property (nonatomic, strong)UIButton *threeButton;
@property (nonatomic ,strong)UIButton *fourButton;
@property (nonatomic, strong)UIButton *fiveButton;
@property (nonatomic, strong)UIButton *sixButton;
@property (nonatomic, strong)UIButton *sevenButton;
@property (nonatomic, strong)UIButton *eightButton;
@property (nonatomic, strong)UIButton *nineButton;

- (void)setButton:(UIButton *)button;
@end
