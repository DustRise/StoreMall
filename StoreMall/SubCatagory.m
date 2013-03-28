//
//  SubCatagory.m
//  StoreApp
//
//  Created by dustrise on 25/03/13.
//  Copyright (c) 2013 dustrise. All rights reserved.
//

#import "SubCatagory.h"

@interface SubCatagory ()

@end

@implementation SubCatagory

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    Arrvalues=[[NSMutableArray alloc]init];
    
    [self.navigationController setTitle:@"Catagorey"];
    
    source=[[NSBundle mainBundle]pathForResource:@"Stores" ofType:@"sqlite"];
    
    NSLog(@"Source : %@", source);
    
    docpath=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    
    NSLog(@"Path is : %@", docpath);
    
    
    
    destination=[[NSString alloc]initWithFormat:@"%@/Stores.sqlite",[docpath objectAtIndex:0]];
    
    
    NSLog(@"Destination : %@", destination);
    
    
    
    manager=[[NSFileManager alloc]init];
    
    
    if([manager fileExistsAtPath:destination]==YES)
    {
        
        NSLog(@"File alresdy existed");
        
    }
    else
    {
        
        NSError *err;
        
        [manager copyItemAtPath:source toPath:destination error:&err];
        
        NSLog(@"File has some problem");
        
    }
    [self display];
    
}

-(void)display;
{
    sqlite3 *database;
    
    
    if (sqlite3_open([destination UTF8String], &database)==SQLITE_OK)
    {
        
        NSString *query=@"select * from product";
        
        sqlite3_stmt *stmt;
        
        if(sqlite3_prepare_v2(database, [query UTF8String], -1, &stmt, nil)==SQLITE_OK)
        {
            while (sqlite3_step(stmt)==SQLITE_ROW)
            {
                
                NSString *str=[NSString stringWithUTF8String:(char *) sqlite3_column_text(stmt, 4)];
                
                NSLog(@"Values is : %@", str);
                
                [Arrvalues addObject:str];
                
            }
            
            
        }
        
    }
}
 
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
        return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [Arrvalues count];;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
        UITableViewCell *cell=[[UITableViewCell alloc]init];
    
        cell.textLabel.text=[Arrvalues objectAtIndex:indexPath.row];
    
        return cell;


}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    
}

@end
