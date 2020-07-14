//
//  ViewController.m
//  GoodsClassificationDemo
//
//  Created by pawn on 2020/7/13.
//  Copyright © 2020 pawn. All rights reserved.
//

#import "ViewController.h"

#import "MYDSortLeftTableViewCell.h"
#import "MYDSortTopCollectionViewCell.h"
#import "MYDSortCommonCollectionViewCell.h"

#import "MYDSortLeftTabModel.h"
#import "MYDSortRightCollModel.h"


#define HEADER_ID @"header"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
/** 左侧 */
@property (nonatomic, strong) UITableView *leftTableView;
@property (nonatomic, strong) NSMutableArray *leftDataArray;
@property (nonatomic, strong) MYDSortLeftTabModel *tabModel;
/** 右侧 */
@property (nonatomic, strong) UICollectionView *rightCollectionView;
@property (nonatomic, strong) NSMutableArray *rightDataArray;

/** 选中效果 */
@property (nonatomic, assign) NSInteger index_selected;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"商品分类");
    [self setChildUI];
    [self getDataForNetWork];
}

#pragma mark -  UI
- (void)setChildUI{
    /** 控件 */
       [self.view addSubview:self.leftTableView];
       [self.view addSubview:self.rightCollectionView];
       
       [self.leftTableView mas_makeConstraints:^(MASConstraintMaker *make) {
           make.top.left.bottom.equalTo(self.view);
           make.width.equalTo(@([UIScreen mainScreen].bounds.size.width*0.3));
       }];
       
       [self.rightCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
           make.top.right.bottom.equalTo(self.view);
           make.left.equalTo(self.leftTableView.mas_right);
       }];
}

#pragma mark -  网络请求
- (void)getDataForNetWork{
    self.leftDataArray = @[
        @{
            @"name":@"衣服",
        },
        @{
                  @"name":@"裙子",
              },
        @{
                  @"name":@"衣服",
              },
        @{
                  @"name":@"鞋子",
              },
        @{
                  @"name":@"衣服",
              },
        @{
                  @"name":@"裤子",
              },
        @{
                  @"name":@"衣服",
              },
        @{
                  @"name":@"吃的",
              },
        @{
                  @"name":@"衣服",
              },
        @{
                  @"name":@"衣服",
              },
    ];
    
    [self.leftTableView reloadData];
    
    
    self.rightDataArray = @[
        @{
            @"name":@"裙子",
            @"pic":@"ic_store_allGoods",
        },
        @{
                   @"name":@"裙子",
                   @"pic":@"ic_store_allGoods",
               },
        @{
                   @"name":@"裙子",
                   @"pic":@"ic_store_allGoods",
               },
            @{
                   @"name":@"裙子",
                   @"pic":@"ic_store_allGoods",
               },
    @{
               @"name":@"裙子",
               @"pic":@"ic_store_allGoods",
           },
        @{
                   @"name":@"裙子",
                   @"pic":@"ic_store_allGoods",
               },
        @{
                   @"name":@"裙子",
                   @"pic":@"ic_store_allGoods",
               },
        @{
                   @"name":@"裙子",
                   @"pic":@"ic_store_allGoods",
               },
        @{
                   @"name":@"裙子",
                   @"pic":@"ic_store_allGoods",
               },
    ];
    
    [self.rightCollectionView reloadData];
}


#pragma mark - UITableView代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.leftDataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MYDSortLeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MYDSortLeftTableViewCell class])];

    MYDSortLeftTabModel *model = [[MYDSortLeftTabModel alloc]init];
    model = [MYDSortLeftTabModel mj_objectWithKeyValues:self.leftDataArray[indexPath.row]];
    
    if (_index_selected == indexPath.row) {
        model.isSeleced = YES;
    }else{
        model.isSeleced = NO;
    }
    
    cell.tabModel = model;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _index_selected = indexPath.row;
    [self leftTableViewOffsetWithIndexPath:indexPath];
    [self.leftTableView reloadData];
    
    NSLog(@"===tab:%ld===",indexPath.row);
//    self.tabModel = [MYDSortLeftTabModel mj_objectWithKeyValues:self.leftDataArray[indexPath.row]];
//    [self loadSortListForRightRequestDataWithCateId:self.tabModel.cateid];
    
    
    
}



