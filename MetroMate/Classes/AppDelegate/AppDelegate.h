//
//  AppDelegate.h
//  MetroMate
//
//  Created by Ali Mahouk on 12/5/13.
//  Copyright (c) 2013 Ali Mahouk. All rights reserved.
//

#import "SHStrobeLight.h"
#import "SHDataController.h"
#import "RootViewController.h"

#define IS_IOS6                         kCFCoreFoundationVersionNumber > kCFCoreFoundationVersionNumber_iOS_5_0
#define IS_IOS7                         kCFCoreFoundationVersionNumber > kCFCoreFoundationVersionNumber_iOS_6_1
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
#define SH_DOMAIN @"localhost"          // For use in URLs. Alternate between actual domain and localhost for testing purposes.
#define APP_NAME @"MetroMate"
#define APP_TARGET_PLATFORM @"iOS"
#define APP_TARGET_PLATFORM_MINVER @"5.0"
#define APP_VERSION @"1.0"
#define APP_ID @"697943749"

#define TIME_FROM_ANNOUNCEMENT 14       // Seconds between the train's arrival announcement and it coming to a stop.
#define TIME_ON_PLATFORM 25             // 25 second wait.
#define TIME_ON_PLATFORM_INTER_RED 35   // 35 second wait.
#define TIME_ON_PLATFORM_INTER_GREEN 45 // 45 second wait.

#define MAIN_FONT_SIZE 18
#define MIN_MAIN_FONT_SIZE 15
#define SECONDARY_FONT_SIZE 12
#define MIN_SECONDARY_FONT_SIZE 10

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    RootViewController *rootView;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong, nonatomic) SHDataController *dataController;
@property (nonatomic) CLLocationCoordinate2D currentLocation;
@property (strong, nonatomic) NSArray *stationCoordinates_red;
@property (strong, nonatomic) NSArray *stationList_express_Rashidiya;
@property (strong, nonatomic) NSArray *stationList_express_JebelAli;
@property (strong, nonatomic) NSArray *stationList_red_numbers;
@property (strong, nonatomic) NSArray *stationList_red_names_en;
@property (strong, nonatomic) NSArray *stationList_red_names_ar;
@property (strong, nonatomic) NSArray *stationTimeDifference_red;
@property (nonatomic, retain) NSMutableArray *stationTimings_Rashidiya_weekDays;
@property (nonatomic, retain) NSMutableArray *stationTimings_Rashidiya_friday;
@property (nonatomic, retain) NSMutableArray *stationTimings_Rashidiya_saturday;
@property (nonatomic, retain) NSMutableArray *stationTimings_JebelAli_weekDays;
@property (nonatomic, retain) NSMutableArray *stationTimings_JebelAli_friday;
@property (nonatomic, retain) NSMutableArray *stationTimings_JebelAli_saturday;
@property (strong, nonatomic) NSArray *stationCoordinates_green;
@property (strong, nonatomic) NSArray *stationList_green_numbers;
@property (strong, nonatomic) NSArray *stationList_green_names_en;
@property (strong, nonatomic) NSArray *stationList_green_names_ar;
@property (strong, nonatomic) NSArray *stationTimeDifference_green;
@property (nonatomic, retain) NSMutableArray *stationTimings_Creek_weekDays;
@property (nonatomic, retain) NSMutableArray *stationTimings_Creek_friday;
@property (nonatomic, retain) NSMutableArray *stationTimings_Etisalat_weekDays;
@property (nonatomic, retain) NSMutableArray *stationTimings_Etisalat_friday;
@property (strong, nonatomic) NSString *direction;
@property (nonatomic, retain) SHStrobeLight *strobeLight;

- (void)calculateBeforeNoorForRashidiya;
- (void)calculateAfterNoorForRashidiya;
- (void)calculateBeforeNoorForJebelAli;
- (void)calculateAfterNoorForJebelAli;
- (void)calculateForEtisalat;
- (void)calculateForCreek;
- (NSString *)westernToArabicNumerals:(NSString *)numericString;
- (void)saveAction;
- (NSString *)applicationDocumentsDirectory;

@end
