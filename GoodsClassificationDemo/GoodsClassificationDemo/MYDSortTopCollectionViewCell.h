//
//  MYDSortTopCollectionViewCell.h
//  ComeBuy
//
//  Created by pawn on 2018/12/25.
//  Copyright © 2018年 person. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MYDSortRightCollModel;
@interface MYDSortTopCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) MYDSortRightCollModel *topModel;
@property (nonatomic, copy) void (^mydSortTopCollectionCellBlock) (MYDSortRightCollModel *model);

@end
