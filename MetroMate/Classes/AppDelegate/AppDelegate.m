//
//  AppDelegate.m
//  MetroMate
//
//  Created by Ali Mahouk on 12/5/13.
//  Copyright (c) 2013 Ali Mahouk. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    
    _dataController = [[SHDataController alloc] init];
    
    // Set the usage count.
    if ( ![_dataController readProperty:@"runCount"] || [[_dataController readProperty:@"runCount"] isEqualToString:@""] )
    {
        [_dataController writeValue:@"1" forProperty:@"runCount"];
    }
    else
    {
        int usageCount = [[_dataController readProperty:@"runCount"] intValue];
        [_dataController writeValue:[NSString stringWithFormat:@"%d", ++usageCount] forProperty:@"runCount"];
    }
    
    _stationCoordinates_red = [[NSArray alloc] initWithObjects:@[@"25.230309", @"55.391162"],
                               @[@"25.241076", @"55.365729"],
                               @[@"25.244958", @"55.359592"],
                               @[@"25.248417", @"55.352468"],
                               @[@"25.249475", @"55.340002"],
                               @[@"25.253966", @"55.330136"],
                               @[@"25.262657", @"55.325131"],
                               @[@"25.266291", @"55.31389"],
                               @[@"25.254856", @"55.304312"],
                               @[@"25.244507", @"55.298218"],
                               @[@"25.233589", @"55.292172"],
                               @[@"25.22482", @"55.284979"],
                               @[@"25.217283", @"55.27984"],
                               @[@"25.211061", @"55.275559"],
                               @[@"25.201388", @"55.269518"],
                               @[@"25.191272", @"55.260404"],
                               @[@"25.155623", @"55.228443"],
                               @[@"25.126621", @"55.207774"],
                               @[@"25.121114", @"55.200344"],
                               @[@"25.114727", @"55.190855"],
                               @[@"25.101985", @"55.173683"],
                               @[@"25.088796", @"55.158008"],
                               @[@"25.079851", @"55.147414"],
                               @[@"25.070717", @"55.138546"],
                               @[@"25.05783", @"55.127136"],
                               @[@"25.046638", @"55.117416"],
                               @[@"25.026346", @"55.101244"],
                               @[@"25.001267", @"55.095711"],
                               @[@"24.977485", @"55.091007"], nil];
    
    _stationList_express_Rashidiya = [[NSArray alloc] initWithObjects:@"YES", // Rashidiya
                                      @"YES", // Emirates
                                      @"YES", // Airport Terminal 3
                                      @"YES", // Airport Terminal 1
                                      @"NO",  // GGICO
                                      @"YES", // Deira City Centre
                                      @"YES", // Al Rigga
                                      @"YES", // Union
                                      @"YES", // BurJuman
                                      @"YES", // Al Karama
                                      @"NO",  // Al Jafiliya
                                      @"YES", // World Trade Centre
                                      @"NO",  // Emirates Towers
                                      @"NO",  // Financial Centre
                                      @"NO",  // Burj Khalifa/Dubai Mall
                                      @"NO",  // Business Bay
                                      @"YES", // Noor Bank
                                      @"NO",  // First Gulf Bank
                                      @"NO",  // Mall of the Emirates
                                      @"NO",  // Sharaf DG
                                      @"NO",  // Dubai Internet City
                                      @"NO",  // Nakheel
                                      @"NO",  // Dubai Marina
                                      @"NO",  // Jumeirah Lakes Towers
                                      @"NO",  // Nakheel Harbour & Tower
                                      @"YES", // Ibn Battuta
                                      @"NO",  // Energy
                                      @"NO",  // Danube
                                      @"YES", nil]; // Jebel Ali
    
    _stationList_express_JebelAli = [[NSArray alloc] initWithObjects:@"YES", // Rashidiya
                                     @"YES", // Emirates
                                     @"NO", // Airport Terminal 3
                                     @"NO", // Airport Terminal 1
                                     @"NO",  // GGICO
                                     @"NO", // Deira City Centre
                                     @"YES", // Al Rigga
                                     @"YES", // Union
                                     @"YES", // BurJuman
                                     @"YES", // Al Karama
                                     @"YES",  // Al Jafiliya
                                     @"NO", // World Trade Centre
                                     @"YES",  // Emirates Towers
                                     @"NO",  // Financial Centre
                                     @"NO",  // Burj Khalifa/Dubai Mall
                                     @"NO",  // Business Bay
                                     @"YES", // Noor Bank
                                     @"YES",  // First Gulf Bank
                                     @"NO",  // Mall of the Emirates
                                     @"NO",  // Sharaf DG
                                     @"YES",  // Dubai Internet City
                                     @"NO",  // Nakheel
                                     @"NO",  // Dubai Marina
                                     @"NO",  // Jumeirah Lakes Towers
                                     @"NO",  // Nakheel Harbour & Tower
                                     @"YES", // Ibn Battuta
                                     @"NO",  // Energy
                                     @"NO",  // Danube
                                     @"YES", nil]; // Jebel Ali
    
    _stationList_red_numbers = [[NSArray alloc] initWithObjects:@"11",
                                @"12",
                                @"13",
                                @"14",
                                @"15",
                                @"16",
                                @"17",
                                @"18",
                                @"19",
                                @"20",
                                @"21",
                                @"22",
                                @"23",
                                @"24",
                                @"25",
                                @"26",
                                @"29",
                                @"31",
                                @"32",
                                @"33",
                                @"34",
                                @"35",
                                @"36",
                                @"37",
                                @"38",
                                @"39",
                                @"40",
                                @"41",
                                @"42", nil];
    
    _stationList_red_names_en = [[NSArray alloc] initWithObjects:@"Rashidiya",
                                 @"Emirates",
                                 @"Airport Terminal 3",
                                 @"Airport Terminal 1",
                                 @"GGICO",
                                 @"Deira City Centre",
                                 @"Al Rigga",
                                 @"Union",
                                 @"BurJuman",
                                 @"Al Karama",
                                 @"Al Jafiliya",
                                 @"World Trade Centre",
                                 @"Emirates Towers",
                                 @"Financial Centre",
                                 @"Burj Khalifa/Dubai Mall",
                                 @"Business Bay",
                                 @"Noor Bank",
                                 @"First Gulf Bank",
                                 @"Mall of the Emirates",
                                 @"Sharaf DG",
                                 @"Dubai Internet City",
                                 @"Nakheel",
                                 @"Dubai Marina",
                                 @"Jumeirah Lakes Towers",
                                 @"Nakheel Harbour & Tower",
                                 @"Ibn Battuta",
                                 @"Energy",
                                 @"Danube",
                                 @"Jebel Ali", nil];
    
    _stationList_red_names_ar = [[NSArray alloc] initWithObjects:@"الراشدية",
                                 @"طيران الإمارات",
                                 @"المبنى رقم ٣",
                                 @"المبنى رقم ١",
                                 @"جي جي كو",
                                 @"ديرة سيتي سنتر",
                                 @"الرقة",
                                 @"الاتحاد",
                                 @"برجمان",
                                 @"الكرامة",
                                 @"الجافلية",
                                 @"المركز التجاري العالمي",
                                 @"أبراج الإمارات",
                                 @"المركز المالي",
                                 @"برج خليفة/دبي مول",
                                 @"الخليج التجاري",
                                 @"بنك نور",
                                 @"بنك الخليج الأول",
                                 @"مول الإمارات",
                                 @"شرف دي جي",
                                 @"مدينة دبي للإنترنت",
                                 @"نخيل",
                                 @"مرسى دبي",
                                 @"أبراج بحيرات جميرا",
                                 @"نخيل هاربر اند تاور",
                                 @"ابن بطوطة",
                                  @"الطاقة",
                                 @"دانوب",
                                 @"جبل علي", nil];
    
    // Time difference between stations.
    _stationTimeDifference_red = [[NSArray alloc] initWithObjects:@"0", // Rashidiya
                                  @"4", // Emirates
                                  @"2", // Airport Terminal 3
                                  @"2", // Airport Terminal 1
                                  @"2", // GGICO
                                  @"2", // Deira City Centre
                                  @"2", // Al Rigga
                                  @"3", // Union
                                  @"2", // BurJuman
                                  @"2", // Al Karama
                                  @"2", // Al Jafiliya
                                  @"2", // World Trade Centre
                                  @"2", // Emirates Towers
                                  @"1", // Financial Centre
                                  @"3", // Burj Khalifa/Dubai Mall
                                  @"2", // Business Bay
                                  @"5", // Noor Bank
                                  @"3", // First Gulf Bank
                                  @"2", // Mall of the Emirates
                                  @"2", // Sharaf DG
                                  @"3", // Dubai Internet City
                                  @"3", // Nakheel
                                  @"2", // Dubai Marina
                                  @"2", // Jumeirah Lakes Towers
                                  @"2", // Nakheel Harbour & Tower
                                  @"3", // Ibn Battuta
                                  @"3", // Energy
                                  @"2", // Danube
                                  @"2", nil]; // Jebel Ali
    
    _stationTimings_Rashidiya_weekDays = [[NSMutableArray alloc] initWithObjects:@[
                                          // Rashidiya
                                          @"06:27:00",
                                          @"06:37:00"
                                          //-- End of Express trains
                                          ],
                                          @[
                                          // Emirates
                                          @"06:23:00",
                                          @"06:33:00"
                                          //-- End of Express trains
                                          ],
                                          @[
                                          // Airport Terminal 3
                                          @"06:22:00",
                                          @"06:32:00"
                                          //-- End of Express trains
                                          ],
                                          @[
                                          // Airport Terminal 1
                                          @"06:20:00",
                                          @"06:30:00"
                                          //-- End of Express trains
                                          ],
                                          @[],
                                          @[
                                          // Deira City Centre
                                          @"06:16:00",
                                          @"06:26:00"
                                          //-- End of Express trains
                                          ],
                                          @[
                                          // Al Rigga
                                          @"06:14:00",
                                          @"06:24:00"
                                          //-- End of Express trains
                                          ],
                                          @[
                                          // Union
                                          @"06:11:00",
                                          @"06:21:00"
                                          //-- End of Express trains
                                          ],
                                          @[
                                          // BurJuman
                                          @"06:09:00",
                                          @"06:19:00",
                                          //-- End of Express trains
                                          //-- Morning peak hours
                                          @"06:28:00",
                                          @"06:35:00",
                                          @"06:42:00"
                                          ],
                                          @[
                                          // Al Karama
                                          @"06:06:00",
                                          @"06:16:00"
                                          //-- End of Express trains
                                          ],
                                          @[],
                                          @[
                                          // World Trade Centre
                                          @"06:03:00",
                                          @"06:13:00"
                                          //-- End of Express trains
                                          ],
                                          @[],
                                          @[],
                                          @[],
                                          @[],
                                          @[
                                          // Noor Bank
                                          @"05:53:00",
                                          @"06:03:00",
                                          //-- End of Express trains
                                          @"06:21:00",
                                          //-- Morning peak hours
                                          @"06:27:00",
                                          @"06:33:00",
                                          @"06:39:00",
                                          @"06:45:00",
                                          @"06:51:00",
                                          @"06:57:00",
                                          @"07:03:00",
                                          @"07:09:00",
                                          @"07:15:00",
                                          @"07:18:00",
                                          @"07:21:00",
                                          @"07:24:00",
                                          @"07:27:00",
                                          @"07:30:00",
                                          @"07:33:00",
                                          @"07:36:00",
                                          @"07:39:00",
                                          @"07:42:00",
                                          @"07:45:00",
                                          @"07:48:00",
                                          @"07:51:00",
                                          @"07:57:00",
                                          @"08:03:00",
                                          @"08:09:00",
                                          @"08:15:00",
                                          @"08:21:00",
                                          @"08:27:00",
                                          @"08:33:00",
                                          @"08:39:00",
                                          @"08:45:00",
                                          @"08:48:00",
                                          @"08:51:00",
                                          @"08:57:00",
                                          @"09:03:00",
                                          @"09:06:00",
                                          @"09:09:00",
                                          @"09:15:00",
                                          @"09:21:00",
                                          @"09:27:00",
                                          @"09:30:00",
                                          @"09:33:00",
                                          //--Off-peak
                                          @"09:42:00",
                                          @"09:45:00",
                                          @"09:50:00",
                                          @"09:54:00",
                                          @"10:06:00",
                                          @"10:09:00",
                                          @"10:14:00",
                                          @"10:18:00",
                                          @"10:22:00",
                                          @"10:30:00",
                                          @"10:33:00",
                                          @"10:38:00",
                                          @"10:46:00",
                                          @"10:54:00",
                                          @"11:02:20",
                                          @"11:10:00",
                                          @"11:18:00",
                                          @"11:26:00",
                                          @"11:34:00",
                                          @"11:42:00",
                                          @"11:50:00",
                                          @"11:58:00",
                                          @"12:06:00",
                                          @"12:14:00",
                                          @"12:22:00",
                                          @"12:30:00",
                                          @"12:38:00",
                                          @"12:46:00",
                                          @"12:54:00",
                                          @"13:02:00",
                                          @"13:10:00",
                                          @"13:18:00",
                                          @"13:26:00",
                                          @"13:34:00",
                                          @"13:42:00",
                                          @"13:50:00",
                                          @"13:58:00",
                                          @"14:06:00",
                                          @"14:14:00",
                                          @"14:22:00",
                                          @"14:30:00",
                                          @"14:38:00",
                                          @"14:46:00",
                                          @"14:54:00",
                                          @"15:02:00",
                                          @"15:10:00",
                                          @"15:18:00",
                                          @"15:26:00",
                                          @"15:34:00",
                                          @"15:42:00",
                                          @"15:50:00",
                                          @"15:58:00",
                                          @"16:06:00",
                                          @"16:14:00",
                                          @"16:22:00",
                                          @"16:30:00",
                                          @"16:38:00",
                                          @"16:46:00",
                                          @"16:54:00",
                                          @"17:02:00",
                                          @"17:05:00",
                                          @"17:08:00",
                                          @"17:11:00",
                                          @"17:14:00",
                                          @"17:17:00",
                                          @"17:20:00",
                                          @"17:23:00",
                                          @"17:26:00",
                                          @"17:29:00",
                                          @"17:32:00",
                                          @"17:35:00",
                                          @"17:38:00",
                                          @"17:41:00",
                                          @"17:44:00",
                                          @"17:47:30",
                                          @"17:50:00",
                                          @"17:53:00",
                                          @"17:56:00",
                                          @"17:59:00",
                                          @"18:02:00",
                                          //-- Evening peak hours
                                          @"18:05:30",
                                          @"18:08:30",
                                          @"18:11:30",
                                          @"18:14:30",
                                          @"18:17:30",
                                          @"18:20:30",
                                          @"18:23:30",
                                          @"18:26:30",
                                          @"18:29:30",
                                          @"18:32:30",
                                          @"18:35:30",
                                          @"18:38:30",
                                          @"18:42:50",
                                          @"18:44:30",
                                          @"18:47:30",
                                          @"18:50:30",
                                          @"18:53:50",
                                          @"18:56:30",
                                          @"18:59:30",
                                          @"19:02:30",
                                          @"19:05:30",
                                          @"19:08:30",
                                          @"19:11:30",
                                          @"19:14:30",
                                          @"19:17:30",
                                          @"19:20:30",
                                          @"19:23:00",
                                          @"19:26:30",
                                          @"19:29:00",
                                          @"19:34:30",
                                          @"19:38:00",
                                          @"19:42:30",
                                          @"19:47:00",
                                          @"19:51:30",
                                          @"19:53:00",
                                          @"19:58:30",
                                          @"20:02:00",
                                          @"20:06:30",
                                          @"20:11:00",
                                          @"20:14:30",
                                          @"20:17:00",
                                          @"20:22:00",
                                          @"20:30:00",
                                          //--Off-peak
                                          @"20:38:00",
                                          @"20:46:00",
                                          @"20:54:00",
                                          @"21:02:00",
                                          @"21:10:00",
                                          @"21:18:00",
                                          @"21:26:00",
                                          @"21:34:00",
                                          @"21:42:00",
                                          @"21:50:00",
                                          @"21:58:00",
                                          @"22:06:00",
                                          @"22:14:00",
                                          @"22:22:00",
                                          @"22:30:00",
                                          @"22:40:00",
                                          @"22:50:00",
                                          @"23:00:00",
                                          @"23:10:00",
                                          @"23:20:00",
                                          @"23:30:00",
                                          @"23:40:00",
                                          @"23:50:00",
                                          @"00:00:00",
                                          @"00:10:00",
                                          @"00:20:00",
                                          @"00:30:00"
                                          ],
                                          @[],
                                          @[],
                                          @[],
                                          @[],
                                          @[],
                                          @[],
                                          @[],
                                          @[],
                                          @[
                                          // Ibn Battuta
                                          @"05:38:00",
                                          @"05:48:00"
                                          //-- End of Express trains
                                          ],
                                          @[],
                                          @[],
                                          @[
                                          // Jebel Ali
                                          @"05:30:00",
                                          @"05:40:00"
                                          //-- End of Express trains
                                          ], nil];
    
    _stationTimings_Rashidiya_friday = [[NSMutableArray alloc] initWithObjects:@[],
                                        @[],
                                        @[],
                                        @[],
                                        @[],
                                        @[],
                                        @[],
                                        @[],
                                        @[
                                        // BurJuman
                                        @"13:26:00",
                                        @"13:34:00",
                                        @"13:42:00"
                                        ],
                                        @[],
                                        @[],
                                        @[],
                                        @[],
                                        @[],
                                        @[],
                                        @[],
                                        @[
                                        // Noor Bank
                                        @"13:30:00",
                                        @"13:38:00",
                                        @"13:46:00",
                                        @"13:54:00",
                                        @"14:02:00",
                                        @"14:10:00",
                                        @"14:18:00",
                                        @"14:26:00",
                                        @"14:34:00",
                                        @"14:42:00",
                                        @"14:50:00",
                                        @"14:58:00",
                                        @"15:06:00",
                                        @"15:14:00",
                                        @"15:22:00",
                                        @"15:30:00",
                                        @"15:38:00",
                                        @"15:46:00",
                                        @"15:54:00",
                                        @"16:02:00",
                                        @"16:10:00",
                                        @"16:18:00",
                                        @"16:26:00",
                                        @"16:34:00",
                                        @"16:42:00",
                                        @"16:50:00",
                                        @"16:58:00",
                                        @"17:06:00",
                                        @"17:14:00",
                                        @"17:22:00",
                                        @"17:30:00",
                                        @"17:36:00",
                                        @"17:42:00",
                                        @"17:48:00",
                                        @"17:54:00",
                                        @"18:00:00",
                                        @"18:06:00",
                                        @"18:12:00",
                                        @"18:18:00",
                                        @"18:24:00",
                                        @"18:30:00",
                                        @"18:36:00",
                                        @"18:42:00",
                                        @"18:48:00",
                                        @"18:54:00",
                                        @"19:00:00",
                                        @"19:06:00",
                                        @"19:12:00",
                                        @"19:18:00",
                                        @"19:24:00",
                                        @"19:30:00",
                                        @"19:36:00",
                                        @"19:42:00",
                                        @"19:48:00",
                                        @"19:54:00",
                                        @"20:00:00",
                                        @"20:06:00",
                                        @"20:12:00",
                                        @"20:18:00",
                                        @"20:24:00",
                                        @"20:30:00",
                                        @"20:36:00",
                                        @"20:42:00",
                                        @"20:48:00",
                                        @"20:54:00",
                                        @"21:00:00",
                                        @"21:06:00",
                                        @"21:14:00",
                                        @"21:22:00",
                                        @"21:30:00",
                                        @"21:38:00",
                                        @"21:46:00",
                                        @"21:54:00",
                                        @"22:02:00",
                                        @"22:10:00",
                                        @"22:18:00",
                                        @"22:26:00",
                                        @"22:34:00",
                                        @"22:42:00",
                                        @"22:50:00",
                                        @"22:58:00",
                                        @"23:06:00",
                                        @"23:14:00",
                                        @"23:22:00",
                                        @"23:30:00",
                                        @"23:38:00",
                                        @"23:46:00",
                                        @"23:54:00",
                                        @"00:02:00",
                                        @"00:10:00",
                                        @"00:18:00",
                                        @"00:26:00"
                                        ],
                                        @[],
                                        @[],
                                        @[],
                                        @[],
                                        @[],
                                        @[],
                                        @[],
                                        @[],
                                        @[],
                                        @[],
                                        @[],
                                        @[], nil];
    
    _stationTimings_Rashidiya_saturday = [[NSMutableArray alloc] initWithObjects:@[
                                          // Rashidiya
                                          @"06:27:00",
                                          @"06:37:00"
                                          //-- End of Express trains
                                          ],
                                          @[
                                          // Emirates
                                          @"06:23:00",
                                          @"06:33:00"
                                          //-- End of Express trains
                                          ],
                                          @[
                                          // Airport Terminal 3
                                          @"06:22:00",
                                          @"06:32:00"
                                          //-- End of Express trains
                                          ],
                                          @[
                                          // Airport Terminal 1
                                          @"06:20:00",
                                          @"06:30:00"
                                          //-- End of Express trains
                                          ],
                                          @[],
                                          @[
                                          // Deira City Centre
                                          @"06:16:00",
                                          @"06:26:00"
                                          //-- End of Express trains
                                          ],
                                          @[
                                          // Al Rigga
                                          @"06:14:00",
                                          @"06:24:00"
                                          //-- End of Express trains
                                          ],
                                          @[
                                          // Union
                                          @"06:11:00",
                                          @"06:21:00"
                                          //-- End of Express trains
                                          ],
                                          @[
                                          // BurJuman
                                          @"06:09:00",
                                          @"06:19:00",
                                          //-- End of Express trains
                                          @"06:24:00",
                                          @"06:32:00",
                                          @"06:40:00"
                                          ],
                                          @[
                                          // Al Karama
                                          @"06:06:00",
                                          @"06:16:00"
                                          //-- End of Express trains
                                          ],
                                          @[],
                                          @[
                                          // World Trade Centre
                                          @"06:03:00",
                                          @"06:13:00"
                                          //-- End of Express trains
                                          ],
                                          @[],
                                          @[],
                                          @[],
                                          @[],
                                          @[
                                          // Noor Bank
                                          @"05:53:00",
                                          @"06:03:00",
                                          //-- End of Express trains
                                          @"06:20:00",
                                          @"06:28:00",
                                          @"06:36:00",
                                          @"06:44:00",
                                          @"06:52:00",
                                          @"07:00:00",
                                          @"07:08:05",
                                          @"07:16:19",
                                          @"07:24:00",
                                          @"07:32:00",
                                          @"07:40:00",
                                          @"07:48:30",
                                          @"07:56:00",
                                          @"08:04:00",
                                          @"08:12:00",
                                          @"08:20:00",
                                          @"08:28:00",
                                          @"08:36:00",
                                          @"08:44:00",
                                          @"08:52:00",
                                          @"09:00:00",
                                          @"09:08:05",
                                          @"09:16:19",
                                          @"09:24:00",
                                          @"09:32:00",
                                          @"09:40:00",
                                          @"09:48:00",
                                          @"09:56:00",
                                          @"10:04:00",
                                          @"10:12:00",
                                          @"10:20:00",
                                          @"10:28:00",
                                          @"10:36:00",
                                          @"10:44:00",
                                          @"10:52:00",
                                          @"11:00:00",
                                          @"11:08:05",
                                          @"11:16:19",
                                          @"11:24:00",
                                          @"11:32:00",
                                          @"11:40:00",
                                          @"11:48:00",
                                          @"11:56:00",
                                          @"12:04:00",
                                          @"12:12:00",
                                          @"12:20:00",
                                          @"12:28:00",
                                          @"12:36:00",
                                          @"12:44:00",
                                          @"12:52:00",
                                          @"13:00:00",
                                          @"13:08:05",
                                          @"13:16:19",
                                          @"13:24:00",
                                          @"13:32:00",
                                          @"13:40:00",
                                          @"13:48:00",
                                          @"13:56:00",
                                          @"14:04:00",
                                          @"14:12:00",
                                          @"14:20:00",
                                          @"14:28:00",
                                          @"14:36:00",
                                          @"14:44:00",
                                          @"14:52:00",
                                          @"14:00:00",
                                          @"14:08:05",
                                          @"14:16:19",
                                          @"14:24:00",
                                          @"14:32:00",
                                          @"14:40:00",
                                          @"14:48:00",
                                          @"14:56:00",
                                          @"15:04:00",
                                          @"15:12:00",
                                          @"15:20:00",
                                          @"15:28:00",
                                          @"15:36:00",
                                          @"15:44:00",
                                          @"15:52:00",
                                          @"16:00:00",
                                          @"16:08:05",
                                          @"16:16:19",
                                          @"16:24:00",
                                          @"16:32:00",
                                          @"16:40:00",
                                          @"16:48:00",
                                          @"16:56:00",
                                          @"17:04:00",
                                          @"17:12:00",
                                          @"17:20:00",
                                          @"17:28:00",
                                          @"17:36:00",
                                          @"17:44:00",
                                          @"17:52:00",
                                          //-- Evening peak hours
                                          @"17:58:30",
                                          @"18:04:30",
                                          @"18:10:30",
                                          @"18:16:30",
                                          @"18:22:30",
                                          @"18:28:30",
                                          @"18:34:30",
                                          @"18:40:30",
                                          @"18:46:30",
                                          @"18:52:30",
                                          @"18:58:15",
                                          @"19:04:20",
                                          @"19:06:30",
                                          @"19:12:30",
                                          @"19:18:30",
                                          @"19:24:30",
                                          @"19:30:30",
                                          @"19:36:30",
                                          @"19:42:30",
                                          @"19:47:30",
                                          @"19:54:30",
                                          @"19:57:30",
                                          @"20:00:30",
                                          //--Off-peak
                                          @"20:08:05",
                                          @"20:16:19",
                                          @"20:22:00",
                                          @"20:28:00",
                                          @"20:36:00",
                                          @"20:44:00",
                                          @"20:52:00",
                                          @"21:00:00",
                                          @"21:08:00",
                                          @"21:16:00",
                                          @"21:24:00",
                                          @"21:32:00",
                                          @"21:40:00",
                                          @"21:48:00",
                                          @"21:56:00",
                                          @"22:04:05",
                                          @"22:12:19",
                                          @"22:20:00",
                                          @"22:28:00",
                                          @"22:40:00",
                                          @"22:36:00",
                                          @"22:44:00",
                                          @"22:52:00",
                                          @"23:00:00",
                                          @"23:08:00",
                                          @"23:16:00",
                                          @"23:24:00"
                                          ],
                                          @[],
                                          @[],
                                          @[],
                                          @[],
                                          @[],
                                          @[],
                                          @[],
                                          @[],
                                          @[
                                          // Ibn Battuta
                                          @"05:38:00",
                                          @"05:48:00"
                                          //-- End of Express trains
                                          ],
                                          @[],
                                          @[],
                                          @[
                                          // Jebel Ali
                                          @"05:30:00",
                                          @"05:40:00"
                                          //-- End of Express trains
                                          ], nil];
    
    _stationTimings_JebelAli_weekDays = [[NSMutableArray alloc] initWithObjects:@[
                                         // Rashidiya
                                         @"05:30:00",
                                         @"06:40:00"
                                         //-- End of Express trains
                                         ],
                                         @[
                                         // Emirates
                                         @"05:34:00",
                                         @"05:44:00"
                                         //-- End of Express trains
                                         ],
                                         @[],
                                         @[],
                                         @[],
                                         @[],
                                         @[
                                         // Al Rigga
                                         @"05:39:00",
                                         @"05:49:00"
                                         //-- End of Express trains
                                         ],
                                         @[
                                         // Union
                                         @"05:42:00",
                                         @"05:52:00"
                                         //-- End of Express trains
                                         ],
                                         @[
                                         // BurJuman
                                         @"05:45:00",
                                         @"05:55:00"
                                         //-- End of Express trains
                                         ],
                                         @[
                                         // Al Karama
                                         @"05:48:00",
                                         @"05:58:00"
                                         //-- End of Express trains
                                         ],
                                         @[
                                         // Al Jafiliya
                                         @"05:51:00",
                                         @"06:01:00"
                                         //-- End of Express trains
                                         ],
                                         @[],
                                         @[
                                         // Emirates Towers
                                         @"05:53:00",
                                         @"06:03:00"
                                         //-- End of Express trains
                                         ],
                                         @[],
                                         @[],
                                         @[],
                                         @[
                                         // Noor Bank
                                         @"06:02:20",
                                         @"06:12:20",
                                         //-- End of Express trains
                                         @"06:27:20",
                                         //-- Morning peak hours
                                         @"06:33:20",
                                         @"06:39:20",
                                         @"06:45:20",
                                         @"06:51:20",
                                         @"06:57:20",
                                         @"07:03:20",
                                         @"07:09:20",
                                         @"07:12:20",
                                         @"07:15:20",
                                         @"07:18:20",
                                         @"07:21:20",
                                         @"07:24:20",
                                         @"07:27:20",
                                         @"07:30:20",
                                         @"07:33:20",
                                         @"07:36:20",
                                         @"07:39:20",
                                         @"07:42:20",
                                         @"07:45:20",
                                         @"07:48:20",
                                         @"07:51:20",
                                         @"07:54:20",
                                         @"07:57:20",
                                         @"08:00:20",
                                         @"08:03:20",
                                         @"08:06:20",
                                         @"08:09:20",
                                         @"08:12:20",
                                         @"08:15:50",
                                         @"08:18:20",
                                         @"08:21:20",
                                         @"08:24:20",
                                         @"08:27:20",
                                         @"08:30:20",
                                         @"08:33:20",
                                         @"08:36:20",
                                         @"08:39:20",
                                         @"08:43:20",
                                         @"08:46:20",
                                         @"08:49:20",
                                         @"08:52:20",
                                         @"08:55:20",
                                         @"08:58:20",
                                         @"09:01:20",
                                         @"09:04:20",
                                         @"09:07:20",
                                         @"09:10:20",
                                         @"09:13:20",
                                         @"09:16:20",
                                         @"09:19:20",
                                         @"09:22:20",
                                         @"09:25:20",
                                         @"09:28:20",
                                         @"09:31:20",
                                         @"09:34:20",
                                         @"09:40:20",
                                         @"09:49:20",
                                         @"09:58:20",
                                         @"10:05:12",
                                         //--Off-peak
                                         @"10:13:20",
                                         @"10:17:12",
                                         @"10:24:55",
                                         @"10:32:55",
                                         @"10:40:55",
                                         @"10:48:55",
                                         @"10:56:55",
                                         @"11:04:55",
                                         @"11:12:55",
                                         @"11:20:55",
                                         @"11:28:55",
                                         @"11:36:55",
                                         @"11:44:55",
                                         @"11:52:55",
                                         @"12:00:55",
                                         @"12:08:55",
                                         @"12:16:55",
                                         @"12:24:55",
                                         @"12:32:55",
                                         @"12:40:55",
                                         @"12:48:55",
                                         @"12:56:55",
                                         @"13:04:55",
                                         @"13:12:55",
                                         @"13:20:55",
                                         @"13:28:55",
                                         @"13:36:55",
                                         @"13:44:55",
                                         @"13:52:55",
                                         @"14:00:55",
                                         @"14:08:55",
                                         @"14:16:55",
                                         @"14:24:55",
                                         @"14:32:55",
                                         @"14:40:55",
                                         @"14:48:55",
                                         @"14:56:55",
                                         @"15:04:55",
                                         @"15:12:55",
                                         @"15:20:55",
                                         @"15:28:55",
                                         @"15:36:55",
                                         @"15:44:55",
                                         @"15:52:55",
                                         @"16:00:55",
                                         //-- Evening peak hours
                                         @"16:04:00",
                                         @"16:07:00",
                                         @"16:10:00",
                                         @"16:13:00",
                                         @"16:16:00",
                                         @"16:19:00",
                                         @"16:22:00",
                                         @"16:25:00",
                                         @"16:28:00",
                                         @"16:31:00",
                                         @"16:34:00",
                                         @"16:37:00",
                                         @"16:40:00",
                                         @"16:43:00",
                                         @"16:46:00",
                                         @"16:49:00",
                                         @"16:52:00",
                                         @"16:55:00",
                                         @"16:57:00",
                                         @"17:05:00",
                                         @"17:09:00",
                                         @"17:14:00",
                                         @"17:19:00",
                                         @"17:22:00",
                                         @"17:25:00",
                                         @"17:28:00",
                                         @"17:31:00",
                                         @"17:34:00",
                                         @"17:37:00",
                                         @"17:41:00",
                                         @"17:46:00",
                                         @"17:50:00",
                                         @"17:55:00",
                                         @"18:00:00",
                                         @"18:05:00",
                                         @"18:10:00",
                                         @"18:15:00",
                                         @"18:20:00",
                                         @"18:25:00",
                                         @"18:30:00",
                                         @"18:35:00",
                                         @"18:40:00",
                                         @"18:45:00",
                                         @"18:50:00",
                                         @"18:55:00",
                                         @"19:00:00",
                                         @"19:06:55",
                                         @"19:10:55",
                                         @"19:14:55",
                                         @"19:19:00",
                                         @"19:23:00",
                                         @"19:25:00",
                                         @"19:33:00",
                                         @"19:36:00",
                                         @"19:40:00",
                                         @"19:42:55",
                                         @"19:48:55",
                                         @"19:56:55",
                                         @"19:59:55",
                                         @"20:04:55",
                                         @"20:09:55",
                                         @"20:12:55",
                                         @"20:18:55",
                                         @"20:21:00",
                                         @"20:29:00",
                                         @"20:33:00",
                                         @"20:37:00",
                                         @"20:42:00",
                                         @"20:45:00",
                                         @"20:53:00",
                                         //--Off-peak
                                         @"21:01:20",
                                         @"21:09:20",
                                         @"21:17:20",
                                         @"21:25:20",
                                         @"21:33:20",
                                         @"21:41:20",
                                         @"21:49:20",
                                         @"22:57:20",
                                         @"22:05:20",
                                         @"22:13:20",
                                         @"22:21:20",
                                         @"22:29:20",
                                         @"22:39:20",
                                         @"22:49:20",
                                         @"22:59:20",
                                         @"23:09:20",
                                         @"23:19:20",
                                         @"23:29:20",
                                         @"23:39:20",
                                         @"23:49:20",
                                         @"23:59:20",
                                         @"00:09:20",
                                         @"00:19:20",
                                         @"00:29:20",
                                         @"00:39:20"
                                         ],
                                         @[
                                         // First Gulf Bank
                                         @"06:06:00",
                                         @"06:16:00"
                                         //-- End of Express trains,
                                         ],
                                         @[],
                                         @[],
                                         @[
                                         // Dubai Internet City
                                         @"06:10:00",
                                         @"06:20:00"
                                         //-- End of Express trains,
                                         ],
                                         @[],
                                         @[],
                                         @[],
                                         @[],
                                         @[
                                         // Ibn Battuta
                                         @"06:21:00",
                                         @"06:31:00"
                                         //-- End of Express trains
                                         ],
                                         @[],
                                         @[],
                                         @[
                                         // Jebel Ali
                                         @"06:29:00",
                                         @"06:39:00"
                                         //-- End of Express trains
                                         ], nil];
    
    _stationTimings_JebelAli_friday = [[NSMutableArray alloc] initWithObjects:@[],
                                       @[],
                                       @[],
                                       @[],
                                       @[],
                                       @[],
                                       @[],
                                       @[],
                                       @[],
                                       @[],
                                       @[],
                                       @[],
                                       @[],
                                       @[],
                                       @[],
                                       @[],
                                       @[
                                       // Noor Bank
                                       @"13:37:20",
                                       @"13:44:55",
                                       @"13:53:20",
                                       @"14:01:20",
                                       @"14:09:20",
                                       @"14:17:20",
                                       @"14:25:20",
                                       @"14:33:20",
                                       @"14:41:20",
                                       @"14:49:20",
                                       @"14:57:20",
                                       @"15:05:20",
                                       @"15:13:20",
                                       @"15:21:20",
                                       @"15:29:20",
                                       @"15:37:20",
                                       @"15:44:20",
                                       @"15:53:20",
                                       @"16:01:20",
                                       @"16:09:20",
                                       @"16:17:20",
                                       @"16:25:20",
                                       @"16:33:20",
                                       @"16:41:20",
                                       @"16:49:20",
                                       @"16:57:20",
                                       @"17:05:20",
                                       @"17:13:20",
                                       @"17:21:20",
                                       @"17:29:20",
                                       @"17:37:20",
                                       @"17:44:20",
                                       @"17:53:20",
                                       @"18:01:20",
                                       @"18:07:20",
                                       @"18:13:20",
                                       @"18:19:20",
                                       @"18:25:20",
                                       @"18:31:20",
                                       @"18:37:20",
                                       @"18:43:20",
                                       @"18:49:20",
                                       @"18:55:20",
                                       @"19:01:20",
                                       @"19:07:20",
                                       @"19:13:20",
                                       @"19:19:20",
                                       @"19:25:20",
                                       @"19:31:20",
                                       @"19:37:20",
                                       @"19:43:20",
                                       @"19:49:20",
                                       @"19:55:20",
                                       @"20:01:20",
                                       @"20:07:20",
                                       @"20:13:20",
                                       @"20:19:20",
                                       @"20:25:20",
                                       @"20:31:20",
                                       @"20:37:20",
                                       @"20:43:20",
                                       @"20:49:20",
                                       @"20:55:20",
                                       @"21:01:20",
                                       @"21:07:20",
                                       @"21:13:20",
                                       @"21:19:20",
                                       @"21:25:20",
                                       @"21:31:20",
                                       @"21:37:20",
                                       @"21:43:20",
                                       @"21:49:20",
                                       @"21:55:20",
                                       @"22:01:20",
                                       @"22:07:20",
                                       @"22:13:20",
                                       @"22:19:20",
                                       @"22:25:20",
                                       @"22:31:20",
                                       @"22:37:20",
                                       @"22:43:20",
                                       @"22:49:20",
                                       @"22:57:20",
                                       @"23:05:20",
                                       @"23:13:20",
                                       @"23:21:20",
                                       @"23:29:20",
                                       @"23:37:20",
                                       @"23:45:20",
                                       @"23:53:20",
                                       @"00:01:20",
                                       @"00:09:20",
                                       @"00:17:20",
                                       @"00:25:20",
                                       @"00:33:20"
                                       ],
                                       @[],
                                       @[],
                                       @[],
                                       @[],
                                       @[],
                                       @[],
                                       @[],
                                       @[],
                                       @[],
                                       @[],
                                       @[],
                                       @[], nil];
    
    _stationTimings_JebelAli_saturday = [[NSMutableArray alloc] initWithObjects:@[
                                         // Rashidiya
                                         @"05:30:00",
                                         @"06:40:00"
                                         //-- End of Express trains
                                         ],
                                         @[
                                         // Emirates
                                         @"05:34:00",
                                         @"05:44:00"
                                         //-- End of Express trains
                                         ],
                                         @[],
                                         @[],
                                         @[],
                                         @[],
                                         @[
                                         // Al Rigga
                                         @"05:39:00",
                                         @"05:49:00"
                                         //-- End of Express trains
                                         ],
                                         @[
                                         // Union
                                         @"05:42:00",
                                         @"05:52:00"
                                         //-- End of Express trains
                                         ],
                                         @[
                                         // BurJuman
                                         @"05:45:00",
                                         @"05:55:00"
                                         //-- End of Express trains
                                         ],
                                         @[
                                         // Al Karama
                                         @"05:48:00",
                                         @"05:58:00"
                                         //-- End of Express trains
                                         ],
                                         @[
                                         // Al Jafiliya
                                         @"05:51:00",
                                         @"06:01:00"
                                         //-- End of Express trains
                                         ],
                                         @[],
                                         @[
                                         // Emirates Towers
                                         @"05:53:00",
                                         @"06:03:00"
                                         //-- End of Express trains
                                         ],
                                         @[],
                                         @[],
                                         @[],
                                         @[
                                         // Noor Bank
                                         @"06:01:00",
                                         @"06:11:00",
                                         //-- End of Express trains
                                         @"06:27:55",
                                         @"06:34:55",
                                         @"06:43:55",
                                         @"06:51:00",
                                         @"06:58:55",
                                         @"07:06:55",
                                         @"07:14:55",
                                         @"07:22:55",
                                         @"07:30:55",
                                         @"07:39:00",
                                         @"07:45:00",
                                         @"07:50:55",
                                         @"07:57:00",
                                         @"08:03:00",
                                         @"08:09:00",
                                         @"08:15:00",
                                         @"08:20:55",
                                         @"08:26:55",
                                         @"08:34:55",
                                         @"08:43:55",
                                         @"08:51:00",
                                         @"08:58:55",
                                         @"09:06:55",
                                         @"09:14:55",
                                         @"09:22:55",
                                         @"09:30:55",
                                         @"09:39:00",
                                         @"09:47:00",
                                         @"09:54:55",
                                         @"10:03:00",
                                         @"10:11:00",
                                         @"10:19:00",
                                         @"10:27:55",
                                         @"10:34:55",
                                         @"10:43:55",
                                         @"10:51:00",
                                         @"10:58:55",
                                         @"11:06:55",
                                         @"11:14:55",
                                         @"11:22:55",
                                         @"11:30:55",
                                         @"11:39:00",
                                         @"11:47:00",
                                         @"11:54:55",
                                         @"12:03:00",
                                         @"12:11:00",
                                         @"12:19:00",
                                         @"12:27:55",
                                         @"12:34:55",
                                         @"12:43:55",
                                         @"12:51:00",
                                         @"12:58:55",
                                         @"13:06:55",
                                         @"13:14:55",
                                         @"13:22:55",
                                         @"13:30:55",
                                         @"13:39:00",
                                         @"13:47:00",
                                         @"13:54:55",
                                         @"14:03:00",
                                         @"14:11:00",
                                         @"14:19:00",
                                         @"14:27:55",
                                         @"14:34:55",
                                         @"14:43:55",
                                         @"14:51:00",
                                         @"14:58:55",
                                         @"15:06:55",
                                         @"15:14:55",
                                         @"15:22:55",
                                         @"15:30:55",
                                         @"15:39:00",
                                         @"15:47:00",
                                         @"15:54:55",
                                         @"16:03:00",
                                         @"16:11:00",
                                         @"16:19:00",
                                         @"16:27:55",
                                         @"16:34:55",
                                         @"16:43:55",
                                         @"16:51:00",
                                         @"16:58:55",
                                         @"16:06:55",
                                         @"16:14:55",
                                         @"16:22:55",
                                         @"16:30:55",
                                         @"16:39:00",
                                         @"16:47:00",
                                         @"16:54:55",
                                         @"17:03:00",
                                         @"17:11:00",
                                         @"17:19:00",
                                         @"17:27:55",
                                         @"17:34:55",
                                         @"17:43:55",
                                         @"17:51:00",
                                         @"17:58:55",
                                         @"18:06:55",
                                         //-- Evening peak hours
                                         @"18:10:30",
                                         @"18:16:30",
                                         @"18:22:30",
                                         @"18:28:30",
                                         @"18:34:30",
                                         @"18:40:30",
                                         @"18:46:30",
                                         @"18:52:30",
                                         @"18:58:30",
                                         @"19:04:30",
                                         @"19:10:30",
                                         @"19:16:30",
                                         @"19:22:30",
                                         @"19:28:30",
                                         @"19:34:30",
                                         @"19:40:30",
                                         @"19:46:30",
                                         @"19:52:30",
                                         @"19:58:30",
                                         @"20:04:30",
                                         @"20:10:30",
                                         @"20:16:30",
                                         @"20:22:30",
                                         @"20:28:30",
                                         @"20:34:30",
                                         @"20:40:30",
                                         @"20:46:30",
                                         //--Off-peak
                                         @"20:51:00",
                                         @"20:59:00",
                                         @"21:07:00",
                                         @"21:15:00",
                                         @"21:23:00",
                                         @"21:31:00",
                                         @"21:39:00",
                                         @"21:47:00",
                                         @"21:55:00",
                                         @"22:03:00",
                                         @"22:11:00",
                                         @"22:19:00",
                                         @"22:27:00",
                                         @"22:35:00",
                                         @"22:43:00",
                                         @"22:51:00",
                                         @"22:59:00",
                                         @"23:07:00",
                                         @"23:15:00",
                                         @"23:23:00",
                                         @"23:31:00"
                                         ],
                                         @[
                                         // First Gulf Bank
                                         @"06:06:00",
                                         @"06:16:00"
                                         //-- End of Express trains,
                                         ],
                                         @[],
                                         @[],
                                         @[
                                         // Dubai Internet City
                                         @"06:10:00",
                                         @"06:20:00"
                                         //-- End of Express trains,
                                         ],
                                         @[],
                                         @[],
                                         @[],
                                         @[],
                                         @[
                                         // Ibn Battuta
                                         @"06:21:00",
                                         @"06:31:00"
                                         //-- End of Express trains
                                         ],
                                         @[],
                                         @[],
                                         @[
                                         // Jebel Ali
                                         @"06:29:00",
                                         @"06:39:00"
                                         //-- End of Express trains
                                         ], nil];
    
    _stationCoordinates_green = [[NSArray alloc] initWithObjects:@[@"25.254816", @"55.401033"],
                                 @[@"25.26257", @"55.387439"],
                                 @[@"25.269822", @"55.374994"],
                                 @[@"25.273194", @"55.369323"],
                                 @[@"25.277851", @"55.361454"],
                                 @[@"25.277695", @"55.352699"],
                                 @[@"25.27527", @"55.346267"],
                                 @[@"25.270817", @"55.332963"],
                                 @[@"25.270332", @"55.320572"],
                                 @[@"25.266291", @"55.31389"],
                                 @[@"25.269218", @"55.307732"],
                                 @[@"25.276179", @"55.301686"],
                                 @[@"25.268738", @"55.293988"],
                                 @[@"25.265253", @"55.289056"],
                                 @[@"25.25816", @"55.297475"],
                                 @[@"25.254856", @"55.304312"],
                                 @[@"25.243643", @"55.315942"],
                                 @[@"25.230906", @"55.322862"], nil];
    
    _stationList_green_numbers = [[NSArray alloc] initWithObjects:@"11",
                                   @"12",
                                   @"13",
                                   @"14",
                                   @"15",
                                   @"16",
                                   @"17",
                                   @"18",
                                   @"19",
                                   @"20",
                                   @"21",
                                   @"22",
                                   @"23",
                                   @"24",
                                   @"25",
                                   @"26",
                                   @"27",
                                   @"28", nil];
    
    _stationList_green_names_en = [[NSArray alloc] initWithObjects:@"Etisalat",
                                 @"Al Qusais",
                                 @"Dubai Airport Free Zone",
                                 @"Al Nahda",
                                 @"Stadium",
                                 @"Al Qiyadah",
                                 @"Abu Hail",
                                 @"Abu Baker Al Siddique",
                                 @"Salah Al Din",
                                 @"Union",
                                 @"Baniyas Square",
                                 @"Palm Deira",
                                 @"Al Ras",
                                 @"Al Ghubaiba",
                                 @"Al Fahidi",
                                 @"BurJuman",
                                 @"Oud Metha",
                                 @"Dubai Healthcare City", nil];
    
    _stationList_green_names_ar = [[NSArray alloc] initWithObjects:@"اتصالات",
                                   @"القصيص",
                                   @"المنطقة الحرة بمطار دبي",
                                   @"النهدة",
                                   @"الاستاد",
                                   @"القيادة",
                                   @"أبو هيل",
                                   @"أبو بكر الصديق",
                                   @"صلاح الدين",
                                   @"الاتحاد",
                                   @"بني ياس",
                                   @"نخلة ديرة",
                                   @"الراس",
                                   @"الغبيبة",
                                   @"الفهيدي",
                                   @"برجمان",
                                   @"عود ميثاء",
                                   @"مدينة دبي الطبية", nil];
    
    // Time difference between stations.
    _stationTimeDifference_green = [[NSArray alloc] initWithObjects:@"0", // Etisalat
                                  @"3", // Al Qusais
                                  @"2", // Dubai Airport Free Zone
                                  @"1", // Al Nahda
                                  @"2", // Stadium
                                  @"2", // Al Qiyadah
                                  @"2", // Abu Hail
                                  @"2", // Abu Baker Al Siddique
                                  @"2", // Salah Al Din
                                  @"2", // Union
                                  @"2", // Baniyas Square
                                  @"2", // Palm Deira
                                  @"2", // Al Ras
                                  @"2", // Al Ghubaiba
                                  @"2", // Al Fahidi
                                  @"2", // BurJuman
                                  @"2", // Oud Metha
                                  @"4", nil]; // Dubai Healthcare City
    
    _stationTimings_Creek_weekDays = [[NSMutableArray alloc] initWithObjects:@[
                                      // Etisalat
                                      @"05:48:00",
                                      @"05:56:00",
                                      @"06:04:00",
                                      @"06:12:00",
                                      @"06:20:00",
                                      @"06:28:00",
                                      @"06:36:00",
                                      @"06:44:00",
                                      @"06:52:00",
                                      @"07:00:00",
                                      @"07:08:00",
                                      @"07:16:00",
                                      @"07:24:00",
                                      @"07:32:00",
                                      @"07:40:00",
                                      @"07:48:00",
                                      @"07:56:00",
                                      @"08:04:00",
                                      @"08:12:00",
                                      @"08:20:00",
                                      @"08:28:00",
                                      @"08:36:00",
                                      @"08:44:00",
                                      @"08:52:00",
                                      @"09:00:00",
                                      @"09:08:00",
                                      @"09:16:00",
                                      @"09:24:00",
                                      @"09:32:00",
                                      @"09:40:00",
                                      @"09:48:00",
                                      @"09:56:00",
                                      @"10:04:00",
                                      @"10:12:00",
                                      @"10:20:00",
                                      @"10:28:00",
                                      @"10:36:00",
                                      @"10:44:00",
                                      @"10:52:00",
                                      @"11:00:00",
                                      @"11:08:00",
                                      @"11:16:00",
                                      @"11:24:00",
                                      @"11:32:00",
                                      @"11:40:00",
                                      @"11:48:00",
                                      @"11:56:00",
                                      @"12:04:00",
                                      @"12:12:00",
                                      @"12:20:00",
                                      @"12:28:00",
                                      @"12:36:00",
                                      @"12:44:00",
                                      @"12:52:00",
                                      @"13:00:00",
                                      @"13:08:00",
                                      @"13:16:00",
                                      @"13:24:00",
                                      @"13:32:00",
                                      @"13:40:00",
                                      @"13:48:00",
                                      @"13:56:00",
                                      @"14:04:00",
                                      @"14:12:00",
                                      @"14:20:00",
                                      @"14:28:00",
                                      @"14:36:00",
                                      @"14:44:00",
                                      @"14:52:00",
                                      @"15:00:00",
                                      @"15:08:00",
                                      @"15:16:00",
                                      @"15:24:00",
                                      @"15:32:00",
                                      @"15:40:00",
                                      @"15:48:00",
                                      @"15:56:00",
                                      @"16:04:00",
                                      @"16:12:00",
                                      @"16:20:00",
                                      @"16:28:00",
                                      @"16:36:00",
                                      @"16:44:00",
                                      @"16:52:00",
                                      @"17:00:00",
                                      @"17:08:00",
                                      @"17:16:00",
                                      @"17:24:00",
                                      @"17:32:00",
                                      @"17:40:00",
                                      @"17:48:00",
                                      @"17:56:00",
                                      @"18:04:00",
                                      @"18:12:00",
                                      @"18:20:00",
                                      @"18:28:00",
                                      @"18:36:00",
                                      @"18:44:00",
                                      @"18:52:00",
                                      @"19:00:00",
                                      @"19:08:00",
                                      @"19:16:00",
                                      @"19:24:00",
                                      @"19:32:00",
                                      @"19:40:00",
                                      @"19:48:00",
                                      @"19:56:00",
                                      @"20:04:00",
                                      @"20:12:00",
                                      @"20:20:00",
                                      @"20:28:00",
                                      @"20:36:00",
                                      @"20:44:00",
                                      @"20:52:00",
                                      @"21:00:00",
                                      @"21:08:00",
                                      @"21:16:00",
                                      @"21:24:00",
                                      @"21:32:00",
                                      @"21:40:00",
                                      @"21:48:00",
                                      @"21:56:00",
                                      @"22:04:00",
                                      @"22:12:00",
                                      @"22:20:00",
                                      @"22:28:00",
                                      @"22:36:00",
                                      @"22:44:00",
                                      @"22:52:00",
                                      @"23:00:00",
                                      @"23:08:00",
                                      @"23:16:00",
                                      @"23:24:00",
                                      @"23:32:00",
                                      @"23:40:00",
                                      @"23:48:00",
                                      @"23:56:00",
                                      @"00:04:00",
                                      @"00:12:00",
                                      @"00:20:00",
                                      @"00:29:00"
                                      ],
                                      @[],
                                      @[],
                                      @[],
                                      @[],
                                      @[],
                                      @[],
                                      @[],
                                      @[],
                                      @[],
                                      @[],
                                      @[],
                                      @[],
                                      @[],
                                      @[],
                                      @[],
                                      @[],
                                      @[], nil];
    
    _stationTimings_Creek_friday = [[NSMutableArray alloc] initWithObjects:@[
                                    // Etisalat
                                    @"12:59:00",
                                    @"13:07:00",
                                    @"13:15:00",
                                    @"13:23:00",
                                    @"13:31:00",
                                    @"13:39:00",
                                    @"13:47:00",
                                    @"13:55:00",
                                    @"14:03:00",
                                    @"14:11:00",
                                    @"14:19:00",
                                    @"14:27:00",
                                    @"14:35:00",
                                    @"14:43:00",
                                    @"14:51:00",
                                    @"14:59:00",
                                    @"15:07:00",
                                    @"15:15:00",
                                    @"15:23:00",
                                    @"15:31:00",
                                    @"15:39:00",
                                    @"15:47:00",
                                    @"15:55:00",
                                    @"16:03:00",
                                    @"16:11:00",
                                    @"16:19:00",
                                    @"16:27:00",
                                    @"16:35:00",
                                    @"16:43:00",
                                    @"16:51:00",
                                    @"16:59:00",
                                    @"17:07:00",
                                    @"17:15:00",
                                    @"17:23:00",
                                    @"17:31:00",
                                    @"17:39:00",
                                    @"17:47:00",
                                    @"17:55:00",
                                    @"18:03:00",
                                    @"18:11:00",
                                    @"18:19:00",
                                    @"18:27:00",
                                    @"18:35:00",
                                    @"18:43:00",
                                    @"18:51:00",
                                    @"18:59:00",
                                    @"19:07:00",
                                    @"19:15:00",
                                    @"19:23:00",
                                    @"19:31:00",
                                    @"19:39:00",
                                    @"19:47:00",
                                    @"19:55:00",
                                    @"20:03:00",
                                    @"20:11:00",
                                    @"20:19:00",
                                    @"20:27:00",
                                    @"20:35:00",
                                    @"20:43:00",
                                    @"20:51:00",
                                    @"20:59:00",
                                    @"21:07:00",
                                    @"21:15:00",
                                    @"21:23:00",
                                    @"21:31:00",
                                    @"21:39:00",
                                    @"21:47:00",
                                    @"21:55:00",
                                    @"22:03:00",
                                    @"22:11:00",
                                    @"22:19:00",
                                    @"22:27:00",
                                    @"22:35:00",
                                    @"22:43:00",
                                    @"22:51:00",
                                    @"22:59:00",
                                    @"23:07:00",
                                    @"23:15:00",
                                    @"23:23:00",
                                    @"23:31:00",
                                    @"23:39:00",
                                    @"23:47:00",
                                    @"23:55:00",
                                    @"00:03:00",
                                    @"00:11:00",
                                    @"00:19:00",
                                    @"00:27:00"
                                    ],
                                    @[],
                                    @[],
                                    @[],
                                    @[],
                                    @[],
                                    @[],
                                    @[],
                                    @[],
                                    @[],
                                    @[],
                                    @[],
                                    @[],
                                    @[],
                                    @[],
                                    @[],
                                    @[],
                                    @[], nil];
    
    _stationTimings_Etisalat_weekDays = [[NSMutableArray alloc] initWithObjects:@[],
                                         @[],
                                         @[],
                                         @[],
                                         @[],
                                         @[],
                                         @[],
                                         @[],
                                         @[],
                                         @[],
                                         @[],
                                         @[],
                                         @[],
                                         @[],
                                         @[],
                                         @[],
                                         @[],
                                         @[
                                         // Dubai Healthcare City
                                         @"05:55:00",
                                         @"06:03:00",
                                         @"06:11:00",
                                         @"06:19:00",
                                         @"06:27:00",
                                         @"06:35:00",
                                         @"06:43:00",
                                         @"06:51:00",
                                         @"06:59:00",
                                         @"07:07:00",
                                         @"07:15:00",
                                         @"07:23:00",
                                         @"07:31:00",
                                         @"07:39:00",
                                         @"07:47:00",
                                         @"07:55:00",
                                         @"08:03:00",
                                         @"08:11:00",
                                         @"08:19:00",
                                         @"08:27:00",
                                         @"08:35:00",
                                         @"08:43:00",
                                         @"08:51:00",
                                         @"08:59:00",
                                         @"09:07:00",
                                         @"09:15:00",
                                         @"09:23:00",
                                         @"09:31:00",
                                         @"09:39:00",
                                         @"09:47:00",
                                         @"09:55:00",
                                         @"10:03:00",
                                         @"10:11:00",
                                         @"10:19:00",
                                         @"10:27:00",
                                         @"10:35:00",
                                         @"10:43:00",
                                         @"10:51:00",
                                         @"10:59:00",
                                         @"11:07:00",
                                         @"11:15:00",
                                         @"11:23:00",
                                         @"11:31:00",
                                         @"11:39:00",
                                         @"11:47:00",
                                         @"11:55:00",
                                         @"12:03:00",
                                         @"12:11:00",
                                         @"12:19:00",
                                         @"12:27:00",
                                         @"12:34:00",
                                         @"12:42:00",
                                         @"12:50:00",
                                         @"12:58:00",
                                         @"13:06:00",
                                         @"13:14:00",
                                         @"13:22:00",
                                         @"13:30:00",
                                         @"13:38:00",
                                         @"13:46:00",
                                         @"13:54:00",
                                         @"14:02:00",
                                         @"14:10:00",
                                         @"14:18:00",
                                         @"14:26:00",
                                         @"14:34:00",
                                         @"14:42:00",
                                         @"14:50:00",
                                         @"14:58:00",
                                         @"15:06:00",
                                         @"15:14:00",
                                         @"15:22:00",
                                         @"15:30:00",
                                         @"15:38:00",
                                         @"15:46:00",
                                         @"15:54:00",
                                         @"16:02:00",
                                         @"16:10:00",
                                         @"16:18:00",
                                         @"16:26:00",
                                         @"16:34:00",
                                         @"16:42:00",
                                         @"16:50:00",
                                         @"16:58:00",
                                         @"17:06:00",
                                         @"17:14:00",
                                         @"17:22:00",
                                         @"17:30:00",
                                         @"17:38:00",
                                         @"17:46:00",
                                         @"17:54:00",
                                         @"18:02:00",
                                         @"18:10:00",
                                         @"18:18:00",
                                         @"18:26:00",
                                         @"18:34:00",
                                         @"18:42:00",
                                         @"18:50:00",
                                         @"18:58:00",
                                         @"19:06:00",
                                         @"19:14:00",
                                         @"19:22:00",
                                         @"19:30:00",
                                         @"19:38:00",
                                         @"19:46:00",
                                         @"19:54:00",
                                         @"20:02:00",
                                         @"20:10:00",
                                         @"20:18:00",
                                         @"20:26:00",
                                         @"20:34:00",
                                         @"20:42:00",
                                         @"20:50:00",
                                         @"20:58:00",
                                         @"21:06:00",
                                         @"21:14:00",
                                         @"21:22:00",
                                         @"21:30:00",
                                         @"21:38:00",
                                         @"21:46:00",
                                         @"21:54:00",
                                         @"22:02:00",
                                         @"22:10:00",
                                         @"22:18:00",
                                         @"22:26:00",
                                         @"22:34:00",
                                         @"22:42:00",
                                         @"22:50:00",
                                         @"22:58:00",
                                         @"23:06:00",
                                         @"23:14:00",
                                         @"23:22:00",
                                         @"23:30:00",
                                         @"23:38:00",
                                         @"23:46:00",
                                         @"23:54:00",
                                         @"00:02:00",
                                         @"00:10:00",
                                         @"00:18:00",
                                         @"00:26:00"
                                         ], nil];
    
    _stationTimings_Etisalat_friday = [[NSMutableArray alloc] initWithObjects:@[],
                                       @[],
                                       @[],
                                       @[],
                                       @[],
                                       @[],
                                       @[],
                                       @[],
                                       @[],
                                       @[],
                                       @[],
                                       @[],
                                       @[],
                                       @[],
                                       @[],
                                       @[],
                                       @[],
                                       @[
                                       // Dubai Healthcare City
                                       @"13:05:00",
                                       @"13:13:00",
                                       @"13:21:00",
                                       @"13:29:00",
                                       @"13:37:00",
                                       @"13:45:00",
                                       @"13:53:00",
                                       @"14:01:00",
                                       @"14:09:00",
                                       @"14:17:00",
                                       @"14:25:00",
                                       @"14:33:00",
                                       @"14:41:00",
                                       @"14:49:00",
                                       @"14:57:00",
                                       @"15:05:00",
                                       @"15:13:00",
                                       @"15:21:00",
                                       @"15:29:00",
                                       @"15:37:00",
                                       @"15:45:00",
                                       @"15:53:00",
                                       @"16:01:00",
                                       @"16:09:00",
                                       @"16:17:00",
                                       @"16:25:00",
                                       @"16:33:00",
                                       @"16:41:00",
                                       @"16:49:00",
                                       @"16:57:00",
                                       @"17:05:00",
                                       @"17:13:00",
                                       @"17:21:00",
                                       @"17:29:00",
                                       @"17:37:00",
                                       @"17:45:00",
                                       @"17:53:00",
                                       @"18:01:00",
                                       @"18:09:00",
                                       @"18:17:00",
                                       @"18:25:00",
                                       @"18:33:00",
                                       @"18:41:00",
                                       @"18:49:00",
                                       @"18:57:00",
                                       @"19:05:00",
                                       @"19:13:00",
                                       @"19:21:00",
                                       @"19:29:00",
                                       @"19:37:00",
                                       @"19:45:00",
                                       @"19:53:00",
                                       @"20:01:00",
                                       @"20:09:00",
                                       @"20:17:00",
                                       @"20:25:00",
                                       @"20:33:00",
                                       @"20:41:00",
                                       @"20:49:00",
                                       @"20:57:00",
                                       @"21:05:00",
                                       @"21:13:00",
                                       @"21:21:00",
                                       @"21:29:00",
                                       @"21:37:00",
                                       @"21:45:00",
                                       @"21:53:00",
                                       @"22:01:00",
                                       @"22:09:00",
                                       @"22:17:00",
                                       @"22:25:00",
                                       @"22:33:00",
                                       @"22:41:00",
                                       @"22:49:00",
                                       @"22:57:00",
                                       @"23:05:00",
                                       @"23:13:00",
                                       @"23:21:00",
                                       @"23:29:00",
                                       @"23:37:00",
                                       @"23:45:00",
                                       @"23:53:00",
                                       @"00:01:00",
                                       @"00:09:00",
                                       @"00:17:00",
                                       @"00:25:00"
                                       ], nil];
    
    _strobeLight = [[SHStrobeLight alloc] initWithFrame:CGRectMake(0, 11, 320, 20)];
    [_strobeLight activateStrobeLight];
    
    UIImageView *screenShadow = [[UIImageView alloc] initWithFrame:CGRectMake(-1, 20, 321, screenBounds.size.height - 20)];
    screenShadow.image = [[UIImage imageNamed:@"screen_shadow"] stretchableImageWithLeftCapWidth:47 topCapHeight:36];
    screenShadow.opaque = YES;
    
    _window = [[UIWindow alloc] initWithFrame:screenBounds];
    rootView  = [[RootViewController alloc] init];
    rootView.wantsFullScreenLayout = YES; // To reclaim the 20px taken up by the status bar.
    UINavigationController *rootNavigationController = [[UINavigationController alloc] initWithRootViewController:rootView];
    
    // Override point for customization after application launch.
    _window.rootViewController = rootNavigationController;
    _window.backgroundColor = [UIColor blackColor];
    [_window makeKeyAndVisible];
    
    [_window addSubview:screenShadow];
    [_window addSubview:_strobeLight];
    
    // Run each loop on thread. This is MUCH faster.
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self calculateBeforeNoorForRashidiya];
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self calculateAfterNoorForRashidiya];
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self calculateBeforeNoorForJebelAli];
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self calculateAfterNoorForJebelAli];
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self calculateForEtisalat];
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self calculateForCreek];
    });
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    NSError *error;
    
    if ( _managedObjectContext != nil )
    {
        if ( [_managedObjectContext hasChanges] && ![_managedObjectContext save:&error] )
        {
			// Handle the error.
        }
    }
}

