//
//  MYDSortRightCollModel.h
//  ComeBuy
//
//  Created by 微信食品 on 2018/12/25.
//  Copyright © 2018年 深圳市沁易购电子商务有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MYDSortRightCollModel : NSObject

/** 分类id */
@property (nonatomic, copy) NSString *cateid;
/** 分类名称 - 商品名称 */
@property (nonatomic, copy) NSString *name;
/** 分类图片地址 - 商品图片地址 */
@property (nonatomic, copy) NSString *pic;

/** 广告图片地址 */
@property (nonatomic, copy) NSString *adpic;
/** 广告图片跳转地址 */
@property (nonatomic, copy) NSString *adurl;
/** 跳转类型-adtype 广告跳转类型 1淘宝、2京东、3web */
@property (nonatomic, copy) NSString *adtype;
/** id */
@property (nonatomic, copy) NSString *productId;
/** 预留字段 */
@property (nonatomic, copy) NSString *showtype;

@end
