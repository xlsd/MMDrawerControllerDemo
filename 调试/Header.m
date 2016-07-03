//
//  Header.m
//  调试
//
//  Created by 薛林 on 16/7/1.
//  Copyright © 2016年 xuelin. All rights reserved.
//

#import "Header.h"

@implementation Header
/**
 *  加载header
 */
+ (instancetype)headerLoad {
    
    return [[[NSBundle mainBundle]loadNibNamed:@"Header" owner:nil options:nil]lastObject];
}

@end