- (void)calculateBeforeNoorForRashidiya
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"]; // For checking what day of the week it is.
    
    NSDate *date = [NSDate date];
    NSString *weekDay = [dateFormatter stringFromDate:date];
    NSMutableArray *activeArray;
    BOOL expressTrainsToday = YES;
    const int noorIndex = 16;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *currentDatecomponents = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:date];
    NSInteger currentHour = [currentDatecomponents hour];
    NSInteger currentMinute = [currentDatecomponents minute];
    
    if ( [weekDay isEqualToString:@"Saturday"] && currentHour >= 1 && currentMinute > 4 ) // Logic fix for when the clock passes 12 am.
    {
        activeArray = _stationTimings_Rashidiya_saturday;
    }
    else if ( [weekDay isEqualToString:@"Friday"] && currentHour >= 1 && currentMinute > 8 )
    {
        activeArray = _stationTimings_Rashidiya_friday;
        expressTrainsToday = NO;
    }
    else
    {
        activeArray = _stationTimings_Rashidiya_weekDays;
    }
    
    NSArray *noorTimings = [activeArray objectAtIndex:noorIndex];
    
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    
    for ( int row = 2; row < noorTimings.count; row++ )  // Skip express trains.
    {
        for ( int column = noorIndex + 1; column < activeArray.count; column++ )
        {
            int actualRow_current = row;
            int actualRow_previous = row;
            
            if ( ![[_stationList_express_Rashidiya objectAtIndex:column] boolValue] || !expressTrainsToday ) // Go back to account for uneeded express train slots.
            {
                actualRow_current -= 2;
            }
            
            if ( ![[_stationList_express_Rashidiya objectAtIndex:column - 1] boolValue] || !expressTrainsToday )
            {
                actualRow_previous -= 2;
            }
            
            NSMutableArray *currentStation = [[activeArray objectAtIndex:column] mutableCopy];
            NSMutableArray *nextStation = [[activeArray objectAtIndex:column - 1] mutableCopy];
            
            NSDate *oldTiming = [dateFormatter dateFromString:[nextStation objectAtIndex:actualRow_previous]];
            int distancetTimeInSeconds = [[_stationTimeDifference_red objectAtIndex:column] intValue] * 60;
            NSDate *newTiming = [oldTiming dateByAddingTimeInterval:-distancetTimeInSeconds];
            
            currentStation[actualRow_current] = [dateFormatter stringFromDate:newTiming];
            
            activeArray[column] = currentStation;
        }
    }
}

