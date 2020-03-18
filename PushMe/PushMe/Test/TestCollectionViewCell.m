//
//  TestCollectionViewCell.m
//  PushMe
//
//  Created by Aleksandr Fetisov on 18.03.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

#import "TestCollectionViewCell.h"

@implementation TestCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        
        _label = [[UILabel alloc] initWithFrame:CGRectMake(5, self.contentView.frame.size.height/2 - 10, self.contentView.frame.size.width - 10, 20)];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:14.0 weight:UIFontWeightRegular];
        [self.contentView addSubview:_label];
    }
    return self;
}

-(void)prepareForReuse {
    [super prepareForReuse];
    _label.text = nil;
}

@end
