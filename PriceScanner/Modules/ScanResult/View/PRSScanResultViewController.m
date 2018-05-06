//
//  PRSScanResultViewController.m
//  PriceScanner
//
//  Created by Chausov Alexander on 04/05/2018.
//  Copyright © 2018 ChausovCompany. All rights reserved.
//

#import "PRSScanResultViewController.h"
#import "PRSScanResultViewOutput.h"


@interface PRSScanResultViewController ()

@end


@implementation PRSScanResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.output viewLoaded];
}

#pragma mark - PRSScanResultViewInput
- (void)setupInitialState:(BOOL)isModalState {
    [self configureNavigationBar];
    if (isModalState) {
        [self configureCloseModuleButton];
    }
}

#pragma mark - Actions
- (void)tapOnCloseButton {
    [self.output closeModule];
}

#pragma mark - Configure
- (void)configureNavigationBar {
    self.title = @"Результаты сканирования".localized;
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@" " style:UIBarButtonItemStylePlain target:nil action:nil];
}

- (void)configureCloseModuleButton {
    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    closeButton.tintColor = [UIColor prsMainThemeColor];
    closeButton.frame = CGRectMake(0, 0, 44, 44);
    [closeButton setImage:[UIImage imageNamed:@"icClose"] forState:UIControlStateNormal];
    [closeButton addTarget:self action:@selector(tapOnCloseButton) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *closeItem = [[UIBarButtonItem alloc] initWithCustomView:closeButton];
    self.navigationItem.rightBarButtonItem = closeItem;
}

@end