- (void)calculateAfterNoorForRashidiya
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    
    NSDate *date = [NSDate date];
    NSString *weekDay = [dateFormatter stringFromDate:date];
    NSMutableArray *activeArray;
    BOOL expressTrainsToday = YES;
    const int noorIndex = 16;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *currentDatecomponents = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:date];
    NSInteger currentHour = [currentDatecomponents hour];
    NSInteger currentMinute = [currentDatecomponents minute];
    
    if ( [weekDay isEqualToString:@"Saturday"] && currentHour >= 1 && currentMinute > 4 )
    {
        activeArray = _stationTimings_Rashidiya_saturday;
    }
    else if ( [weekDay isEqualToString:@"Friday"] && currentHour >= 1 && currentMinute > 8 )
    {
        activeArray = _stationTimings_Rashidiya_friday;
        expressTrainsToday = NO;
    }
    else
    {
        activeArray = _stationTimings_Rashidiya_weekDays;
    }
    
    NSArray *noorTimings = [activeArray objectAtIndex:noorIndex];
    
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    
    for ( int column = noorIndex - 1; column >= 0; column-- )
    {
        int timingCount = noorTimings.count;
        int row = 2;
        
        if ( ![[_stationList_express_Rashidiya objectAtIndex:column] boolValue] || !expressTrainsToday ) // Skip express trains.
        {
            row = 0;
        }
        
        if ( column <= 7 )
        {
            timingCount = noorTimings.count + 3;
        }
        
        for ( ; row < timingCount; row++ )
        {
            int actualRow_previous = row;
            
            NSMutableArray *currentStation = [[activeArray objectAtIndex:column] mutableCopy];
            NSMutableArray *previousStation = [[activeArray objectAtIndex:column + 1] mutableCopy];
            
            NSDate *oldTiming = [dateFormatter dateFromString:[previousStation objectAtIndex:actualRow_previous]];
            int distancetTimeInSeconds = [[_stationTimeDifference_red objectAtIndex:column + 1] intValue] * 60;
            NSDate *newTiming = [oldTiming dateByAddingTimeInterval:distancetTimeInSeconds];
            
            [currentStation addObject:[dateFormatter stringFromDate:newTiming]];
            
            activeArray[column] = currentStation;
        }
    }
}

