//
//  CalculateView.m
//  计算器
//
//  Created by 强淑婷 on 2018/9/26.
//  Copyright © 2018年 强淑婷. All rights reserved.
//

#import "CalculateView.h"

@implementation CalculateView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        _textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 100, self.bounds.size.width, self.bounds.size.height - 500)];
//        _textView.textContainerInset = UIEdgeInsetsMake(self.bounds.size.height - 500, self.bounds.size.width - 50, 0, self.bounds.size.height - 500);
        _textView.textColor = [UIColor whiteColor];
        _textView.backgroundColor = [UIColor colorWithRed:0.00f green:0.00f blue:0.00f alpha:1.00f];
        _textView.text = @"0";
        _textView.font = [UIFont systemFontOfSize:45];
        _textView.textAlignment = NSTextAlignmentRight;
//        NSMutableAttributedString *attributedStr01 = [[NSMutableAttributedString alloc]initWithString:_textView.text];
//        [attributedStr01 addAttribute:NSWritingDirectionAttributeName value:@[@(NSWritingDirectionRightToLeft | NSWritingDirectionOverride)]
//                        range:NSMakeRange(0, attributedStr01.length)];
//        _textView.attributedText = attributedStr01;
        [self addSubview:_textView];
        
        _zeroButton = [[UIButton alloc]init];
        _zeroButton.frame = CGRectMake(10, self.bounds.size.height - 100,200,  90);
        _zeroButton.backgroundColor = [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.00f];
        _zeroButton.layer.cornerRadius = 45;
        [_zeroButton setTitle:@"0" forState:UIControlStateNormal];
        [_zeroButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _zeroButton.titleLabel.font = [UIFont systemFontOfSize:30];
        _zeroButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _zeroButton.contentEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0);
        _zeroButton.tag = 0;
        [self addSubview:_zeroButton];
        
        _pointButton = [[UIButton alloc]initWithFrame:CGRectMake(220, self.bounds.size.height - 100, 90, 90)];
        _pointButton.backgroundColor = [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.00f];
        [_pointButton setTitle:@"." forState:UIControlStateNormal];
        [self setButton:_pointButton];
        _pointButton.tag = 11;
        
        _equalButton = [[UIButton alloc]initWithFrame:CGRectMake(320, self.bounds.size.height - 100, 90, 90)];
        _equalButton.backgroundColor = [UIColor colorWithRed:1.00f green:0.58f blue:0.00f alpha:1.00f];
        [_equalButton setTitle:@"=" forState:UIControlStateNormal];
        [self setButton:_equalButton];
        _equalButton.tag = 12;
        
        _oneButton = [[UIButton alloc]initWithFrame:CGRectMake(10, self.bounds.size.height - 200, 90, 90)];
        _oneButton.backgroundColor = [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.00f];
        [_oneButton setTitle:@"1" forState:UIControlStateNormal];
        [self setButton:_oneButton];
        _oneButton.tag = 1;
        
        _twoButton = [[UIButton alloc]initWithFrame:CGRectMake(115, self.bounds.size.height - 200, 90, 90)];
        _twoButton.backgroundColor = [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.00f];
        [_twoButton setTitle:@"2" forState:UIControlStateNormal];
        _twoButton.tag = 2;
        [self setButton:_twoButton];
        
        _threeButton = [[UIButton alloc]initWithFrame:CGRectMake(220, self.bounds.size.height - 200, 90, 90)];
        _threeButton.backgroundColor = [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.00f];
        [_threeButton setTitle:@"3" forState:UIControlStateNormal];
        _threeButton.tag = 3;
        [self setButton:_threeButton];
        
        _addButton = [[UIButton alloc]initWithFrame:CGRectMake(320, self.bounds.size.height - 200, 90, 90)];
        _addButton.backgroundColor = [UIColor colorWithRed:1.00f green:0.58f blue:0.00f alpha:1.00f];
        [_addButton setTitle:@"+" forState:UIControlStateNormal];
        _addButton.tag = 13;
        [self setButton:_addButton];
        
        _fourButton = [[UIButton alloc]initWithFrame:CGRectMake(10, self.bounds.size.height - 300, 90, 90)];
        _fourButton.backgroundColor = [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.00f];
        [_fourButton setTitle:@"4" forState:UIControlStateNormal];
        _fourButton.tag = 4;
        [self setButton:_fourButton];
        
        _fiveButton = [[UIButton alloc]initWithFrame:CGRectMake( 115, self.bounds.size.height - 300, 90, 90)];
        _fiveButton.backgroundColor = [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.00f];
        [_fiveButton setTitle:@"5" forState:UIControlStateNormal];
        _fiveButton.tag = 5;
        [self setButton:_fiveButton];
        
        _sixButton = [[UIButton alloc]initWithFrame:CGRectMake(220, self.bounds.size.height - 300, 90, 90)];
        _sixButton.backgroundColor = [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.00f];
        [_sixButton setTitle:@"6" forState:UIControlStateNormal];
        _sixButton.tag = 6;
        [self setButton:_sixButton];
        
        _subtractButton = [[UIButton alloc]initWithFrame:CGRectMake(320, self.bounds.size.height - 300, 90, 90)];
        _subtractButton.backgroundColor = [UIColor colorWithRed:1.00f green:0.58f blue:0.00f alpha:1.00f];
        [_subtractButton setTitle:@"-" forState:UIControlStateNormal];
        _subtractButton.tag = 14;
        [self setButton:_subtractButton];
        
        _sevenButton = [[UIButton alloc]initWithFrame:CGRectMake(10, self.bounds.size.height - 400, 90, 90)];
        _sevenButton.backgroundColor = [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.00f];
        [_sevenButton setTitle:@"7" forState:UIControlStateNormal];
        _sevenButton.tag = 7;
        [self setButton:_sevenButton];
        
        _eightButton = [[UIButton alloc]initWithFrame:CGRectMake(115, self.bounds.size.height - 400, 90, 90)];
        _eightButton.backgroundColor = [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.00f];
        [_eightButton setTitle:@"8" forState:UIControlStateNormal];
        _eightButton.tag = 8;
        [self setButton:_eightButton];
        
        _nineButton = [[UIButton alloc]initWithFrame:CGRectMake(220, self.bounds.size.height - 400, 90, 90)];
        _nineButton.backgroundColor = [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.00f];
        [_nineButton setTitle:@"9" forState:UIControlStateNormal];
        _nineButton.tag = 9;
        [self setButton:_nineButton];
        
        _multiplyButton = [[UIButton alloc]initWithFrame:CGRectMake(320, self.bounds.size.height - 400, 90, 90)];
        _multiplyButton.backgroundColor = [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.00f];
        [_multiplyButton setTitle:@"×" forState:UIControlStateNormal];
        _multiplyButton.tag = 15;
        [self setButton:_multiplyButton];
        
        _cancelButton = [[UIButton alloc]initWithFrame:CGRectMake(10, self.bounds.size.height - 500, 90, 90)];
        [_cancelButton setTitle:@"AC" forState:UIControlStateNormal];
        _cancelButton.tag = 16;
        [self setButton2:_cancelButton];
        
        _addSubtractButton = [[UIButton alloc]initWithFrame:CGRectMake(115, self.bounds.size.height - 500, 90, 90)];
        [_addSubtractButton setTitle:@"(" forState:UIControlStateNormal];
        _addSubtractButton.tag = 17;
        [self setButton2:_addSubtractButton];
        
        _percentButton = [[UIButton alloc]initWithFrame:CGRectMake(220, self.bounds.size.height - 500, 90, 90)];
        [_percentButton setTitle:@")" forState:UIControlStateNormal];
        _percentButton.tag = 18;
        [self setButton2:_percentButton];
        
        _divideButton = [[UIButton alloc]initWithFrame:CGRectMake(320, self.bounds.size.height - 500, 90, 90)];
        [_divideButton setTitle:@"÷" forState:UIControlStateNormal];
        _divideButton.tag = 19;
        [self setButton2:_divideButton];
        
    }
    return self;
}
- (void)setButton:(UIButton *)button{
    button.layer.cornerRadius = 45;
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:30];
    [self addSubview:button];
}
- (void)setButton2:(UIButton *)button{
    button.layer.cornerRadius = 45;
    button.backgroundColor = [UIColor colorWithRed:0.65f green:0.65f blue:0.65f alpha:1.00f];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:30];
    [self addSubview:button];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
