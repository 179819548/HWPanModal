//
//  HWCollectionPanModalView.m
//  HWPanModalDemo
//
//  Created by heath wang on 2020/1/15.
//  Copyright © 2020 wangcongling. All rights reserved.
//

#import "HWCollectionPanModalView.h"
#import "HWColorCollectionViewCell.h"
#import "UIColor+HW.h"

@interface HWCollectionPanModalView () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation HWCollectionPanModalView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.collectionView];

    }

    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.collectionView.frame = CGRectMake(0, 40, CGRectGetWidth(self.bounds), 110);
}


#pragma mark - HWPanModalPresentable

- (PanModalHeight)shortFormHeight {
    return PanModalHeightMake(PanModalHeightTypeContent, 160);
}

- (PanModalHeight)longFormHeight {
    return PanModalHeightMake(PanModalHeightTypeContent, 240);
}

- (BOOL)showDragIndicator {
    return NO;
}

- (BOOL)shouldRespondToPanModalGestureRecognizer:(UIPanGestureRecognizer *)panGestureRecognizer {
    CGPoint point = [panGestureRecognizer locationInView:self];
    if (CGRectContainsPoint(self.collectionView.frame, point)) {
        return NO;
    }
    
    return YES;
    
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HWColorCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(HWColorCollectionViewCell.class) forIndexPath:indexPath];
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell isKindOfClass:HWColorCollectionViewCell.class]) {
        cell.backgroundColor = [UIColor hw_randomColor];
    }
}

#pragma mark - Getter

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        flowLayout.itemSize = CGSizeMake((screenSize.width - 60) / 2, 66);
        flowLayout.minimumInteritemSpacing = 20;
        flowLayout.minimumLineSpacing = 20;

        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        
        _collectionView.backgroundColor = [UIColor colorWithRed:0.690 green:0.961 blue:0.400 alpha:1.00];
        [_collectionView registerClass:HWColorCollectionViewCell.class  forCellWithReuseIdentifier:NSStringFromClass(HWColorCollectionViewCell.class)];
        _collectionView.contentInset = UIEdgeInsetsMake(20, 20, 20, 20);

        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

@end