- (void)calculateBeforeNoorForJebelAli
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    
    NSDate *date = [NSDate date];
    NSString *weekDay = [dateFormatter stringFromDate:date];
    NSMutableArray *activeArray;
    BOOL expressTrainsToday = YES;
    const int noorIndex = 16;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *currentDatecomponents = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:date];
    NSInteger currentHour = [currentDatecomponents hour];
    NSInteger currentMinute = [currentDatecomponents minute];
    
    if ( [weekDay isEqualToString:@"Saturday"] && currentHour >= 1 && currentMinute > 3 )
    {
        activeArray = _stationTimings_JebelAli_saturday;
    }
    else if ( [weekDay isEqualToString:@"Friday"] && currentHour >= 1 && currentMinute > 9 )
    {
        activeArray = _stationTimings_JebelAli_friday;
        expressTrainsToday = NO;
    }
    else
    {
        activeArray = _stationTimings_JebelAli_weekDays;
    }
    
    NSArray *noorTimings = [activeArray objectAtIndex:noorIndex];
    
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    
    for ( int row = 2; row < noorTimings.count; row++ )  // Skip express trains.
    {
        for ( int column = noorIndex - 1; column >= 0; column-- )
        {
            int actualRow_current = row;
            int actualRow_previous = row;
            
            if ( ![[_stationList_express_JebelAli objectAtIndex:column] boolValue] || !expressTrainsToday ) // Go back to account for uneeded express train slots.
            {
                actualRow_current -= 2;
            }
            
            if ( ![[_stationList_express_JebelAli objectAtIndex:column + 1] boolValue] || !expressTrainsToday )
            {
                actualRow_previous -= 2;
            }
            
            NSMutableArray *currentStation = [[activeArray objectAtIndex:column] mutableCopy];
            NSMutableArray *nextStation = [[activeArray objectAtIndex:column + 1] mutableCopy];
            
            NSDate *oldTiming = [dateFormatter dateFromString:[nextStation objectAtIndex:actualRow_previous]];
            int distancetTimeInSeconds = [[_stationTimeDifference_red objectAtIndex:column + 1] intValue] * 60;
            NSDate *newTiming = [oldTiming dateByAddingTimeInterval:-distancetTimeInSeconds];
            
            currentStation[actualRow_current] = [dateFormatter stringFromDate:newTiming];
            
            activeArray[column] = currentStation;
        }
    }
}