#pragma mark - UICollectionView代理方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.rightDataArray.count + 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return self.rightDataArray.count;
    }
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        MYDSortTopCollectionViewCell  *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([MYDSortTopCollectionViewCell class]) forIndexPath:indexPath];
        
    
//        cell.topModel = [MYDSortRightCollModel mj_objectWithKeyValues:self.topAdDict];
        return cell;
        
    }else{
        MYDSortCommonCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([MYDSortCommonCollectionViewCell class]) forIndexPath:indexPath];
    
        cell.srotRightCollModel = [MYDSortRightCollModel mj_objectWithKeyValues:self.rightDataArray[indexPath.row]];
        return cell;
        
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return CGSizeMake([UIScreen mainScreen].bounds.size.width*0.7, 100+10*2);
        
    }else{
        return CGSizeMake(([UIScreen mainScreen].bounds.size.width*0.7 - 4*10)*0.33, ([UIScreen mainScreen].bounds.size.width*0.7 - 4*10)*0.33+5*2+20);
        
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeMake(0, 0);
        
    }else{
        return CGSizeMake([UIScreen mainScreen].bounds.size.width*0.7, 50);
        
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *reuserbleViwe = nil;
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HEADER_ID forIndexPath:indexPath];
        
        if (indexPath.section != 0) {
            for (UILabel *label in headerView.subviews) {
                [label removeFromSuperview];
            }
            
  
            UILabel *titleLabel = [[UILabel alloc]init];
            titleLabel.textColor = [UIColor blueColor];
            titleLabel.font = [UIFont systemFontOfSize:13];
            titleLabel.textAlignment = NSTextAlignmentLeft;
            titleLabel.text = self.rightDataArray[indexPath.section-1][@"name"];
            [headerView addSubview:titleLabel];
            [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.right.equalTo(headerView);
                make.left.equalTo(headerView.mas_left).offset(10);
            }];
            
            
        }
        
        
        
        reuserbleViwe = headerView;
        
        return reuserbleViwe;
        
    }
    return nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
      NSLog(@"==== id:%@ =====",self.rightDataArray[indexPath.section-1][@"_child"][indexPath.row][@"cateid"]);
}


#pragma mark -  私有方法
- (void)leftTableViewOffsetWithIndexPath:(NSIndexPath *)indexPath
{
    //判断点击的cell是否靠近底部，或顶部，是则偏移指定位移
    CGRect rect = [self.leftTableView rectForRowAtIndexPath:indexPath];
    
    CGFloat total_offset = self.leftTableView.contentSize.height - self.leftTableView.mj_h;//总偏移
//    NNHWeakSelf(self);
    __weak typeof(self) weakself = self;
    //50为cell高度,乘以3表示点击下面三个时偏移
    if (rect.origin.y - self.leftTableView.mj_offsetY >= self.leftTableView.mj_h - 50 * 3 - 1) {
        
        CGFloat contentOffset_y = self.leftTableView.mj_offsetY + 50 * 3;
        
        if (total_offset - self.leftTableView.mj_offsetY < 50 * 3) {
            //判断ios 11直接设置偏移无效，我也没弄懂，必须延时才有效
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [weakself.leftTableView setContentOffset:CGPointMake(0, total_offset) animated:YES];
            });
        }
        else
        {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [weakself.leftTableView setContentOffset:CGPointMake(0, contentOffset_y) animated:YES];
            });
        }
    }
    //50为cell高度,乘以3表示点击上面三个时偏移
    else if (rect.origin.y - self.leftTableView.mj_offsetY < 50 * 3)
    {
        CGFloat contentOffset_y = self.leftTableView.mj_offsetY - 50 * 3;
        
        if (self.leftTableView.mj_offsetY < 50 * 3) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [weakself.leftTableView setContentOffset:CGPointMake(0, 0) animated:YES];
            });
            
        }
        else
        {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [weakself.leftTableView setContentOffset:CGPointMake(0, contentOffset_y) animated:YES];
            });
            
        }
    }
    
}



#pragma mark - 懒加载
- (UICollectionView *)rightCollectionView{
    if (_rightCollectionView == nil) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.minimumLineSpacing = 10;
        flowLayout.minimumInteritemSpacing = 5;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        _rightCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _rightCollectionView.delegate = self;
        _rightCollectionView.dataSource = self;
        _rightCollectionView.backgroundColor = [UIColor whiteColor];
        
        /** 注册 */
        [_rightCollectionView registerClass:[MYDSortTopCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([MYDSortTopCollectionViewCell class])];
        [_rightCollectionView registerClass:[MYDSortCommonCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([MYDSortCommonCollectionViewCell class])];
        
        /** 注册-头部视图 */
        [_rightCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HEADER_ID];
        
    }
    return _rightCollectionView;
}

- (UITableView *)leftTableView{
    if (_leftTableView == nil) {
        _leftTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _leftTableView.delegate = self;
        _leftTableView.dataSource = self;
        _leftTableView.backgroundColor = [UIColor whiteColor];
        _leftTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        [_leftTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        _leftTableView.showsVerticalScrollIndicator = NO;
        
        /** 注册 */
        [_leftTableView registerClass:[MYDSortLeftTableViewCell class] forCellReuseIdentifier:NSStringFromClass([MYDSortLeftTableViewCell class])];
        
    }
    return _leftTableView;
}


- (NSMutableArray *)leftDataArray{
    if (_leftDataArray == nil) {
        _leftDataArray = [NSMutableArray array];
    }
    return _leftDataArray;
}

- (NSMutableArray *)rightDataArray{
    if (_rightDataArray == nil) {
        _rightDataArray = [NSMutableArray array];
    }
    return _rightDataArray;
}

@end
