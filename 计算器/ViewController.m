//
//  ViewController.m
//  计算器
//
//  Created by 强淑婷 on 2018/9/26.
//  Copyright © 2018年 强淑婷. All rights reserved.
//

#import "ViewController.h"
#import "CalculateView.h"
#import "Model.h"

@interface ViewController ()
@property (nonatomic, strong)CalculateView *calculateView;
@property (nonatomic, strong)Model *model;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.00f green:0.00f blue:0.00f alpha:1.00f];
    _calculateView = [[CalculateView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_calculateView];
    
    _mutableString = [[NSMutableString alloc]init];
    NSLog(@"%@",_mutableString);
    
    _calculateString = [[NSMutableString alloc]init];
    
    [_calculateView.zeroButton addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_calculateView.oneButton addTarget:self  action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_calculateView.twoButton addTarget:self  action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_calculateView.threeButton addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_calculateView.fourButton addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_calculateView.fiveButton addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_calculateView.sixButton addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_calculateView.sevenButton addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_calculateView.eightButton addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_calculateView.nineButton addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_calculateView.cancelButton addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_calculateView.addButton addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_calculateView.pointButton addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_calculateView.percentButton addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_calculateView.divideButton addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_calculateView.addSubtractButton addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_calculateView.subtractButton addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_calculateView.multiplyButton addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_calculateView.equalButton addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    _model = [[Model alloc]init];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)getOperator:(NSUInteger)tag
{
        if(([_string isEqualToString:@"0"] && ([_model isOperator:_beforeString] || [_beforeString isEqualToString:@"d"]))|| [_mutableString length] == 0){
            if([_mutableString length] > 0){
                NSRange deleteRange = {[_mutableString length] - 1, 1};
                [_mutableString deleteCharactersInRange:deleteRange];
            }
            [_mutableString appendString:[NSString stringWithFormat:@"%lu", (unsigned long)tag]];
            [_calculateString appendString:[NSString stringWithFormat:@"%lu,", (unsigned long)tag]];
            //[_mutableString replaceOccurrencesOfString:@"0" withString:@"1" options:NSCaseInsensitiveSearch range:deleteRange];
            
        }
        else{
            [_mutableString insertString:[NSString stringWithFormat:@"%lu", (unsigned long)tag] atIndex:[_mutableString length]];
            [_calculateString insertString:[NSString stringWithFormat:@"%lu,", (unsigned long)tag] atIndex:[_calculateString length]];
        }
    
}
- (void)BtnClick:(UIButton *)btn
{
    _string = [[NSString alloc]init];
    _beforeString = [[NSString alloc]init];
    _beforeString = @"d";
    NSLog(@"%@mmmm", _beforeString);
    if([_mutableString length] > 0){
       _string = [_mutableString substringFromIndex:[_mutableString length]- 1];
        NSLog(@"--%@", _string);
    }
    if([_mutableString length] > 1){
        _beforeString = [_mutableString substringFromIndex:[_mutableString length]- 2];
        _beforeString = [_beforeString substringToIndex:[_beforeString length] - 1];
        NSLog(@"-----%@", _beforeString);
    }
    if(btn.tag == 0){
        [self getOperator:0];
            //[_mutableString insertString:@"0" atIndex:[_mutableString length]];
    }
    if(btn.tag == 1){
        [self getOperator:1];
    }
    if(btn.tag == 2){
        [self getOperator:2];
    }
    if(btn.tag == 3){
        [self getOperator:3];
    }
    if(btn.tag == 4){
        [self getOperator:4];
    }
    if(btn.tag == 5){
        [self getOperator:5];
    }
    if(btn.tag == 6){
        [self getOperator:6];
    }
    if(btn.tag == 7){
        [self getOperator:7];
    }
    if(btn.tag == 8){
        [self getOperator:8];
    }
    if(btn.tag == 9){
        [self getOperator:9];
    }
    if(btn.tag == 11){//.
        if([_mutableString length] == 0){
            [_mutableString appendString:@"0."];
            [_calculateString appendString:@"0.,"];
        }
        else{
            if(![_model isConnectOperat:_string]){
            [_mutableString insertString:@"." atIndex:[_mutableString length]];
                [_calculateString insertString:@".," atIndex:[_calculateString length]];
            }
            else{
                
            }
        }
    }
    if(btn.tag == 12){//=
        [_calculateString insertString:@"=," atIndex:[_calculateString length]];
        _mutableString = (NSMutableString *)[_model calculate:_calculateString];
    }
    if(btn.tag == 13){//+
        if([_mutableString length] == 0){
            [_mutableString appendString:@"0+"];
            [_calculateString appendString:@"0+,"];
        }
        else{
            if(![_model isConnectOperat:_string]){
                [_mutableString insertString:@"+" atIndex:[_mutableString length]];
                [_calculateString insertString:@"+," atIndex:[_calculateString length]];
            }else{
                
            }
        }
    }
    if(btn.tag == 14){//-
        if([_mutableString length] == 0){
            [_mutableString appendString:@"-"];
            [_calculateString appendString:@"-,"];
        }
        else{
            if(![_model isConnectOperat:_string]){
                [_mutableString insertString:@"-" atIndex:[_mutableString length]];
                [_calculateString insertString:@"-," atIndex:[_calculateString length]];
            }else{
                
            }
        }
    }
    if(btn.tag == 15){//×
        if([_mutableString length] == 0){
            [_mutableString appendString:@"0×"];
            [_calculateString appendString:@"0*,"];
        }
        else{
            if(![_model isConnectOperat:_string]){
                [_mutableString insertString:@"×" atIndex:[_mutableString length]];
                [_calculateString insertString:@"*," atIndex:[_calculateString length]];
            }else{
                
            }
        }
    }
    if(btn.tag == 16){//AC
        [_mutableString setString:@""];
        [_calculateString setString:@""];
    }
    if(btn.tag == 17){//(
        if([_model isFourCalculates:_string]){
            [_mutableString insertString:@"(" atIndex:[_mutableString length]];
            [_calculateString insertString:@"(," atIndex:[_calculateString length]];
        }
    }
    if(btn.tag == 18){//)
        if([_model isFourCalculate:_string] || [_string isEqualToString:@"("]){
            
        }else{
            [_mutableString insertString:@")" atIndex:[_mutableString length]];
            [_calculateString insertString:@")," atIndex:[_calculateString length]];
        }
    }
    if(btn.tag == 19){//÷
        if([_mutableString length] == 0){
            [_mutableString appendString:@"0÷"];
            [_calculateString appendString:@"0/,"];
        }
        else{
            if(![_model isConnectOperat:_string]){
                [_mutableString insertString:@"÷" atIndex:[_mutableString length]];
                [_calculateString insertString:@"/," atIndex:[_calculateString length]];
            }else{
                
            }
        }
    }
    _calculateView.textView.text = [NSString stringWithFormat:@"%@", _mutableString];
    
    NSLog(@"%@", _mutableString);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