- (void)calculateAfterNoorForJebelAli
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    
    NSDate *date = [NSDate date];
    NSString *weekDay = [dateFormatter stringFromDate:date];
    NSMutableArray *activeArray;
    BOOL expressTrainsToday = YES;
    const int noorIndex = 16;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *currentDatecomponents = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:date];
    NSInteger currentHour = [currentDatecomponents hour];
    NSInteger currentMinute = [currentDatecomponents minute];
    
    if ( [weekDay isEqualToString:@"Saturday"] && currentHour >= 1 && currentMinute > 3 )
    {
        activeArray = _stationTimings_JebelAli_saturday;
    }
    else if ( [weekDay isEqualToString:@"Friday"] && currentHour >= 1 && currentMinute > 9 )
    {
        activeArray = _stationTimings_JebelAli_friday;
        expressTrainsToday = NO;
    }
    else
    {
        activeArray = _stationTimings_JebelAli_weekDays;
    }
    
    NSArray *noorTimings = [activeArray objectAtIndex:noorIndex];
    
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    
    for ( int row = 2; row < noorTimings.count; row++ )  // Skip express trains.
    {
        for ( int column = noorIndex + 1; column < activeArray.count; column++ )
        {
            int actualRow_current = row;
            int actualRow_previous = row;
            
            if ( ![[_stationList_express_JebelAli objectAtIndex:column] boolValue] || !expressTrainsToday )
            {
                actualRow_current -= 2;
            }
            
            if ( ![[_stationList_express_JebelAli objectAtIndex:column - 1] boolValue] || !expressTrainsToday )
            {
                actualRow_previous -= 2;
            }
            
            NSMutableArray *currentStation = [[activeArray objectAtIndex:column] mutableCopy];
            NSMutableArray *previousStation = [[activeArray objectAtIndex:column - 1] mutableCopy];
            
            NSDate *oldTiming = [dateFormatter dateFromString:[previousStation objectAtIndex:actualRow_previous]];
            int distancetTimeInSeconds = [[_stationTimeDifference_red objectAtIndex:column] intValue] * 60;
            NSDate *newTiming = [oldTiming dateByAddingTimeInterval:distancetTimeInSeconds];
            
            currentStation[actualRow_current] = [dateFormatter stringFromDate:newTiming];
            
            activeArray[column] = currentStation;
        }
    }
}

