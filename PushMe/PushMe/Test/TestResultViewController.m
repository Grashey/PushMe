//
//  TestResultViewController.m
//  PushMe
//
//  Created by Aleksandr Fetisov on 19.03.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

#import "TestResultViewController.h"
#import "TestCollectionViewCell.h"

@interface TestResultViewController ()

@end

@implementation TestResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.collectionView registerClass:[TestCollectionViewCell class] forCellWithReuseIdentifier:@"ReuseIdentifier"];
    
}

#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _results.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TestCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"ReuseIdentifier" forIndexPath:indexPath];

    cell.label.text = _results[indexPath.row];
    return cell;
}

- (void)update {
    [self.collectionView reloadData];
}


@end
