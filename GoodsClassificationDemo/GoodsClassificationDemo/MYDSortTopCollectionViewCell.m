//
//  MYDSortTopCollectionViewCell.m
//  ComeBuy
//
//  Created by pawn on 2018/12/25.
//  Copyright © 2018年 person. All rights reserved.
//

#import "MYDSortTopCollectionViewCell.h"
#import "MYDSortRightCollModel.h"

@interface MYDSortTopCollectionViewCell ()

/** 图片 */
@property (nonatomic, strong) UIImageView *topImageView;
/** 数据模型 */
@property (nonatomic, strong) MYDSortRightCollModel *topBlockModel;


@end

@implementation MYDSortTopCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setChildView];
    }
    return self;
}


#pragma mark - UI
- (void)setChildView{
    [self addSubview:self.topImageView];
    [self.topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
        make.bottom.equalTo(self).offset(-10);
        make.top.equalTo(self).offset(10);
    }];
    
}


#pragma mark - Model
- (void)setTopModel:(MYDSortRightCollModel *)topModel{
//    [self.topImageView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@""]];
    
    self.topBlockModel = topModel;
}


#pragma mark - 手势事件
- (void)imageTapAction{
    
    if (self.mydSortTopCollectionCellBlock) {
        self.mydSortTopCollectionCellBlock(self.topBlockModel);
    }
}

#pragma mark - lazy
- (UIImageView *)topImageView{
    if (_topImageView == nil) {
        _topImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic_store_allGoods"]];
        _topImageView.userInteractionEnabled = YES;
        
        /** 手势 */
        UITapGestureRecognizer *imageTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageTapAction)];
        [_topImageView addGestureRecognizer:imageTap];
    }
    return _topImageView;
}















@end
