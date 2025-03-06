//
//  SHDataController.h
//  MetroMate
//
//  Created by Ali Mahouk on 5/24/13.
//  Copyright (c) 2013 Ali Mahouk. All rights reserved.
//

@interface SHDataController : NSObject {
    NSPersistentStoreCoordinator *persistentStoreCoordinator;
    NSManagedObjectContext *managedObjectContext;
}

@property (strong) NSMutableArray *dataArray;

- (NSString *)readProperty:(NSString *)property;
- (void)writeValue:(NSString *)value forProperty:(NSString *)property;

@end
