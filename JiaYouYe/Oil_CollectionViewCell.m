//
//  Oil_CollectionViewCell.m
//  JiaYouYe
//
//  Created by lqm on 16/8/22.
//  Copyright © 2016年 LQM. All rights reserved.
//

#import "Oil_CollectionViewCell.h"
#import "Masonry.h"
#import "UIImage+BtnImage.h"
#define Screen_width [UIScreen mainScreen].bounds.size.width
#define Screen_height [UIScreen mainScreen].bounds.size.height
#define COLOR(RED,GREEN,BLUE,ALPHA)  [UIColor colorWithRed:RED/255.0 green:GREEN/255.0 blue:BLUE/255.0 alpha:ALPHA]
@implementation Oil_CollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
//        [self initView];
        [self initbutton];
    }
    return self;
}

-(void)initView
{
    _discountLabel = [[UILabel alloc]init];
    _discountLabel.font = [UIFont systemFontOfSize:20];
    _discountLabel.textAlignment = NSTextAlignmentCenter;
    
    _label1 = [[UILabel alloc]init];
    _label1.font = [UIFont systemFontOfSize:13];
    _label1.textAlignment = NSTextAlignmentCenter;
    
    _label2 = [[UILabel alloc]init];
    _label2.font = [UIFont systemFontOfSize:9];
    _label2.textAlignment = NSTextAlignmentCenter;
    
    [self.contentView addSubview:_discountLabel];
    [self.contentView addSubview:_label1];
    [self.contentView addSubview:_label2];
    //(Screen_height)/9
    [_discountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo((Screen_height)/33);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.top.equalTo(self.mas_top).offset(15);
        
    }];
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@13);
        make.left.equalTo(self.mas_left).offset(0);
        make.right.equalTo(self.mas_right).offset(0);
        make.top.equalTo(_discountLabel.mas_bottom).offset(2);
        
    }];
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@13);
        make.left.equalTo(self.mas_left).offset(0);
        make.right.equalTo(self.mas_right).offset(0);
        make.top.equalTo(_label1.mas_bottom).offset(1);
        
    }];
    
}

-(void)initbutton
{
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.userInteractionEnabled=NO;
    _button.layer.cornerRadius = 8;
    _button.layer.borderWidth = 1;
    _button.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _button.layer.masksToBounds = YES;
    //传值是以text形式
//    [_button setBackgroundColor:[UIColor clearColor]];
    [_button setBackgroundImage:[UIImage imageWithColor:COLOR(255, 66, 0, 1)] forState:UIControlStateSelected];
    [_button setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
    
    [self.contentView addSubview:_button];
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    [self initView];
}

-(void)UpdateCellWithState:(BOOL)select
{
    self.button.selected = select;
    _isSelected = select;
}

@end



























