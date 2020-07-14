//
//  MYDSortCommonCollectionViewCell.m
//  ComeBuy
//
//  Created by pawn on 2018/12/25.
//  Copyright © 2018年 person. All rights reserved.
//

#import "MYDSortCommonCollectionViewCell.h"
#import "MYDSortRightCollModel.h"

@interface MYDSortCommonCollectionViewCell ()

/** 图片 */
@property (nonatomic, strong) UIImageView *topImageView;
/** 名称 */
@property (nonatomic, strong) UILabel *nameLabel;


@end

@implementation MYDSortCommonCollectionViewCell

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
    [self addSubview:self.nameLabel];
    
    [self.topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self);
        make.height.width.equalTo(@(([UIScreen mainScreen].bounds.size.width *0.7 - 4*10)*0.33));
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topImageView.mas_bottom).offset(5);
        make.left.right.equalTo(self);
        make.bottom.equalTo(self).offset(-5);
    }];
    
}


#pragma mark - Model
- (void)setSrotRightCollModel:(MYDSortRightCollModel *)srotRightCollModel{
    [self.topImageView sd_setImageWithURL:[NSURL URLWithString:srotRightCollModel.pic] placeholderImage:[UIImage imageNamed:@"ic_store_allGoods"]];
    self.nameLabel.text = srotRightCollModel.name;
    
}


#pragma mark - lazy
- (UIImageView *)topImageView{
    if (_topImageView == nil) {
        _topImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic_store_allGoods"]];
    }
    return _topImageView;
}

- (UILabel *)nameLabel{
    if (_nameLabel == nil) {
      
        _nameLabel = [[UILabel alloc]init];
              _nameLabel.textColor = [UIColor blueColor];
              _nameLabel.font = [UIFont systemFontOfSize:13];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.numberOfLines = 1;
    }
    return _nameLabel;
}






@end
