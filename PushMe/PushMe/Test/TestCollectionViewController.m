//
//  TestCollectionViewController.m
//  PushMe
//
//  Created by Aleksandr Fetisov on 18.03.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

#import "TestCollectionViewController.h"
#import "TestCollectionViewCell.h"
#import "TestCollectionHeaderView.h"
#import "TestResultViewController.h"

@interface TestCollectionViewController() <UICollectionViewDelegate, UICollectionViewDataSource, UISearchResultsUpdating>
@property (nonatomic, strong) UISearchController *searchController;
@property (strong, nonatomic) UICollectionView *collectionView;
@property (nonatomic, strong) TestResultViewController *resultsController;
@property (strong, nonatomic) NSArray *array;
@property (nonatomic, strong) UILabel *label;
- (NSString *)randomString;

@end


@implementation TestCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"тест поиска по коллекции";
    self.view.backgroundColor = [UIColor whiteColor];
    _array = [self arrayOfRandomStrings];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 10.0;
    layout.minimumInteritemSpacing = 10.0;
    layout.itemSize = CGSizeMake(100.0, 100.0);
    layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width - 20, 60);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(10, 10, self.view.frame.size.width - 20, self.view.frame.size.height) collectionViewLayout:layout];
    _collectionView.backgroundColor = self.view.backgroundColor;
    _collectionView.dataSource = self;
    [_collectionView registerClass:[TestCollectionViewCell class] forCellWithReuseIdentifier:@"ReuseIdentifier"];
    [_collectionView registerClass:[TestCollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderViewIdentifier"];
    
    [self.view addSubview:_collectionView];
    
    _resultsController = [[TestResultViewController alloc] initWithCollectionViewLayout:layout];
    
    _searchController = [[UISearchController alloc] initWithSearchResultsController:_resultsController];
    _searchController.searchResultsUpdater = self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TestCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"ReuseIdentifier" forIndexPath:indexPath];

    cell.label.text = _array[indexPath.row];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    TestCollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderViewIdentifier" forIndexPath:indexPath];
    
    [headerView addSubview:(_searchController.searchBar)];
    
    return headerView;
}

- (NSString *)randomString {
    NSString *abc = @"abcdefghijklmnopqrstuvwxwz";
    int length = 6;
    NSMutableString *randomString = [NSMutableString stringWithCapacity: length];

        for (int i=0; i<length; i++) {
             [randomString appendFormat: @"%c", [abc characterAtIndex: arc4random_uniform([abc length])]];
        }
        return randomString;
    }

-(NSMutableArray *)arrayOfRandomStrings {
    int count = 100;
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:count];
    for (int i=0; i<count; i++) {
        [array addObject:[self randomString]];
    }
    return array;
}

- (void)updateSearchResultsForSearchController:(nonnull UISearchController *)searchController {
    if (searchController.searchBar.text) {
        _resultsController.results = [self.array filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF CONTAINS[cd] %@", searchController.searchBar.text]];
        [_resultsController update];
    }
}

@end

