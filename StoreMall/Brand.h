//
//  Brand.h
//  StoreMall
//
//  Created by dustrise on 01/04/13.
//  Copyright (c) 2013 dustrise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"

@interface Brand : UITableViewController
{
    
    NSString *source, *destination;
    NSArray *docpath;
    NSFileManager *manager;
    NSMutableArray *Arrvalues,*Arrvalues1;
    NSString *str,*str1;
    NSArray *arr,*arr1;
    
}

@property(nonatomic, retain) NSString *values;

-(void)branddisplay:(id)sender;


    

@end
