//
//  Model.m
//  计算器
//
//  Created by 强淑婷 on 2018/9/28.
//  Copyright © 2018年 强淑婷. All rights reserved.
//

#import "Model.h"
#define SIZE [_expressionarray count]
@implementation Model
- (void)push:(id)object andstackArray:(NSMutableArray *)stackArray{
    [stackArray addObject:object];
}
- (id)popTopElement:(NSMutableArray *)stackArray
{
    id objc = [stackArray lastObject];
    [stackArray removeLastObject];
    return objc;
}
- (id)TopElement:(NSMutableArray *)stackArray
{
    return [stackArray lastObject];
}
- (NSInteger)stackLength:(NSMutableArray *)stackArray
{
    return stackArray.count;
}

- (BOOL)isOperator:(NSString *)string
{
    if([string isEqualToString:@"×"] || [string isEqualToString:@"÷"] || [string isEqualToString:@"+"] || [string isEqualToString:@"-"] || [string isEqualToString:@"("] || [string isEqualToString:@")"]){
        return YES;
    }
    return NO;
}
- (BOOL)isFourCalculate:(NSString *)string
{
    if([string isEqualToString:@"×"] || [string isEqualToString:@"÷"] || [string isEqualToString:@"+"] || [string isEqualToString:@"-"]){
        return YES;
    }
    return NO;
}
- (BOOL)isConnectOperat:(NSString *)string
{
    if([string isEqualToString:@"×"] || [string isEqualToString:@"÷"] || [string isEqualToString:@"+"] || [string isEqualToString:@"-"] ||  [string isEqualToString:@"."]  ){
        return YES;
    }
    return NO;
}
- (int)priority:(char)op
{
    int value = -1;
    //char ope = (char)op;
    switch (op) {
        case '=':
            value = -1;
            break;
        case '(':
            value = 0;
            break;
        case '+':
        case '-':
            value = 1;
            break;
        case '*':
        case '/':
            value = 2;
            break;
    }
    return value;
}
//中缀转后缀
- (int)preToPostExp:(NSArray *)expression andpostExp:(NSMutableArray *)postExp
{
    int i = 0;
    char mCode, exp[100];
    for(int i = 0;i < expression.count;i++){
        sscanf([[expression objectAtIndex:i] UTF8String], "%s", &mCode);
        exp[i] = mCode;
    }
    NSLog(@"%s", exp);
    while(exp[i] != '='){
        if((exp[i] >= '0' && exp[i] <= '9') || exp[i] == '.'){
            [postExp addObject:expression[i]];
        }
        else if(exp[i]  == '('){
            [self push:expression[i] andstackArray:_charArray];
        }
        else if(exp[i] == ')'){
            while([[self TopElement:_charArray] charValue]!= '('){
                [postExp addObject:[self TopElement:_charArray]];
                [self popTopElement:_charArray];
            }
            [self popTopElement:_charArray];
        }
        else if (i == 0 && (exp[i]  == '+' || exp[i] == '-')){
            [postExp addObject:expression[i]];
        }
        else if ([self isOperator:expression[i]]){
            while([self priority:exp[i]]<= [self priority:[[self TopElement:_charArray] charValue]]){
                [postExp addObject:[self popTopElement:_charArray]];
                [self popTopElement:_charArray];
            }
            [self push:expression[i] andstackArray:_charArray];
        }
        i++;
    }
    while([[self TopElement:_charArray] charValue] != '='){
        [postExp addObject:[self TopElement:_charArray]];
        [self popTopElement:_charArray];
    }
    return 0;
}
double read_number(char str[], int *i){
    double x = 0.0;;
    int k = 0;
    while(str[*i] >= '0' && str[*i] <= '9'){
        x = x * 10 + (str[*i] - '0');
        (*i++);
    }
    if(str[*i]=='.') // 处理小数部分
    {
        (*i)++;
        while(str[*i] >= '0'&&str[*i] <='9'){              x = x * 10 + (str[*i]-'0');              (*i)++;
            k++;
        }
    }
    while(k!=0)
    {
        x /= 10.0;
        k--;
    }
    return x;
        
}
//计算后缀表达式结果
- (NSString *)computePostExp:(char *)post{
    double x1 = 0;
   double x2 = 0;
    int flag = 0;
    int i = 0;
    double d = 0;
    
    while(post[i] != '\0'){
        if(post[i] >= '0' && post[i] <= '9'){
            d = read_number(post, &i);
            if(flag){//第一个数为负数
                d = -d;
                flag = 0;
            }
            [self push:[NSString stringWithFormat:@"%.f",d] andstackArray:_numberArray];
        }
        else if (post[i] == '+'){
            x2 = [[self TopElement:_numberArray] doubleValue];
            [self popTopElement:_numberArray];
            x1 = [[self TopElement:_numberArray] doubleValue];
            [self popTopElement:_numberArray];
            [self push:[NSString stringWithFormat:@"%.f",x1 + x2] andstackArray:_numberArray];
            i++;
        }
        else if(post[i] == '-' && i==0){
            flag = 1;
            i++;
        }
        else if(post[i] == '-'){
            x2 = [[self TopElement:_numberArray] doubleValue];
            [self popTopElement:_numberArray];
            x1 = [[self TopElement:_numberArray] doubleValue];
            [self popTopElement:_numberArray];
            [self push:[NSString stringWithFormat:@"%.f",x1 - x2] andstackArray:_numberArray];
            i++;
        }
        
        else if(post[i] == '*'){
            x2 = [[self TopElement:_numberArray] doubleValue];
            [self popTopElement:_numberArray];
            x1 = [[self TopElement:_numberArray] doubleValue];
            [self popTopElement:_numberArray];
            [self push:[NSString stringWithFormat:@"%.f",x1 * x2] andstackArray:_numberArray];
            i++;
        }
        else if(post[i] == '/'){
            x2 = [[self TopElement:_numberArray] doubleValue];
            [self popTopElement:_numberArray];
            x1 = [[self TopElement:_numberArray] doubleValue];
            [self popTopElement:_numberArray];
            [self push:[NSString stringWithFormat:@"%.f",x1 / x2] andstackArray:_numberArray];
            i++;
        }
    }
    return [self TopElement:_numberArray];
}
- (NSString *)calculate:(NSMutableString *)calculateString
{
    _middleArray = [NSArray array];
    _middleArray = [calculateString componentsSeparatedByString:@","];
    _charArray = [[NSMutableArray alloc]init];
    _numberArray = [[NSMutableArray alloc]init];
    NSLog(@"yyyy%@", _middleArray);
    
    _expressionArray = [[NSMutableArray alloc]init];
    [self preToPostExp:_middleArray andpostExp:_expressionArray];
    NSLog(@"ccc%@", _expressionArray);
    char mCode, exp[100];
    for(int i = 0;i < _expressionArray.count;i++){
        sscanf([[_expressionArray objectAtIndex:i] UTF8String], "%s", &mCode);
        exp[i] = mCode;
    }
    NSString *result = [self computePostExp:exp];
    NSLog(@"%@",result);
    return result;
}
@end

