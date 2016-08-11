//
//  HintView.h
//  班车
//
//  Created by 管宜号 on 16/7/25.
//  Copyright © 2016年 管宜号. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^callBackBlock)(UIButton *button);
@interface HintView : UIView

@property (nonatomic,copy)callBackBlock block;

-(void)setBlock:(callBackBlock)block;

@end
