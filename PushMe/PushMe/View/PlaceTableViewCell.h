//
//  PlaceTableViewCell.h
//  PushMe
//
//  Created by Aleksandr Fetisov on 24.02.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"
#import "Airport.h"

@interface PlaceTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UILabel *rightLabel;

-(void)configureWithCity:(City *) city;
-(void)configureWithAirport:(Airport *) airport;

@end

