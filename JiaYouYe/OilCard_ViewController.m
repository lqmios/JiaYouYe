//
//  OilCard_ViewController.m
//  JiaYouYe
//
//  Created by lqm on 16/8/22.
//  Copyright © 2016年 LQM. All rights reserved.
//

#import "OilCard_ViewController.h"
#import "AddOil_ViewController.h"
#import "Masonry.h"
#import "Oil_CollectionViewCell.h"

#define Screen_width [UIScreen mainScreen].bounds.size.width
#define Screen_height [UIScreen mainScreen].bounds.size.height
#define COLOR(RED,GREEN,BLUE,ALPHA)  [UIColor colorWithRed:RED/255.0 green:GREEN/255.0 blue:BLUE/255.0 alpha:ALPHA]
static NSString *CellIdendifier = @"CellIdendifier";
@interface OilCard_ViewController ()<UITextFieldDelegate,UICollectionViewDataSource,UICollectionViewDelegate>
{
    NSString *numString;
    
    NSString *discountNum;
    Oil_CollectionViewCell *cell;
}
@property (weak, nonatomic) IBOutlet UIView *BgView;
@property (weak, nonatomic) IBOutlet UIButton *redueBtn;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@property (weak, nonatomic) IBOutlet UITextField *numTextField;
@property (weak, nonatomic) IBOutlet UITextField *addOilCardTextField;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UILabel *chongzhiLabel;

@property (weak, nonatomic) IBOutlet UILabel *unitLabel;
@property (weak, nonatomic) IBOutlet UIView *oilView;
@property (weak, nonatomic) IBOutlet UICollectionView *oilCard_CollectionView;

@property(nonatomic,strong)NSMutableArray *dataSoure;

@end

@implementation OilCard_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title = @"充油卡";
    
    [self initView];
    [self addColectionView];
    _dataSoure = [NSMutableArray arrayWithObjects:@"9.9折",@"9.5折",@"8.8折", nil];


}
-(NSMutableArray *)dataSoure
{
    if (_dataSoure == nil) {
        _dataSoure = [NSMutableArray array];
    }
    return _dataSoure;
}
-(void)initView
{
#pragma mark  --BgView--
    self.BgView.backgroundColor = [UIColor clearColor];
    self.BgView.layer.cornerRadius = 5;
    self.BgView.layer.borderColor = COLOR(255, 66, 0, 1).CGColor;
    self.BgView.layer.borderWidth = 2;
    self.BgView.layer.masksToBounds = YES;
    self.numTextField.borderStyle = UITextBorderStyleNone;
    self.numTextField.font = [UIFont boldSystemFontOfSize:20];
    self.numTextField.text = @"100";
    self.numTextField.delegate = self;
    discountNum = @"0.99";
     numString = self.numTextField.text;
//    NSLog(@"numString = %@",numString);

    [self.redueBtn setBackgroundImage:[UIImage imageNamed:@"kuang-2"] forState:UIControlStateNormal];

    [self.addBtn setBackgroundImage:[UIImage imageNamed:@"kuang-3"] forState:UIControlStateNormal];
#pragma mark  --oilView--
    self.addOilCardTextField.delegate = self;
    self.addOilCardTextField.borderStyle = UITextBorderStyleNone;
    self.oilView.backgroundColor = [UIColor clearColor];
    self.oilView.layer.cornerRadius = 5;
    self.oilView.layer.masksToBounds = YES;
    self.oilView.layer.borderWidth = 2;
    self.oilView.layer.borderColor = COLOR(222, 222, 222, 1).CGColor;
    UIView *view1 = [[UIView alloc]init];
    [self.oilView addSubview:view1];
    view1.backgroundColor = [UIColor clearColor];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.oilView);
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [view1 addGestureRecognizer:tap];
    
    [self.sureBtn setTitle:@"立即支付99.00元" forState:UIControlStateNormal];
 
}
-(void)addColectionView
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue]>7.0?YES:NO)
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }

    self.oilCard_CollectionView.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumInteritemSpacing = 0;//列距
    flowLayout.minimumLineSpacing = 0;
    [self.oilCard_CollectionView registerClass:[Oil_CollectionViewCell class] forCellWithReuseIdentifier:CellIdendifier];
    
    self.oilCard_CollectionView.showsVerticalScrollIndicator = NO;
    self.oilCard_CollectionView.scrollEnabled = YES;
    self.oilCard_CollectionView.dataSource = self;
    self.oilCard_CollectionView.delegate = self;
    
    
}