- (void)calculateForEtisalat
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    
    NSDate *date = [NSDate date];
    NSString *weekDay = [dateFormatter stringFromDate:date];
    NSMutableArray *activeArray;
    const int healthcareCityIndex = 17;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *currentDatecomponents = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:date];
    NSInteger currentHour = [currentDatecomponents hour];
    NSInteger currentMinute = [currentDatecomponents minute];
    
    if ( [weekDay isEqualToString:@"Saturday"] && currentHour >= 1 )
    {
        activeArray = _stationTimings_Etisalat_weekDays;
    }
    else if ( [weekDay isEqualToString:@"Friday"] && currentHour >= 1 && currentMinute > 2 )
    {
        activeArray = _stationTimings_Etisalat_friday;
    }
    else
    {
        activeArray = _stationTimings_Etisalat_weekDays;
    }
    
    NSArray *healthcareCityTimings = [activeArray objectAtIndex:healthcareCityIndex];
    
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    
    for ( int row = 0; row < healthcareCityTimings.count; row++ )
    {
        for ( int column = healthcareCityIndex - 1; column >= 0; column-- )
        {
            NSMutableArray *currentStation = [[activeArray objectAtIndex:column] mutableCopy];
            NSMutableArray *nextStation = [[activeArray objectAtIndex:column + 1] mutableCopy];
            
            NSDate *oldTiming = [dateFormatter dateFromString:[nextStation objectAtIndex:row]];
            int distancetTimeInSeconds = [[_stationTimeDifference_green objectAtIndex:column + 1] intValue] * 60;
            NSDate *newTiming = [oldTiming dateByAddingTimeInterval:distancetTimeInSeconds];
            
            currentStation[row] = [dateFormatter stringFromDate:newTiming];
            
            activeArray[column] = currentStation;
        }
    }
}

