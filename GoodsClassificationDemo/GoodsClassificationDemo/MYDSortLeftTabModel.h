//
//  MYDSortLeftTabModel.h
//  ComeBuy
//
//  Created by 微信食品 on 2018/12/25.
//  Copyright © 2018年 深圳市沁易购电子商务有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MYDSortLeftTabModel : NSObject

/** 商品分类id */
@property (nonatomic, copy) NSString *cateid;
/** 商品名称 */
@property (nonatomic, copy) NSString *name;
/** 是否被选中 */
@property (nonatomic, assign) BOOL isSeleced;

@end
