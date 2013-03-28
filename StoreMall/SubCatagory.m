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
                
                NSString *str=[NSString stringWithUTF8String:(char *) sqlite3_column_text(stmt, 0)];
                
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
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
