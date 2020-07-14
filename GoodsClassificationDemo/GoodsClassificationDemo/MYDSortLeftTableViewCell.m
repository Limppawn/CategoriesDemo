//
//  MYDSortLeftTableViewCell.m
//  ComeBuy
//
//  Created by pawn on 2018/12/25.
//  Copyright © 2018年 person. All rights reserved.
//

#import "MYDSortLeftTableViewCell.h"
#import "MYDSortLeftTabModel.h"
//#import "MYDTableSelectedModel.h"

@interface MYDSortLeftTableViewCell ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIView *lineView;


@end

@implementation MYDSortLeftTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setChildView];
    }
    return self;
}


#pragma mark - UI
- (void)setChildView{
    [self addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self);
    }];
    
    [self addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_left);
        make.centerY.equalTo(self.nameLabel);
        make.width.equalTo(@4);
        make.height.equalTo(@15);
    }];
}


#pragma mark - Model
- (void)setTabModel:(MYDSortLeftTabModel *)tabModel{
    self.nameLabel.text = tabModel.name;
    if (tabModel.isSeleced == YES) {
        self.nameLabel.backgroundColor = [UIColor whiteColor];
    self.lineView.backgroundColor = self.nameLabel.textColor = [UIColor orangeColor] ;
        self.nameLabel.font = [UIFont boldSystemFontOfSize:15];
    
    }else{
     self.lineView.backgroundColor = self.nameLabel.backgroundColor = [UIColor orangeColor];
        self.nameLabel.textColor = [UIColor blueColor];
        self.nameLabel.font = [UIFont systemFontOfSize:13];
    }
}


#pragma mark - lazy
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

- (UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor darkGrayColor];
    }
    return _lineView;
}



@end