#pragma mark --action--
-(void)tapAction:(UITapGestureRecognizer *)sender
{
    NSLog(@"sss");
    AddOil_ViewController *addOilVC = [[AddOil_ViewController alloc]init];
    [self.navigationController pushViewController:addOilVC animated:YES];
}
- (IBAction)redueBtnAction:(id)sender
{
    
    int num = [self.numTextField.text intValue];
    num -= 100;
    if (num <= 100)
    {
         self.numTextField.text = @"100";
        numString = self.numTextField.text;
        
    }
    else
    {
        self.numTextField.text = [NSString stringWithFormat:@"%d",num];
        numString = self.numTextField.text;
    }
    if ([self.numTextField.text isEqualToString:@"100"])
    {
        [self.redueBtn setBackgroundImage:[UIImage imageNamed:@"kuang-2"] forState:UIControlStateNormal];
    }
    else
    {
        
        [self.redueBtn setBackgroundImage:[UIImage imageNamed:@"kuang-4"] forState:UIControlStateNormal];
    }
////////
    cell.button.selected = NO;
    cell.discountLabel.textColor = [UIColor blackColor];
    cell.label1.textColor = [UIColor blackColor];
    cell.label2.textColor = [UIColor blackColor];
   
    
}

- (IBAction)addBtnAction:(id)sender
{
    
    int num = [self.numTextField.text intValue];
    num += 100;
    self.numTextField.text = [NSString stringWithFormat:@"%d",num];
    numString = self.numTextField.text;
    
    if ([self.numTextField.text isEqualToString:@"100"])
    {
        [self.redueBtn setBackgroundImage:[UIImage imageNamed:@"kuang-2"] forState:UIControlStateNormal];
    }
    else
    {
        
        [self.redueBtn setBackgroundImage:[UIImage imageNamed:@"kuang-4"] forState:UIControlStateNormal];
    }
  //////////
    cell.button.selected = NO;
    cell.discountLabel.textColor = [UIColor blackColor];
    cell.label1.textColor = [UIColor blackColor];
    cell.label2.textColor = [UIColor blackColor];
}


- (IBAction)sureBtnAction:(id)sender
{
//    NSString *str = discountNum;
//    double num1 = [str floatValue];//拆包
//    int num2 = [numString intValue];
//    CGFloat resultNum = num1 * num2;
//    [_sureBtn setTitle:[NSString stringWithFormat:@"立即支付%.2f元",resultNum] forState:UIControlStateNormal];

}

#pragma mark ---UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField == self.numTextField) {
        [self.numTextField resignFirstResponder];
        return YES;
    }
    else
    {
        return NO;
    }
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.numTextField resignFirstResponder];
    
}
#pragma mark --UICollectionViewDataSource,UICollectionViewDelegate----
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return _dataSoure.count;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
     cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdendifier forIndexPath:indexPath];
    NSString *str = _dataSoure[indexPath.row];
    NSMutableAttributedString *arrString = [[NSMutableAttributedString alloc]initWithString:str];
    [arrString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(3,1)];
    cell.discountLabel.attributedText = arrString;
//    cell.discountLabel.text = _dataSoure[indexPath.row];
    NSMutableArray *mArr1 = [NSMutableArray arrayWithObjects:@"立即充值",@"分六个月到账",@"分12个月到账", nil];
   NSMutableArray *mArr2 = [NSMutableArray arrayWithObjects:@"1小时内到账(月限充2000)",@"首笔2小时内到账",@"首笔2小时内到账", nil];
    cell.label1.text = mArr1[indexPath.row];
    cell.label2.text = mArr2[indexPath.row];
    
    return cell;
}

//元素大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake((Screen_width - 40)/3,(Screen_height)/9);

}
//设置cell与边缘的间隔
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    UIEdgeInsets inset = UIEdgeInsetsMake(10, 10, 10, 10);
    return inset;
}

//最小行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 25;
}

//最小列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *str = discountNum;
    double num1 = [str floatValue];//拆包
    int num2 = [numString intValue];
    switch (indexPath.row)
    {
        case 0:
        {
            discountNum = @"0.99";
            CGFloat resultNum = num1 * num2;
            [_sureBtn setTitle:[NSString stringWithFormat:@"立即支付%.2f元",resultNum] forState:UIControlStateNormal];
        }
            
            break;
        case 1:
        {
            discountNum = @"0.95";
            CGFloat resultNum = num1 * num2 * 6;
            [_sureBtn setTitle:[NSString stringWithFormat:@"立即支付%.2f元",resultNum] forState:UIControlStateNormal];
        }
            
            break;
        case 2:
        {
            discountNum = @"0.88";
            CGFloat resultNum = num1 * num2 * 12;
            [_sureBtn setTitle:[NSString stringWithFormat:@"立即支付%.2f元",resultNum] forState:UIControlStateNormal];
        }
            
            break;
        default:
            break;
    }
    
    //重点
    if (_currentSelectIndex != nil || _currentSelectIndex != indexPath) {
         cell = (Oil_CollectionViewCell *)[collectionView cellForItemAtIndexPath:_currentSelectIndex];
        [cell UpdateCellWithState:NO];
         cell.discountLabel.textColor = [UIColor blackColor];
        cell.label1.textColor = [UIColor blackColor];
        cell.label2.textColor = [UIColor blackColor];
    }
     cell = (Oil_CollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [cell UpdateCellWithState:!cell.isSelected];
    _currentSelectIndex = indexPath;
    
    cell.discountLabel.textColor = [UIColor whiteColor];
    cell.label1.textColor = [UIColor whiteColor];
    cell.label2.textColor = [UIColor whiteColor];
    
 
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end






