- (void)calculateForCreek
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    
    NSDate *date = [NSDate date];
    NSString *weekDay = [dateFormatter stringFromDate:date];
    NSMutableArray *activeArray;
    const int etisalatIndex = 0;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *currentDatecomponents = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:date];
    NSInteger currentHour = [currentDatecomponents hour];
    NSInteger currentMinute = [currentDatecomponents minute];
    
    if ( [weekDay isEqualToString:@"Saturday"] && currentHour >= 1 && currentMinute > 4 )
    {
        activeArray = _stationTimings_Creek_weekDays;
    }
    else if ( [weekDay isEqualToString:@"Friday"] && currentHour >= 1 && currentMinute > 6 )
    {
        activeArray = _stationTimings_Creek_friday;
    }
    else
    {
        activeArray = _stationTimings_Creek_weekDays;
    }
    
    NSArray *etisalatTimings = [activeArray objectAtIndex:etisalatIndex];
    
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    
    for ( int row = 0; row < etisalatTimings.count; row++ )
    {
        for ( int column = etisalatIndex + 1; column < activeArray.count; column++ )
        {
            NSMutableArray *currentStation = [[activeArray objectAtIndex:column] mutableCopy];
            NSMutableArray *nextStation = [[activeArray objectAtIndex:column - 1] mutableCopy];
            
            NSDate *oldTiming = [dateFormatter dateFromString:[nextStation objectAtIndex:row]];
            int distancetTimeInSeconds = [[_stationTimeDifference_green objectAtIndex:column] intValue] * 60;
            NSDate *newTiming = [oldTiming dateByAddingTimeInterval:distancetTimeInSeconds];
            
            currentStation[row] = [dateFormatter stringFromDate:newTiming];
            
            activeArray[column] = currentStation;
        }
    }
}

