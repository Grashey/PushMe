//
//  TicketTableViewCell.h
//  PushMe
//
//  Created by Aleksandr Fetisov on 01.03.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

#import "DataManager.h"
#import "APIManager.h"
#import "Ticket.h"

@interface TicketTableViewCell : UITableViewCell

@property (nonatomic, strong) Ticket *ticket;

@end

