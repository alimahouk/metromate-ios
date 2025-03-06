//
//  SHProjectController.m
//  Shelf
//
//  Created by Ali Mahouk on 4/6/13.
//  Copyright (c) 2013 Ali Mahouk. All rights reserved.
//

#import "SHDataController.h"
#import "AppDelegate.h"
#import "App.h"

@implementation SHDataController

- (id)init
{
    self = [super init];
    
    if ( self )
    {
        if ( managedObjectContext == nil )
        {
            persistentStoreCoordinator = [(AppDelegate *)[[UIApplication sharedApplication] delegate] persistentStoreCoordinator];
            managedObjectContext = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
        }
        
        /*
         Fetch existing SHProject objects.
         Create a fetch request; find the SHProject entity and assign it to the request; then execute the fetch.
         */
        NSFetchRequest *request_project = [[NSFetchRequest alloc] init];
        
        NSEntityDescription *entity_project = [NSEntityDescription entityForName:@"App" inManagedObjectContext:managedObjectContext];
        [request_project setEntity:entity_project];
        
        // Execute the fetch -- create a mutable copy of the result.
        NSError *error_project = nil;
        _dataArray = [[managedObjectContext executeFetchRequest:request_project error:&error_project] mutableCopy];
        
        if ( _dataArray == nil ) // Handle the error.
        {
            NSLog(@"Empty fetch results.");
        }
    }
    
    return self;
}

- (NSString *)readProperty:(NSString *)property
{
    if ( _dataArray.count == 0 )
    {
        [self writeValue:@"" forProperty:@"runCount"];
    }
    
    App *app = (App *)[_dataArray objectAtIndex:0];
    
    if ([property isEqualToString:@"cardBalance"]) {
        return [NSString stringWithFormat:@"%@", app.cardBalance];
    } else if ([property isEqualToString:@"cardNumber"]) {
        return [NSString stringWithFormat:@"%@", app.cardNumber];
    } else if ([property isEqualToString:@"cardType"]) {
        return [NSString stringWithFormat:@"%@", app.cardType];
    } else if ([property isEqualToString:@"homeStation"]) {
        return [NSString stringWithFormat:@"%@", app.homeStation];
    } else if ([property isEqualToString:@"rideCount"]) {
        return [NSString stringWithFormat:@"%@", app.rideCount];
    } else if ([property isEqualToString:@"runCount"]) {
        return [NSString stringWithFormat:@"%@", app.runCount];
    } else if ([property isEqualToString:@"totalCashSpent"]) {
        return [NSString stringWithFormat:@"%@", app.totalCashSpent];
    } else if ([property isEqualToString:@"totalTimeSpent"]) {
        return [NSString stringWithFormat:@"%@", app.totalTimeSpent];
    } else {
        return @"Error! Invalid property!";
    }
}

- (void)writeValue:(NSString *)value forProperty:(NSString *)property
{
    App *app;
    
    if ( [value isEqual:[NSNull null]] )
    {
        value = @"";
    }
    
    if ( _dataArray.count == 0 )
    {
        app = (App *)[NSEntityDescription insertNewObjectForEntityForName:@"App" inManagedObjectContext:managedObjectContext];
        app.cardBalance = @"0.00"; // Default values.
        app.cardNumber = @"";
        app.cardType = @"silver";
        app.homeStation = @"";
        app.rideCount = @"0";
        app.totalCashSpent = @"0.00";
        app.totalTimeSpent = @"0";
        
        // Commit the change.
        NSError *error;
        if ( ![managedObjectContext save:&error] )
        {
            // Handle the error.
        }
        
        [_dataArray insertObject:app atIndex:0];
    }
    
    app = (App *)[_dataArray objectAtIndex:0];
    
    if ( [property isEqualToString:@"cardBalance"] )
    {
        app.cardBalance = value;
    } else if ( [property isEqualToString:@"cardNumber"] )
    {
        app.cardNumber = value;
    }
    else if ( [property isEqualToString:@"cardType"] )
    {
        app.cardType = value;
    }
    else if ( [property isEqualToString:@"homeStation"] )
    {
        app.homeStation = value;
    }
    else if ( [property isEqualToString:@"rideCount"] )
    {
        app.rideCount = value;
    }
    else if ( [property isEqualToString:@"runCount"] )
    {
        app.runCount = value;
    }
    else if ( [property isEqualToString:@"totalCashSpent"] )
    {
        app.totalCashSpent = value;
    }
    else if ( [property isEqualToString:@"totalTimeSpent"] )
    {
        app.totalTimeSpent = value;
    }
    
    // Commit the change.
    NSError *error;
    
    if ( ![managedObjectContext save:&error] )
    {
        // Handle the error.
    }
}

@end