- (NSString *)westernToArabicNumerals:(NSString *)numericString
{
    NSMutableString *s = [NSMutableString stringWithString:numericString];
    NSString *arabic = @"٠١٢٣٤٥٦٧٨٩";
    NSString *western = @"0123456789";
    
    for ( int i = 0; i < arabic.length; i++ )
    {
        NSString *a = [arabic substringWithRange:NSMakeRange(i, 1)];
        NSString *w = [western substringWithRange:NSMakeRange(i, 1)];
        
        [s replaceOccurrencesOfString:w withString:a
                              options:NSCaseInsensitiveSearch
                                range:NSMakeRange(0, s.length)];
    }
    
    return [NSString stringWithString:s];
}

#pragma mark -
#pragma mark Saving

/**
 Performs the save action for the application, which is to send the save:
 message to the application's managed object context.
 */
- (void)saveAction
{
    NSError *error;
    
    if ( ![_managedObjectContext save:&error] )
    {
		// Handle error.
    }
}

#pragma mark -
#pragma mark Core Data stack

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *)managedObjectContext
{
    if ( _managedObjectContext != nil )
    {
        return _managedObjectContext;
    }
	
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    
    if ( coordinator != nil )
    {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    
    return _managedObjectContext;
}


/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created by merging all of the models found in the application bundle.
 */
- (NSManagedObjectModel *)managedObjectModel
{
    if ( _managedObjectModel != nil )
    {
        return _managedObjectModel;
    }
    
    _managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    
    return _managedObjectModel;
}


/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if ( _persistentStoreCoordinator != nil )
    {
        return _persistentStoreCoordinator;
    }
	
    NSURL *storeUrl = [NSURL fileURLWithPath:[[self applicationDocumentsDirectory] stringByAppendingPathComponent: @"MetroMate.sqlite"]];
	
	NSError *error;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    
    if ( ![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:&error] )
    {
        // Handle the error.
    }
	
    return _persistentStoreCoordinator;
}

#pragma mark -
#pragma mark Application's documents directory

/**
 Returns the path to the application's documents directory.
 */
- (NSString *)applicationDocumentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    
    return basePath;
}

@end
