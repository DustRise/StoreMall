//
//  SubCatagory.h
//  StoreApp
//
//  Created by dustrise on 25/03/13.
//  Copyright (c) 2013 dustrise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"

@interface SubCatagory : UITableViewController
{

    NSString *source, *destination;
    NSArray *docpath;
    NSFileManager *manager;
    NSMutableArray *Arrvalues;
     
    
}

@property(nonatomic, retain) NSString *values;

-(void)display;

@end
