//
//  Model.h
//  计算器
//
//  Created by 强淑婷 on 2018/9/28.
//  Copyright © 2018年 强淑婷. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property (nonatomic, strong)NSMutableArray *charArray;
@property (nonatomic, strong)NSMutableArray *numberArray;
@property (nonatomic, strong)NSMutableArray *expressionArray;
@property (nonatomic, copy)NSArray *middleArray;
@property (nonatomic, assign)NSInteger topChar;
@property (nonatomic, assign)NSInteger topNumber;

- (void)push:(id)object andstackArray:(NSMutableArray *)stackArray;
- (id)popTopElement:(NSMutableArray *)stackArray;
- (id)TopElement:(NSMutableArray *)stackArray;
- (BOOL)isEmpty;
- (NSInteger)stackLength:(NSMutableArray *)stackArray;

- (BOOL)isOperator:(NSString *)string;
- (BOOL)isConnectOperat:(NSString *)string;
- (BOOL)isFourCalculate:(NSString *)string;

- (NSString *)calculate:(NSMutableString *)calculateString;
- (int) priority:(char)op;
- (int) preToPostExp:(NSArray *)exp  andpostExp:(NSMutableArray *)postExp;
-(NSString *) computePostExp:(char *)post;
@end
