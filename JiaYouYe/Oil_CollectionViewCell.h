//
//  Oil_CollectionViewCell.h
//  JiaYouYe
//
//  Created by lqm on 16/8/22.
//  Copyright © 2016年 LQM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Oil_CollectionViewCell : UICollectionViewCell
@property(nonatomic,strong)UILabel *discountLabel;
@property(nonatomic,strong)UILabel *label1;
@property(nonatomic,strong)UILabel *label2;
@property(nonatomic,strong)UIButton *button;

@property (nonatomic,assign)BOOL isSelected;
-(void)UpdateCellWithState:(BOOL)select;

@end
