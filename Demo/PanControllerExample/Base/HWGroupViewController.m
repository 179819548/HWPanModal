//
//  HWGroupViewController.m
//  HWPanModal_Example
//
//  Created by heath wang on 2019/4/30.
//  Copyright © 2019 HeathWang. All rights reserved.
//

#import "HWGroupViewController.h"
#import "HWColorCell.h"
#import <HWPanModal/HWPanModal.h>
#import <Masonry/Masonry.h>

@interface HWGroupViewController () <HWPanModalPresentable>

@property (nonatomic, strong) UIView *footerView;

@end

@implementation HWGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:HWColorCell.class forCellReuseIdentifier:NSStringFromClass(HWColorCell.class)];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.showsVerticalScrollIndicator = NO;

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.colors.count * 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HWColorCell *colorCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(HWColorCell.class) forIndexPath:indexPath];
    colorCell.contentView.backgroundColor = [self colorWithIndex:indexPath.row];
    return colorCell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

#pragma mark - HWPanModalPresentable

- (PanModalHeight)longFormHeight {
    return PanModalHeightMake(PanModalHeightTypeMaxTopInset, 200);
}

- (PanModalHeight)mediumFormHeight {
    return PanModalHeightMake(PanModalHeightTypeContent, 400);
}

- (PanModalHeight)shortFormHeight {
    return PanModalHeightMake(PanModalHeightTypeContent, 200);
}

- (PresentationState)originPresentationState {
    return PresentationStateLong;
}

- (UIScrollView *)panScrollable {
    return self.tableView;
}

- (BOOL)showsScrollableVerticalScrollIndicator {
    return NO;
}

- (void)presentedViewDidMoveToSuperView {

    UIView *testView = [UIView new];
    testView.backgroundColor = [UIColor redColor];
    [self.hw_rootContainerView addSubview:testView];
    [testView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(@0);
        make.height.mas_equalTo(44);
    }];
    
    self.footerView = testView;
}

- (void)panModalWillDismiss {
    [self.footerView removeFromSuperview];
}

- (BOOL)allowsPullDownWhenShortState {
    return NO;
}

#pragma mark - Getter

- (NSArray<UIColor *> *)colors {
    if (!_colors) {
        _colors = @[[UIColor colorWithRed:0.000 green:0.992 blue:0.102 alpha:1.00],
                    [UIColor colorWithRed:0.816 green:0.980 blue:0.000 alpha:1.00],
                    [UIColor colorWithRed:0.000 green:0.992 blue:0.888 alpha:1.00],
                    [UIColor colorWithRed:0.000 green:0.670 blue:1.000 alpha:1.00],
                    [UIColor colorWithRed:0.612 green:0.291 blue:1.000 alpha:1.00],
                    [UIColor colorWithRed:1.000 green:0.485 blue:0.828 alpha:1.00],
                    [UIColor colorWithRed:1.000 green:0.544 blue:0.350 alpha:1.00],
                    [UIColor colorWithRed:0.749 green:0.982 blue:0.800 alpha:1.00]];
    }
    return _colors;
}

- (UIColor *)colorWithIndex:(NSInteger)index {
    return self.colors[index % self.colors.count];
}

@end
