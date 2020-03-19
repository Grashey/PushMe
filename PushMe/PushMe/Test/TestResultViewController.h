//
//  TestResultViewController.h
//  PushMe
//
//  Created by Aleksandr Fetisov on 19.03.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestResultViewController : UICollectionViewController

- (void)update;
@property (strong, nonatomic) NSArray *results;

@end

NS_ASSUME_NONNULL_END
