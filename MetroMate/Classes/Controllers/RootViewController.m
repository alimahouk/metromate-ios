//
//  RootViewController.m
//  MetroMate
//
//  Created by Ali Mahouk on 5/12/13.
//
//

#import "RootViewController.h"
#import "AppDelegate.h"
#import "Sound.h"

@implementation RootViewController

- (void)hudWasHidden:(MBProgressHUD *)hud
{
	// Remove HUD from screen when the HUD was hidden.
	[HUD removeFromSuperview];
	HUD = nil;
}

- (void)viewDidLoad
{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [appDelegate.strobeLight activateStrobeLight];
    
    // Get the user's current location & save it.
    locationManager = [[CLLocationManager alloc] init];
    locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    locationManager.delegate = self;
    [locationManager startUpdatingLocation];
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.0/255.0 green:42.0/255.0 blue:78.0/255.0 alpha:1.0];
    self.view.backgroundColor = [UIColor blackColor];
    
    frontView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, 320, screenBounds.size.height)];
    frontView.backgroundColor = [UIColor blackColor];
    frontView.opaque = YES;
    
    backView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, 320, screenBounds.size.height)];
    backView.backgroundColor = [UIColor colorWithRed:0.0/255.0 green:42.0/255.0 blue:78.0/255.0 alpha:1.0];
    backView.opaque = YES;
    backView.hidden = YES;
    
    pixelPattern = [[UIView alloc] initWithFrame:CGRectMake(0, (screenBounds.size.height / 2), 320, 3)];
    pixelPattern.backgroundColor = [UIColor whiteColor];
    pixelPattern.opaque = YES;
    pixelPattern.alpha = 0.0;
    
    screenLowerGlow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"screen_lower_glow"]];
    screenLowerGlow.frame = CGRectMake(0, screenBounds.size.height - 85, 320, 87);
    screenLowerGlow.opaque = YES;
    screenLowerGlow.alpha = 0.0;
    
    screenUpperGlow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"screen_upper_glow"]];
    screenUpperGlow.frame = CGRectMake(0, 0, 320, 203);
    screenUpperGlow.opaque = YES;
    screenUpperGlow.alpha = 0.0;
    
    directionMenuSeparator_2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"menu_light_separator"]];
    directionMenuSeparator_2.frame = CGRectMake(14, (screenBounds.size.height / 2) - 9, 292, 17);
    directionMenuSeparator_2.opaque = YES;
    directionMenuSeparator_2.alpha = 0.0;
    
    directionMenuSeparator_1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"menu_light_separator"]];
    directionMenuSeparator_1.frame = CGRectMake(14, (directionMenuSeparator_2.frame.origin.y / 2) - 15, 292, 17);
    directionMenuSeparator_1.opaque = YES;
    directionMenuSeparator_1.alpha = 0.0;
    
    directionMenuSeparator_3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"menu_light_separator"]];
    directionMenuSeparator_3.frame = CGRectMake(14, ( screenBounds.size.height - directionMenuSeparator_2.frame.origin.y / 2) - 9, 292, 17);
    directionMenuSeparator_3.opaque = YES;
    directionMenuSeparator_3.alpha = 0.0;
    
    directionMenuSeparator_4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"menu_light_separator"]];
    directionMenuSeparator_4.frame = CGRectMake(14, (directionMenuSeparator_2.frame.origin.y / 2) - 15, 292, 17);
    directionMenuSeparator_4.opaque = YES;
    
    onTrainButtonGlow = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"round_button_glow"] stretchableImageWithLeftCapWidth:10 topCapHeight:10]];
    onTrainButtonGlow.frame = CGRectMake(0, 0, 280, 44);
    onTrainButtonGlow.opaque = YES;
    onTrainButtonGlow.alpha = 0.0;
    
    nolInfoButtonGlow = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"round_button_glow"] stretchableImageWithLeftCapWidth:10 topCapHeight:10]];
    nolInfoButtonGlow.frame = CGRectMake(0, 0, 280, 44);
    nolInfoButtonGlow.opaque = YES;
    nolInfoButtonGlow.alpha = 0.0;
    
    callRTAButtonGlow = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"round_button_glow"] stretchableImageWithLeftCapWidth:10 topCapHeight:10]];
    callRTAButtonGlow.frame = CGRectMake(0, 0, 280, 44);
    callRTAButtonGlow.opaque = YES;
    callRTAButtonGlow.alpha = 0.0;
    
    rateAppButtonGlow = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"round_button_glow"] stretchableImageWithLeftCapWidth:10 topCapHeight:10]];
    rateAppButtonGlow.frame = CGRectMake(0, 0, 280, 44);
    rateAppButtonGlow.opaque = YES;
    rateAppButtonGlow.alpha = 0.0;
    
    checkBalanceButtonGlow = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"round_button_glow"] stretchableImageWithLeftCapWidth:10 topCapHeight:10]];
    checkBalanceButtonGlow.frame = CGRectMake(0, 0, 280, 44);
    checkBalanceButtonGlow.opaque = YES;
    checkBalanceButtonGlow.alpha = 0.0;
    
    errorIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"error_white"]];
    errorIcon.frame = CGRectMake(133, (screenBounds.size.height / 2) - 23, 53, 45);
    errorIcon.opaque = YES;
    errorIcon.alpha = 0.0;
    
    SHRoof = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"roof"]];
    SHRoof.frame = CGRectMake(120, -61, 79, 61);
    SHRoof.opaque = YES;
    
    UIImageView *nolCardNumberFieldBG = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"square"] stretchableImageWithLeftCapWidth:16 topCapHeight:16]];
    nolCardNumberFieldBG.frame = CGRectMake(20, 35, 280, 85);
    nolCardNumberFieldBG.opaque = YES;
    
    cardSelectionFrame = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"card_selection_frame"]];
    cardSelectionFrame.frame = CGRectMake(-12, -12, 163, 115);
    cardSelectionFrame.opaque = YES;
    
    cardSelectionOverlay = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"card_selection_overlay"]];
    cardSelectionOverlay.frame = CGRectMake(0, 0, 140, 92);
    cardSelectionOverlay.opaque = YES;
    
    infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    [infoButton addTarget:self action:@selector(presentAboutSection) forControlEvents:UIControlEventTouchUpInside];
    infoButton.opaque = YES;
    infoButton.frame = CGRectMake(10, screenBounds.size.height - 50, 21, 21);
    infoButton.alpha = 0.0;
    infoButton.showsTouchWhenHighlighted = YES;
    
    backToFrontViewButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backToFrontViewButton setTitle:@"العودة\nBack" forState:UIControlStateNormal];
    backToFrontViewButton.titleLabel.textColor = [UIColor whiteColor];
    backToFrontViewButton.titleLabel.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:MAIN_FONT_SIZE];
    backToFrontViewButton.titleLabel.numberOfLines = 0;
    backToFrontViewButton.titleLabel.clipsToBounds = NO;
    backToFrontViewButton.titleLabel.layer.masksToBounds = NO;
    backToFrontViewButton.titleLabel.layer.shadowColor = [UIColor colorWithWhite:1.0 alpha:0.5].CGColor;
    backToFrontViewButton.titleLabel.layer.shadowRadius = 4.0f;
    backToFrontViewButton.titleLabel.layer.shadowOpacity = 0.9;
    backToFrontViewButton.titleLabel.layer.shadowOffset = CGSizeZero;
    backToFrontViewButton.backgroundColor = [UIColor clearColor];
    [backToFrontViewButton addTarget:self action:@selector(dismissAboutSection) forControlEvents:UIControlEventTouchUpInside];
    backToFrontViewButton.showsTouchWhenHighlighted = YES;
    backToFrontViewButton.opaque = YES;
    backToFrontViewButton.frame = CGRectMake(0, 0, 320, directionMenuSeparator_1.frame.origin.y + 15);
    
    rashidiyaDirectionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rashidiyaDirectionButton setTitle:@"إلى الراشدية\nTo Rashidiya" forState:UIControlStateNormal];
    rashidiyaDirectionButton.titleLabel.textColor = [UIColor whiteColor];
    rashidiyaDirectionButton.titleLabel.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:MAIN_FONT_SIZE];
    rashidiyaDirectionButton.titleLabel.numberOfLines = 0;
    rashidiyaDirectionButton.titleLabel.clipsToBounds = NO;
    rashidiyaDirectionButton.titleLabel.layer.masksToBounds = NO;
    rashidiyaDirectionButton.titleLabel.layer.shadowColor = [UIColor colorWithWhite:1.0 alpha:0.5].CGColor;
    rashidiyaDirectionButton.titleLabel.layer.shadowRadius = 4.0f;
    rashidiyaDirectionButton.titleLabel.layer.shadowOpacity = 0.9;
    rashidiyaDirectionButton.titleLabel.layer.shadowOffset = CGSizeZero;
    rashidiyaDirectionButton.backgroundColor = [UIColor clearColor];
    [rashidiyaDirectionButton addTarget:self action:@selector(setDirection:) forControlEvents:UIControlEventTouchUpInside];
    rashidiyaDirectionButton.showsTouchWhenHighlighted = YES;
    rashidiyaDirectionButton.opaque = YES;
    rashidiyaDirectionButton.frame = CGRectMake(0, -directionMenuSeparator_1.frame.origin.y - 15, 320, directionMenuSeparator_1.frame.origin.y + 15);
    rashidiyaDirectionButton.alpha = 0.0;
    rashidiyaDirectionButton.tag = 0;
    
    jebelAliDirectionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [jebelAliDirectionButton setTitle:@"إلى جبل علي\nTo Jebel Ali" forState:UIControlStateNormal];
    jebelAliDirectionButton.titleLabel.textAlignment = NSTextAlignmentRight;
    jebelAliDirectionButton.titleLabel.textColor = [UIColor whiteColor];
    jebelAliDirectionButton.titleLabel.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:MAIN_FONT_SIZE];
    jebelAliDirectionButton.titleLabel.numberOfLines = 0;
    jebelAliDirectionButton.titleLabel.clipsToBounds = NO;
    jebelAliDirectionButton.titleLabel.layer.masksToBounds = NO;
    jebelAliDirectionButton.titleLabel.layer.shadowColor = [UIColor colorWithWhite:1.0 alpha:0.5].CGColor;
    jebelAliDirectionButton.titleLabel.layer.shadowRadius = 4.0f;
    jebelAliDirectionButton.titleLabel.layer.shadowOpacity = 0.9;
    jebelAliDirectionButton.titleLabel.layer.shadowOffset = CGSizeZero;
    jebelAliDirectionButton.backgroundColor = [UIColor clearColor];
    [jebelAliDirectionButton addTarget:self action:@selector(setDirection:) forControlEvents:UIControlEventTouchUpInside];
    jebelAliDirectionButton.showsTouchWhenHighlighted = YES;
    jebelAliDirectionButton.opaque = YES;
    jebelAliDirectionButton.frame = CGRectMake(0, -rashidiyaDirectionButton.frame.size.height - 15, 320, rashidiyaDirectionButton.frame.size.height);
    jebelAliDirectionButton.alpha = 0.0;
    jebelAliDirectionButton.tag = 1;
    
    etisalatDirectionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [etisalatDirectionButton setTitle:@"إلى اتصالات\nTo Etisalat" forState:UIControlStateNormal];
    etisalatDirectionButton.titleLabel.textColor = [UIColor whiteColor];
    etisalatDirectionButton.titleLabel.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:MAIN_FONT_SIZE];
    etisalatDirectionButton.titleLabel.numberOfLines = 0;
    etisalatDirectionButton.titleLabel.clipsToBounds = NO;
    etisalatDirectionButton.titleLabel.layer.masksToBounds = NO;
    etisalatDirectionButton.titleLabel.layer.shadowColor = [UIColor colorWithWhite:1.0 alpha:0.5].CGColor;
    etisalatDirectionButton.titleLabel.layer.shadowRadius = 4.0f;
    etisalatDirectionButton.titleLabel.layer.shadowOpacity = 0.9;
    etisalatDirectionButton.titleLabel.layer.shadowOffset = CGSizeZero;
    etisalatDirectionButton.backgroundColor = [UIColor clearColor];
    [etisalatDirectionButton addTarget:self action:@selector(setDirection:) forControlEvents:UIControlEventTouchUpInside];
    etisalatDirectionButton.showsTouchWhenHighlighted = YES;
    etisalatDirectionButton.opaque = YES;
    etisalatDirectionButton.frame = CGRectMake(0, rashidiyaDirectionButton.frame.size.height * 4 + 10, 320, rashidiyaDirectionButton.frame.size.height);
    etisalatDirectionButton.alpha = 0.0;
    etisalatDirectionButton.tag = 2;
    
    creekDirectionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [creekDirectionButton setTitle:@"إلى الخور\nTo Creek" forState:UIControlStateNormal];
    creekDirectionButton.titleLabel.textColor = [UIColor whiteColor];
    creekDirectionButton.titleLabel.textAlignment = NSTextAlignmentRight;
    creekDirectionButton.titleLabel.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:MAIN_FONT_SIZE];
    creekDirectionButton.titleLabel.numberOfLines = 0;
    creekDirectionButton.titleLabel.clipsToBounds = NO;
    creekDirectionButton.titleLabel.layer.masksToBounds = NO;
    creekDirectionButton.titleLabel.layer.shadowColor = [UIColor colorWithWhite:1.0 alpha:0.5].CGColor;
    creekDirectionButton.titleLabel.layer.shadowRadius = 4.0f;
    creekDirectionButton.titleLabel.layer.shadowOpacity = 0.9;
    creekDirectionButton.titleLabel.layer.shadowOffset = CGSizeZero;
    creekDirectionButton.backgroundColor = [UIColor clearColor];
    [creekDirectionButton addTarget:self action:@selector(setDirection:) forControlEvents:UIControlEventTouchUpInside];
    creekDirectionButton.showsTouchWhenHighlighted = YES;
    creekDirectionButton.opaque = YES;
    creekDirectionButton.frame = CGRectMake(0, rashidiyaDirectionButton.frame.size.height * 4 + 10, 320, rashidiyaDirectionButton.frame.size.height);
    creekDirectionButton.alpha = 0.0;
    creekDirectionButton.tag = 3;
    
    notificationPanel = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"notification_panel"] stretchableImageWithLeftCapWidth:1 topCapHeight:1]];
    notificationPanel.frame = CGRectMake(0,  -rashidiyaDirectionButton.frame.size.height - 40, 320, rashidiyaDirectionButton.frame.size.height + 20);
    notificationPanel.opaque = YES;
    
    UIImageView *backToFrontViewArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_pictogram"]];
    backToFrontViewArrow.frame = CGRectMake(20, (backToFrontViewButton.frame.size.height / 2) - 23, 45, 45);
    backToFrontViewArrow.layer.transform = CATransform3DMakeRotation((M_PI / 180.0) * 180, 0.0f, 0.0f, 1.0f);
    backToFrontViewArrow.opaque = YES;
    
    UIImageView *rashidiyaArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_pictogram"]];
    rashidiyaArrow.frame = CGRectMake(20, (rashidiyaDirectionButton.frame.size.height / 2) - 23, 45, 45);
    rashidiyaArrow.layer.transform = CATransform3DMakeRotation((M_PI / 180.0) * 180, 0.0f, 0.0f, 1.0f);
    rashidiyaArrow.opaque = YES;
    
    UIImageView *jebelAliArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_pictogram"]];
    jebelAliArrow.frame = CGRectMake(255, (jebelAliDirectionButton.frame.size.height / 2) - 23, 45, 45);
    jebelAliArrow.opaque = YES;
    
    UIImageView *etisalatArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_pictogram"]];
    etisalatArrow.frame = CGRectMake(20, (etisalatDirectionButton.frame.size.height / 2) - 23, 45, 45);
    etisalatArrow.layer.transform = CATransform3DMakeRotation((M_PI / 180.0) * 180, 0.0f, 0.0f, 1.0f);
    etisalatArrow.opaque = YES;
    
    UIImageView *creekArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_pictogram"]];
    creekArrow.frame = CGRectMake(255, (creekDirectionButton.frame.size.height / 2) - 23, 45, 45);
    creekArrow.opaque = YES;
    
    UIImageView *rashidiyaNode = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"terminus_rashidiya"]];
    rashidiyaNode.frame = CGRectMake(225, (rashidiyaDirectionButton.frame.size.height / 2) - 2, 36, 26);
    rashidiyaNode.opaque = YES;
    
    UIImageView *jebelAliNode = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"terminus_jebelali"]];
    jebelAliNode.frame = CGRectMake(65, (rashidiyaDirectionButton.frame.size.height / 2) - 2, 36, 26);
    jebelAliNode.opaque = YES;
    
    UIImageView *etisalatNode = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"terminus_etisalat"]];
    etisalatNode.frame = CGRectMake(225, (rashidiyaDirectionButton.frame.size.height / 2) - 2, 36, 26);
    etisalatNode.opaque = YES;
    
    UIImageView *creekNode = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"terminus_creek"]];
    creekNode.frame = CGRectMake(65, (rashidiyaDirectionButton.frame.size.height / 2) - 2, 36, 26);
    creekNode.opaque = YES;
    
    stationNumberNode = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"station_node_white"]];
    stationNumberNode.frame = CGRectMake(280, screenBounds.size.height - 49, 31, 23);
    stationNumberNode.opaque = YES;
    stationNumberNode.alpha = 0.0;
    
    locationArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"location_arrow"]];
    locationArrow.frame = CGRectMake(80, screenBounds.size.height - 40, 23, 23);
    locationArrow.opaque = YES;
    locationArrow.alpha = 0.0;
    
    notificationPanelLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 40, 280, notificationPanel.frame.size.height - 60)];
    notificationPanelLabel.textAlignment = NSTextAlignmentCenter;
    notificationPanelLabel.textColor = [UIColor whiteColor];
    notificationPanelLabel.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:MAIN_FONT_SIZE];
    notificationPanelLabel.numberOfLines = 0;
    notificationPanelLabel.backgroundColor = [UIColor clearColor];
    notificationPanelLabel.opaque = YES;
    
    helpLabel_distance = [[UILabel alloc] initWithFrame:CGRectMake(0, screenBounds.size.height, 320, 12)];
    helpLabel_distance.textAlignment = NSTextAlignmentCenter;
    helpLabel_distance.textColor = [UIColor whiteColor];
    helpLabel_distance.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:MIN_SECONDARY_FONT_SIZE];
    helpLabel_distance.numberOfLines = 1;
    helpLabel_distance.clipsToBounds = NO;
    helpLabel_distance.layer.masksToBounds = NO;
    helpLabel_distance.layer.shadowColor = [UIColor colorWithWhite:1.0 alpha:0.5].CGColor;
    helpLabel_distance.layer.shadowRadius = 4.0f;
    helpLabel_distance.layer.shadowOpacity = 0.9;
    helpLabel_distance.layer.shadowOffset = CGSizeZero;
    helpLabel_distance.backgroundColor = [UIColor clearColor];
    helpLabel_distance.opaque = YES;
    helpLabel_distance.alpha = 0.0;
    
    helpLabel_ETA = [[UILabel alloc] initWithFrame:CGRectMake(0, screenBounds.size.height + 60, 320, 14)];
    helpLabel_ETA.textAlignment = NSTextAlignmentCenter;
    helpLabel_ETA.textColor = [UIColor whiteColor];
    helpLabel_ETA.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:SECONDARY_FONT_SIZE];
    helpLabel_ETA.numberOfLines = 1;
    helpLabel_ETA.clipsToBounds = NO;
    helpLabel_ETA.layer.masksToBounds = NO;
    helpLabel_ETA.layer.shadowColor = [UIColor colorWithWhite:1.0 alpha:0.5].CGColor;
    helpLabel_ETA.layer.shadowRadius = 4.0f;
    helpLabel_ETA.layer.shadowOpacity = 0.9;
    helpLabel_ETA.layer.shadowOffset = CGSizeZero;
    helpLabel_ETA.backgroundColor = [UIColor clearColor];
    helpLabel_ETA.opaque = YES;
    helpLabel_ETA.alpha = 0.0;
    
    helpLabel_selection = [[UILabel alloc] initWithFrame:CGRectMake(0, screenBounds.size.height - 40, 320, 14)];
    helpLabel_selection.textAlignment = NSTextAlignmentCenter;
    helpLabel_selection.textColor = [UIColor whiteColor];
    helpLabel_selection.text = @"Which station are you at?";
    helpLabel_selection.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:SECONDARY_FONT_SIZE];
    helpLabel_selection.numberOfLines = 1;
    helpLabel_selection.clipsToBounds = NO;
    helpLabel_selection.layer.masksToBounds = NO;
    helpLabel_selection.layer.shadowColor = [UIColor colorWithWhite:1.0 alpha:0.5].CGColor;
    helpLabel_selection.layer.shadowRadius = 4.0f;
    helpLabel_selection.layer.shadowOpacity = 0.9;
    helpLabel_selection.layer.shadowOffset = CGSizeZero;
    helpLabel_selection.backgroundColor = [UIColor clearColor];
    helpLabel_selection.opaque = YES;
    helpLabel_selection.alpha = 0.0;
    
    stationNumberNodeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 31, 23)];
    stationNumberNodeLabel.textAlignment = NSTextAlignmentCenter;
    stationNumberNodeLabel.textColor = [UIColor colorWithRed:0.0/255.0 green:42.0/255.0 blue:78.0/255.0 alpha:0.7];
    stationNumberNodeLabel.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:SECONDARY_FONT_SIZE];
    stationNumberNodeLabel.numberOfLines = 1;
    stationNumberNodeLabel.backgroundColor = [UIColor clearColor];
    stationNumberNodeLabel.opaque = YES;
    
    nextTrainLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, (screenBounds.size.height / 2) + 5, 280, 65)];
    nextTrainLabel.textAlignment = NSTextAlignmentCenter;
    nextTrainLabel.textColor = [UIColor whiteColor];
    nextTrainLabel.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:28];
    nextTrainLabel.numberOfLines = 0;
    nextTrainLabel.clipsToBounds = NO;
    nextTrainLabel.layer.masksToBounds = NO;
    nextTrainLabel.layer.shadowColor = [UIColor colorWithWhite:1.0 alpha:0.5].CGColor;
    nextTrainLabel.layer.shadowRadius = 4.0f;
    nextTrainLabel.layer.shadowOpacity = 0.9;
    nextTrainLabel.layer.shadowOffset = CGSizeZero;
    nextTrainLabel.backgroundColor = [UIColor clearColor];
    nextTrainLabel.opaque = YES;
    nextTrainLabel.alpha = 0.0;
    
    countdownLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, (screenBounds.size.height / 2) - 70, 320, 21)];
    countdownLabel.textAlignment = NSTextAlignmentCenter;
    countdownLabel.textColor = [UIColor whiteColor];
    countdownLabel.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:MAIN_FONT_SIZE];
    countdownLabel.numberOfLines = 1;
    countdownLabel.clipsToBounds = NO;
    countdownLabel.layer.masksToBounds = NO;
    countdownLabel.layer.shadowColor = [UIColor colorWithWhite:1.0 alpha:0.5].CGColor;
    countdownLabel.layer.shadowRadius = 4.0f;
    countdownLabel.layer.shadowOpacity = 0.9;
    countdownLabel.layer.shadowOffset = CGSizeZero;
    countdownLabel.backgroundColor = [UIColor clearColor];
    countdownLabel.opaque = YES;
    countdownLabel.alpha = 0.0;
    
    loveLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 30, 280, 17)];
    loveLabel.textAlignment = NSTextAlignmentCenter;
    loveLabel.textColor = [UIColor whiteColor];
    loveLabel.text = @"❤ MetroMate 1.0.3, by Ali Mahouk.";
    loveLabel.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:MIN_MAIN_FONT_SIZE];
    loveLabel.numberOfLines = 0;
    loveLabel.backgroundColor = [UIColor clearColor];
    loveLabel.opaque = YES;
    
    disclaimerLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 65, 280, 50)];
    disclaimerLabel.textColor = [UIColor whiteColor];
    disclaimerLabel.text = @"Disclaimer:\nTimings & distances displayed here are our best estimations. Actual values might vary, especially during train service disruptions.";
    disclaimerLabel.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:MIN_SECONDARY_FONT_SIZE];
    disclaimerLabel.numberOfLines = 0;
    disclaimerLabel.backgroundColor = [UIColor clearColor];
    disclaimerLabel.opaque = YES;
    
    UIImageView *phoneIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"phone"]];
    phoneIcon.frame = CGRectMake(10, 13, 18, 18);
    phoneIcon.opaque = YES;
    
    UIImageView *RTAIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rta_logo"]];
    RTAIcon.frame = CGRectMake(228, 13, 42, 18);
    RTAIcon.opaque = YES;
    
    onTrainButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [onTrainButton setTitle:@"I'm on the train" forState:UIControlStateNormal];
    onTrainButton.titleLabel.textColor = [UIColor whiteColor];
    onTrainButton.titleLabel.textAlignment = NSTextAlignmentRight;
    onTrainButton.titleLabel.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:MIN_MAIN_FONT_SIZE];
    onTrainButton.titleLabel.numberOfLines = 1;
    onTrainButton.titleLabel.clipsToBounds = NO;
    onTrainButton.titleLabel.layer.masksToBounds = NO;
    onTrainButton.titleLabel.layer.shadowColor = [UIColor colorWithWhite:1.0 alpha:0.5].CGColor;
    onTrainButton.titleLabel.layer.shadowRadius = 4.0f;
    onTrainButton.titleLabel.layer.shadowOpacity = 0.9;
    onTrainButton.titleLabel.layer.shadowOffset = CGSizeZero;
    onTrainButton.backgroundColor = [UIColor clearColor];
    [onTrainButton setBackgroundImage:[[UIImage imageNamed:@"round_button"] stretchableImageWithLeftCapWidth:10 topCapHeight:10] forState:UIControlStateNormal];
    [onTrainButton setBackgroundImage:[[UIImage imageNamed:@"round_button_highlighted"] stretchableImageWithLeftCapWidth:10 topCapHeight:10] forState:UIControlStateHighlighted];
    [onTrainButton addTarget:self action:@selector(embarkTrain) forControlEvents:UIControlEventTouchUpInside];
    onTrainButton.opaque = YES;
    onTrainButton.frame = CGRectMake(20, (screenBounds.size.height / 2) + 80, 280, 44);
    onTrainButton.alpha = 0.0;
    onTrainButton.hidden = YES;
    
    nolInfoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [nolInfoButton setTitle:@"Nol Card Information" forState:UIControlStateNormal];
    nolInfoButton.titleLabel.textColor = [UIColor whiteColor];
    nolInfoButton.titleLabel.textAlignment = NSTextAlignmentRight;
    nolInfoButton.titleLabel.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:MIN_MAIN_FONT_SIZE];
    nolInfoButton.titleLabel.numberOfLines = 1;
    nolInfoButton.titleLabel.clipsToBounds = NO;
    nolInfoButton.titleLabel.layer.masksToBounds = NO;
    nolInfoButton.titleLabel.layer.shadowColor = [UIColor colorWithWhite:1.0 alpha:0.5].CGColor;
    nolInfoButton.titleLabel.layer.shadowRadius = 4.0f;
    nolInfoButton.titleLabel.layer.shadowOpacity = 0.9;
    nolInfoButton.titleLabel.layer.shadowOffset = CGSizeZero;
    nolInfoButton.backgroundColor = [UIColor clearColor];
    [nolInfoButton setBackgroundImage:[[UIImage imageNamed:@"round_button"] stretchableImageWithLeftCapWidth:10 topCapHeight:10] forState:UIControlStateNormal];
    [nolInfoButton setBackgroundImage:[[UIImage imageNamed:@"round_button_highlighted"] stretchableImageWithLeftCapWidth:10 topCapHeight:10] forState:UIControlStateHighlighted];
    [nolInfoButton addTarget:self action:@selector(presentNolInfo) forControlEvents:UIControlEventTouchUpInside];
    nolInfoButton.opaque = YES;
    nolInfoButton.frame = CGRectMake(20, disclaimerLabel.frame.origin.y + disclaimerLabel.frame.size.height + 12, 280, 44);
    
    callRTAButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [callRTAButton setTitle:@"Call RTA" forState:UIControlStateNormal];
    callRTAButton.titleLabel.textColor = [UIColor whiteColor];
    callRTAButton.titleLabel.textAlignment = NSTextAlignmentRight;
    callRTAButton.titleLabel.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:MIN_MAIN_FONT_SIZE];
    callRTAButton.titleLabel.numberOfLines = 1;
    callRTAButton.titleLabel.clipsToBounds = NO;
    callRTAButton.titleLabel.layer.masksToBounds = NO;
    callRTAButton.titleLabel.layer.shadowColor = [UIColor colorWithWhite:1.0 alpha:0.5].CGColor;
    callRTAButton.titleLabel.layer.shadowRadius = 4.0f;
    callRTAButton.titleLabel.layer.shadowOpacity = 0.9;
    callRTAButton.titleLabel.layer.shadowOffset = CGSizeZero;
    callRTAButton.backgroundColor = [UIColor clearColor];
    [callRTAButton setBackgroundImage:[[UIImage imageNamed:@"round_button"] stretchableImageWithLeftCapWidth:10 topCapHeight:10] forState:UIControlStateNormal];
    [callRTAButton setBackgroundImage:[[UIImage imageNamed:@"round_button_highlighted"] stretchableImageWithLeftCapWidth:10 topCapHeight:10] forState:UIControlStateHighlighted];
    [callRTAButton addTarget:self action:@selector(callRTA) forControlEvents:UIControlEventTouchUpInside];
    callRTAButton.opaque = YES;
    callRTAButton.frame = CGRectMake(20, disclaimerLabel.frame.origin.y + disclaimerLabel.frame.size.height + 66, 280, 44);
    
    checkBalanceButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [checkBalanceButton setTitle:@"Check Card Balance" forState:UIControlStateNormal];
    checkBalanceButton.titleLabel.textColor = [UIColor whiteColor];
    checkBalanceButton.titleLabel.textAlignment = NSTextAlignmentRight;
    checkBalanceButton.titleLabel.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:MIN_MAIN_FONT_SIZE];
    checkBalanceButton.titleLabel.numberOfLines = 1;
    checkBalanceButton.titleLabel.clipsToBounds = NO;
    checkBalanceButton.titleLabel.layer.masksToBounds = NO;
    checkBalanceButton.titleLabel.layer.shadowColor = [UIColor colorWithWhite:1.0 alpha:0.5].CGColor;
    checkBalanceButton.titleLabel.layer.shadowRadius = 4.0f;
    checkBalanceButton.titleLabel.layer.shadowOpacity = 0.9;
    checkBalanceButton.titleLabel.layer.shadowOffset = CGSizeZero;
    checkBalanceButton.backgroundColor = [UIColor clearColor];
    [checkBalanceButton setBackgroundImage:[[UIImage imageNamed:@"round_button"] stretchableImageWithLeftCapWidth:10 topCapHeight:10] forState:UIControlStateNormal];
    [checkBalanceButton setBackgroundImage:[[UIImage imageNamed:@"round_button_highlighted"] stretchableImageWithLeftCapWidth:10 topCapHeight:10] forState:UIControlStateHighlighted];
    [checkBalanceButton addTarget:self action:@selector(checkCardBalance:) forControlEvents:UIControlEventTouchUpInside];
    checkBalanceButton.opaque = YES;
    checkBalanceButton.frame = CGRectMake(20, disclaimerLabel.frame.origin.y + disclaimerLabel.frame.size.height + 12, 280, 44);
    checkBalanceButton.enabled = NO;
    
    rateAppButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rateAppButton setTitle:@"Rate on the App Store" forState:UIControlStateNormal];
    rateAppButton.titleLabel.textColor = [UIColor whiteColor];
    rateAppButton.titleLabel.textAlignment = NSTextAlignmentRight;
    rateAppButton.titleLabel.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:MIN_MAIN_FONT_SIZE];
    rateAppButton.titleLabel.numberOfLines = 1;
    rateAppButton.titleLabel.clipsToBounds = NO;
    rateAppButton.titleLabel.layer.masksToBounds = NO;
    rateAppButton.titleLabel.layer.shadowColor = [UIColor colorWithWhite:1.0 alpha:0.5].CGColor;
    rateAppButton.titleLabel.layer.shadowRadius = 4.0f;
    rateAppButton.titleLabel.layer.shadowOpacity = 0.9;
    rateAppButton.titleLabel.layer.shadowOffset = CGSizeZero;
    rateAppButton.backgroundColor = [UIColor clearColor];
    [rateAppButton setBackgroundImage:[[UIImage imageNamed:@"round_button"] stretchableImageWithLeftCapWidth:10 topCapHeight:10] forState:UIControlStateNormal];
    [rateAppButton setBackgroundImage:[[UIImage imageNamed:@"round_button_highlighted"] stretchableImageWithLeftCapWidth:10 topCapHeight:10] forState:UIControlStateHighlighted];
    [rateAppButton addTarget:self action:@selector(rateApp) forControlEvents:UIControlEventTouchUpInside];
    rateAppButton.opaque = YES;
    rateAppButton.frame = CGRectMake(20, disclaimerLabel.frame.origin.y + disclaimerLabel.frame.size.height + 424, 280, 44);
    
    UIButton *socialProfilesButton_Ali = [UIButton buttonWithType:UIButtonTypeCustom];
    [socialProfilesButton_Ali setTitle:@"@Ali Mahouk" forState:UIControlStateNormal];
    [socialProfilesButton_Ali setTitleColor:[UIColor colorWithRed:255/255.0 green:224/255.0 blue:36/255.0 alpha:1.0] forState:UIControlStateNormal];
    [socialProfilesButton_Ali setTitleColor:[UIColor colorWithRed:194/255.0 green:132/255.0 blue:0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    socialProfilesButton_Ali.titleLabel.font = [UIFont fontWithName:@"Georgia" size:MAIN_FONT_SIZE];
    socialProfilesButton_Ali.titleLabel.numberOfLines = 1;
    socialProfilesButton_Ali.backgroundColor = [UIColor clearColor];
    [socialProfilesButton_Ali addTarget:self action:@selector(showSocialProfiles:) forControlEvents:UIControlEventTouchUpInside];
    socialProfilesButton_Ali.opaque = YES;
    socialProfilesButton_Ali.frame = CGRectMake(50, disclaimerLabel.frame.origin.y + disclaimerLabel.frame.size.height + 320, 100, 20);
    socialProfilesButton_Ali.tag = 0;
    
    UIButton *socialProfilesButton_Diana = [UIButton buttonWithType:UIButtonTypeCustom];
    [socialProfilesButton_Diana setTitle:@"@LaDyiaNova" forState:UIControlStateNormal];
    [socialProfilesButton_Diana setTitleColor:[UIColor colorWithRed:255/255.0 green:224/255.0 blue:36/255.0 alpha:1.0] forState:UIControlStateNormal];
    [socialProfilesButton_Diana setTitleColor:[UIColor colorWithRed:194/255.0 green:132/255.0 blue:0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    socialProfilesButton_Diana.titleLabel.font = [UIFont fontWithName:@"Georgia" size:MAIN_FONT_SIZE];
    socialProfilesButton_Diana.titleLabel.numberOfLines = 1;
    socialProfilesButton_Diana.backgroundColor = [UIColor clearColor];
    [socialProfilesButton_Diana addTarget:self action:@selector(showSocialProfiles:) forControlEvents:UIControlEventTouchUpInside];
    socialProfilesButton_Diana.opaque = YES;
    socialProfilesButton_Diana.frame = CGRectMake(70, disclaimerLabel.frame.origin.y + disclaimerLabel.frame.size.height + 374, 120, 20);
    socialProfilesButton_Diana.tag = 1;
    
    UILabel *bioLabel_Ali = [[UILabel alloc] initWithFrame:CGRectMake(20, disclaimerLabel.frame.origin.y + disclaimerLabel.frame.size.height + 339, 280, 20)];
    bioLabel_Ali.textColor = [UIColor whiteColor];
    bioLabel_Ali.text = @"Designer, h4cker.";
    bioLabel_Ali.font = [UIFont fontWithName:@"Georgia-Italic" size:MIN_MAIN_FONT_SIZE];
    bioLabel_Ali.numberOfLines = 1;
    bioLabel_Ali.backgroundColor = [UIColor clearColor];
    bioLabel_Ali.opaque = YES;
    
    UILabel *bioLabel_Diana = [[UILabel alloc] initWithFrame:CGRectMake(20, disclaimerLabel.frame.origin.y + disclaimerLabel.frame.size.height + 394, 280, 20)];
    bioLabel_Diana.textColor = [UIColor whiteColor];
    bioLabel_Diana.text = @"Business affairs.";
    bioLabel_Diana.font = [UIFont fontWithName:@"Georgia-Italic" size:MIN_MAIN_FONT_SIZE];
    bioLabel_Diana.numberOfLines = 1;
    bioLabel_Diana.backgroundColor = [UIColor clearColor];
    bioLabel_Diana.opaque = YES;
    
    UILabel *copyright = [[UILabel alloc] initWithFrame:CGRectMake(20, disclaimerLabel.frame.origin.y + disclaimerLabel.frame.size.height + 479, 280, 14)];
    copyright.textColor = [UIColor whiteColor];
    copyright.textAlignment = NSTextAlignmentCenter;
    copyright.text = @"© 2014 Ali Mahouk. be original.";
    copyright.font = [UIFont fontWithName:@"Georgia" size:SECONDARY_FONT_SIZE];
    copyright.numberOfLines = 1;
    copyright.backgroundColor = [UIColor clearColor];
    copyright.opaque = YES;
    
    nolCardNumberFieldLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 20, 270, 16)];
    nolCardNumberFieldLabel.textColor = [UIColor whiteColor];
    nolCardNumberFieldLabel.text = @"Nol Card Number";
    nolCardNumberFieldLabel.clipsToBounds = NO;
    nolCardNumberFieldLabel.layer.masksToBounds = NO;
    nolCardNumberFieldLabel.layer.shadowColor = [UIColor colorWithWhite:1.0 alpha:0.5].CGColor;
    nolCardNumberFieldLabel.layer.shadowRadius = 4.0f;
    nolCardNumberFieldLabel.layer.shadowOpacity = 0.9;
    nolCardNumberFieldLabel.layer.shadowOffset = CGSizeZero;
    nolCardNumberFieldLabel.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:MIN_MAIN_FONT_SIZE];
    nolCardNumberFieldLabel.numberOfLines = 1;
    nolCardNumberFieldLabel.backgroundColor = [UIColor clearColor];
    nolCardNumberFieldLabel.opaque = YES;
    
    nolCardNumberField = [[UITextField alloc] initWithFrame:CGRectMake(34, 70, 256, 45)];
    nolCardNumberField.delegate = self;
    nolCardNumberField.borderStyle = UITextBorderStyleNone;
    nolCardNumberField.clearButtonMode = UITextFieldViewModeWhileEditing;
    nolCardNumberField.keyboardType = UIKeyboardTypeNumberPad;
    nolCardNumberField.textColor = [UIColor whiteColor];
    nolCardNumberField.clipsToBounds = NO;
    nolCardNumberField.layer.masksToBounds = NO;
    nolCardNumberField.layer.shadowColor = [UIColor colorWithWhite:1.0 alpha:0.5].CGColor;
    nolCardNumberField.layer.shadowRadius = 4.0f;
    nolCardNumberField.layer.shadowOpacity = 0.9;
    nolCardNumberField.layer.shadowOffset = CGSizeZero;
    nolCardNumberField.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:14.5];
    nolCardNumberField.placeholder = @"Enter the number on the back...";
    nolCardNumberField.tag = 0;
    
    UIButton *backgroundTouchSensor = [UIButton buttonWithType:UIButtonTypeCustom];
    backgroundTouchSensor.backgroundColor = [UIColor clearColor];
    [backgroundTouchSensor addTarget:self action:@selector(saveCardInfo) forControlEvents:UIControlEventTouchUpInside];
    backgroundTouchSensor.opaque = YES;
    backgroundTouchSensor.frame = CGRectMake(0, 0, 320, 480);
    
    UIButton *nolCard_gold = [UIButton buttonWithType:UIButtonTypeCustom];
    nolCard_gold.backgroundColor = [UIColor clearColor];
    [nolCard_gold setBackgroundImage:[UIImage imageNamed:@"nol_gold"] forState:UIControlStateNormal];
    [nolCard_gold addTarget:self action:@selector(changeCardType:) forControlEvents:UIControlEventTouchUpInside];
    nolCard_gold.opaque = YES;
    nolCard_gold.frame = CGRectMake(165, 185, 140, 92);
    nolCard_gold.tag = 0;
    
    UIButton *nolCard_silver = [UIButton buttonWithType:UIButtonTypeCustom];
    nolCard_silver.backgroundColor = [UIColor clearColor];
    [nolCard_silver setBackgroundImage:[UIImage imageNamed:@"nol_silver"] forState:UIControlStateNormal];
    [nolCard_silver addTarget:self action:@selector(changeCardType:) forControlEvents:UIControlEventTouchUpInside];
    nolCard_silver.opaque = YES;
    nolCard_silver.frame = CGRectMake(20, 185, 140, 92);
    nolCard_silver.tag = 1;
    
    UIButton *nolCard_blue = [UIButton buttonWithType:UIButtonTypeCustom];
    nolCard_blue.backgroundColor = [UIColor clearColor];
    [nolCard_blue setBackgroundImage:[UIImage imageNamed:@"nol_blue"] forState:UIControlStateNormal];
    [nolCard_blue addTarget:self action:@selector(changeCardType:) forControlEvents:UIControlEventTouchUpInside];
    nolCard_blue.opaque = YES;
    nolCard_blue.frame = CGRectMake(20, 290, 140, 92);
    nolCard_blue.tag = 2;
    
    UIButton *nolCard_red = [UIButton buttonWithType:UIButtonTypeCustom];
    nolCard_red.backgroundColor = [UIColor clearColor];
    [nolCard_red setBackgroundImage:[UIImage imageNamed:@"nol_red"] forState:UIControlStateNormal];
    [nolCard_red addTarget:self action:@selector(changeCardType:) forControlEvents:UIControlEventTouchUpInside];
    nolCard_red.opaque = YES;
    nolCard_red.frame = CGRectMake(165, 290, 140, 92);
    nolCard_red.tag = 3;
    
    stationList = [[UITableView alloc] initWithFrame:CGRectMake(0, rashidiyaDirectionButton.frame.size.height - 6, 320, screenBounds.size.height - rashidiyaDirectionButton.frame.size.height - 54)];
    stationList.backgroundColor = [UIColor clearColor];
    stationList.separatorStyle = UITableViewCellSeparatorStyleNone;
    stationList.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    stationList.delegate = self;
    stationList.dataSource = self;
    stationList.alpha = 0.0;
    stationList.tag = 0;
    stationList.hidden = YES;
    
    backScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, rashidiyaDirectionButton.frame.size.height - 6, 320, screenBounds.size.height - rashidiyaDirectionButton.frame.size.height - 14)];
    backScrollView.backgroundColor = [UIColor clearColor];
    backScrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    backScrollView.contentSize = CGSizeMake(320, 624);
    backScrollView.scrollsToTop = NO;
    backScrollView.tag = 1;
    
    nolCardScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(200, rashidiyaDirectionButton.frame.size.height - 6, 320, screenBounds.size.height - rashidiyaDirectionButton.frame.size.height - 14)];
    nolCardScrollView.backgroundColor = [UIColor clearColor];
    nolCardScrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    nolCardScrollView.contentSize = CGSizeMake(320, 400);
    nolCardScrollView.scrollsToTop = NO;
    nolCardScrollView.alpha = 0;
    nolCardScrollView.tag = 2;
    nolCardScrollView.hidden = YES;
    
    UIColor *outerColor = [UIColor colorWithWhite:1.0 alpha:1.0];
    UIColor *innerColor = [UIColor colorWithWhite:1.0 alpha:0.0];
    
    maskLayer_stationList = [CAGradientLayer layer];
    maskLayer_stationList.colors = [NSArray arrayWithObjects:(__bridge id)innerColor.CGColor, (__bridge id)outerColor.CGColor, (__bridge id)outerColor.CGColor, (__bridge id)innerColor.CGColor, nil];
    maskLayer_stationList.locations = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0],
                                    [NSNumber numberWithFloat:0.2],
                                    [NSNumber numberWithFloat:0.8],
                                    [NSNumber numberWithFloat:1.0], nil];
    
    maskLayer_stationList.bounds = CGRectMake(0, 0, stationList.frame.size.width, stationList.frame.size.height);
    maskLayer_stationList.position = CGPointMake(0, stationList.contentOffset.y);
    maskLayer_stationList.anchorPoint = CGPointZero;
    stationList.layer.mask = maskLayer_stationList;
    
    NSString *nolCardType = [appDelegate.dataController readProperty:@"cardType"];
    nolCardNumber = @"";
    
    if ( [appDelegate.dataController readProperty:@"cardNumber"].length > 0 )
    {
        nolCardNumber = [appDelegate.dataController readProperty:@"cardNumber"];
        checkBalanceButton.enabled = YES;
    }
    
    nolCardNumberField.text = nolCardNumber;
    
    if ( [nolCardType isEqualToString:@"gold"] )
    {
        [nolCard_gold addSubview:cardSelectionFrame];
    }
    else if ([nolCardType isEqualToString:@"silver"] )
    {
        [nolCard_silver addSubview:cardSelectionFrame];
    }
    else if ([nolCardType isEqualToString:@"blue"] )
    {
        [nolCard_blue addSubview:cardSelectionFrame];
    }
    else if ([nolCardType isEqualToString:@"red"] )
    {
        [nolCard_red addSubview:cardSelectionFrame];
    }
    
    [backToFrontViewButton addSubview:backToFrontViewArrow];
    [rashidiyaDirectionButton addSubview:rashidiyaArrow];
    [rashidiyaDirectionButton addSubview:rashidiyaNode];
    [jebelAliDirectionButton addSubview:jebelAliArrow];
    [jebelAliDirectionButton addSubview:jebelAliNode];
    [etisalatDirectionButton addSubview:etisalatArrow];
    [etisalatDirectionButton addSubview:etisalatNode];
    [creekDirectionButton addSubview:creekArrow];
    [creekDirectionButton addSubview:creekNode];
    [notificationPanel addSubview:notificationPanelLabel];
    [callRTAButton addSubview:phoneIcon];
    [callRTAButton addSubview:RTAIcon];
    [onTrainButton addSubview:onTrainButtonGlow];
    [callRTAButton addSubview:callRTAButtonGlow];
    [nolInfoButton addSubview:nolInfoButtonGlow];
    [rateAppButton addSubview:rateAppButtonGlow];
    [checkBalanceButton addSubview:checkBalanceButtonGlow];
    [stationNumberNode addSubview:stationNumberNodeLabel];
    [backScrollView addSubview:SHRoof];
    [backScrollView addSubview:loveLabel];
    [backScrollView addSubview:disclaimerLabel];
    [backScrollView addSubview:nolInfoButton];
    [backScrollView addSubview:callRTAButton];
    [backScrollView addSubview:socialProfilesButton_Ali];
    [backScrollView addSubview:socialProfilesButton_Diana];
    [backScrollView addSubview:bioLabel_Ali];
    [backScrollView addSubview:bioLabel_Diana];
    [backScrollView addSubview:copyright];
    [backScrollView addSubview:rateAppButton];
    [nolCardScrollView addSubview:backgroundTouchSensor];
    [nolCardScrollView addSubview:nolCardNumberFieldLabel];
    [nolCardScrollView addSubview:nolCardNumberFieldBG];
    [nolCardScrollView addSubview:nolCardNumberField];
    [nolCardScrollView addSubview:checkBalanceButton];
    [nolCardScrollView addSubview:nolCard_gold];
    [nolCardScrollView addSubview:nolCard_blue];
    [nolCardScrollView addSubview:nolCard_red];
    [nolCardScrollView addSubview:nolCard_silver];
    [frontView addSubview:pixelPattern];
    [frontView addSubview:stationList];
    [frontView addSubview:rashidiyaDirectionButton];
    [frontView addSubview:jebelAliDirectionButton];
    [frontView addSubview:etisalatDirectionButton];
    [frontView addSubview:creekDirectionButton];
    [frontView addSubview:helpLabel_distance];
    [frontView addSubview:helpLabel_ETA];
    [frontView addSubview:helpLabel_selection];
    [frontView addSubview:nextTrainLabel];
    [frontView addSubview:countdownLabel];
    [frontView addSubview:onTrainButton];
    [frontView addSubview:stationNumberNode];
    [frontView addSubview:locationArrow];
    [frontView addSubview:errorIcon];
    [frontView addSubview:infoButton];
    [frontView addSubview:directionMenuSeparator_1];
    [frontView addSubview:directionMenuSeparator_2];
    [frontView addSubview:directionMenuSeparator_3];
    [backView addSubview:nolCardScrollView];
    [backView addSubview:backScrollView];
    [backView addSubview:backToFrontViewButton];
    [backView addSubview:directionMenuSeparator_4];
    [self.view addSubview:backView];
    [self.view addSubview:frontView];
    [self.view addSubview:notificationPanel];
    [self.view addSubview:screenLowerGlow];
    [self.view addSubview:screenUpperGlow];
    
    shouldAutoselectStation = YES;
    directionIsSelected = NO;
    stationIsSelected = NO;
    fetchingNearbyStation = NO;
    displayedNolCardInfoIsEnglish = YES;
    displayedNotificationIsEnglish = NO;
    displayedStationInfoIsEnglish = YES;
    displayedTimeIsEnglish = YES;
    countdownStarted = NO;
    isLastTrain = NO;
    trainServiceRunning = YES;
    
    [UIView animateWithDuration:0.03 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        pixelPattern.frame = CGRectMake(0, (screenBounds.size.height / 2) + 5, 320, 3);
        pixelPattern.alpha = 0.9;
    } completion:^(BOOL finished){
        [Sound soundEffect:2]; // Startup sound of the screen turning on.
        [self presentDirectionList];
    }];
    
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [super viewWillAppear:animated];
}

- (void)presentDirectionList
{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    
    // Turn off pointless animation.
    [locationArrow.layer removeAllAnimations];
    isOnTrain = NO;
    
    [UIView animateWithDuration:0.3 delay:0.1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        if ( !directionIsSelected )
        {
            frontView.backgroundColor = [UIColor colorWithRed:0.0/255.0 green:90.0/255.0 blue:168.0/255.0 alpha:1.0];
            pixelPattern.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"pixel_pattern"]];
            pixelPattern.frame = CGRectMake(0, 0, 320, screenBounds.size.height);
            pixelPattern.alpha = 0.1;
            screenUpperGlow.alpha = 0.5;
            screenLowerGlow.alpha = 0.2;
            infoButton.alpha = 0.7;
        }
        
        errorIcon.frame = CGRectMake(133, (screenBounds.size.height / 2) - 23, 53, 45);
        stationNumberNode.frame = CGRectMake(280, screenBounds.size.height - 49, 31, 23);
        locationArrow.frame = CGRectMake(80, screenBounds.size.height - 40, 23, 23);
        nextTrainLabel.frame = CGRectMake(20, (screenBounds.size.height / 2) + 5, 280, 65);
        countdownLabel.frame = CGRectMake(0, (screenBounds.size.height / 2) - 70, 320, 21);
        helpLabel_distance.frame = CGRectMake(0, screenBounds.size.height, 320, 12);
        helpLabel_ETA.frame = CGRectMake(0, (screenBounds.size.height / 2) + 60, 320, 14);
        helpLabel_selection.frame = CGRectMake(0, screenBounds.size.height - 40, 320, 14);
        helpLabel_selection.alpha = 0.0;
        helpLabel_distance.alpha = 0.0;
        helpLabel_ETA.alpha = 0.0;
        errorIcon.alpha = 0.0;
        stationNumberNode.alpha = 0.0;
        locationArrow.alpha = 0.0;
        nextTrainLabel.alpha = 0.0;
        countdownLabel.alpha = 0.0;
        stationList.alpha = 0.0;
        onTrainButton.alpha = 0.0;
        rashidiyaDirectionButton.alpha = 1.0;
        jebelAliDirectionButton.alpha = 1.0;
        etisalatDirectionButton.alpha = 1.0;
        creekDirectionButton.alpha = 1.0;
    } completion:^(BOOL finished){
        onTrainButton.hidden = YES;
        stationList.hidden = YES;
        
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            frontView.backgroundColor = [UIColor colorWithRed:0.0/255.0 green:42.0/255.0 blue:78.0/255.0 alpha:1.0];
            pixelPattern.alpha = 0.2;
        } completion:^(BOOL finished){
            [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                rashidiyaDirectionButton.frame = CGRectMake(0, 0, 320, directionMenuSeparator_1.frame.origin.y + 15);
                jebelAliDirectionButton.frame = CGRectMake(0, rashidiyaDirectionButton.frame.size.height + 5, 320, rashidiyaDirectionButton.frame.size.height);
                etisalatDirectionButton.frame = CGRectMake(0, rashidiyaDirectionButton.frame.size.height * 2 + 10, 320, rashidiyaDirectionButton.frame.size.height);
                creekDirectionButton.frame = CGRectMake(0, rashidiyaDirectionButton.frame.size.height * 3 + 15, 320, rashidiyaDirectionButton.frame.size.height);
                directionMenuSeparator_1.alpha = 0.8;
                directionMenuSeparator_2.alpha = 0.8;
                directionMenuSeparator_3.alpha = 0.8;
                directionMenuSeparator_3.frame = CGRectMake(14, ( screenBounds.size.height - directionMenuSeparator_2.frame.origin.y / 2) - 9, 292, 17);
            } completion:^(BOOL finished){
                // Activate pulse effect.
                CABasicAnimation *pulseAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
                [pulseAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
                [pulseAnimation setFromValue:(id)[NSNumber numberWithDouble:0.5]];
                [pulseAnimation setToValue:(id)[NSNumber numberWithDouble:0.8]];
                [pulseAnimation setAutoreverses:YES];
                [pulseAnimation setDuration:0.5];
                [pulseAnimation setRepeatCount:INT16_MAX]; // Set this to some high number that it'll probably never reach.
                
                [directionMenuSeparator_1.layer addAnimation:pulseAnimation forKey:nil];
                [directionMenuSeparator_2.layer addAnimation:pulseAnimation forKey:nil];
                [directionMenuSeparator_3.layer addAnimation:pulseAnimation forKey:nil];
            }];
        }];
    }];
}

- (void)dismissDirectionList
{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    
    // Turn off pointless animation.
    [directionMenuSeparator_2.layer removeAllAnimations];
    
    stationList.hidden = NO;
    [stationList reloadData];
    
    if ( isOnTrain )
    {
        [locationArrow.layer removeAllAnimations];
        
        rashidiyaDirectionButton.enabled = NO;
        jebelAliDirectionButton.enabled = NO;
        etisalatDirectionButton.enabled = NO;
        creekDirectionButton.enabled = NO;
        rashidiyaDirectionButton.alpha = 0.2;
        jebelAliDirectionButton.alpha = 0.2;
        etisalatDirectionButton.alpha = 0.2;
        creekDirectionButton.alpha = 0.2;
        helpLabel_selection.text = @"Which station are you headed to?";
        
        [timer_notification invalidate];
        [timer_helpLabel invalidate];
        [timer_nextTrainLabel invalidate];
        [timer_nextTrainFetch invalidate];
        [timer_countdown invalidate];
        [timer_nextTrainFetch invalidate];
        [timer_nextTrainLabel invalidate];
        [timer_countdown invalidate];
        [timer_destinationETA invalidate];
        timer_notification = nil;
        timer_helpLabel = nil;
        timer_nextTrainLabel = nil;
        timer_nextTrainFetch = nil;
        timer_countdown = nil;
        timer_nextTrainFetch = nil;
        timer_nextTrainLabel = nil;
        timer_countdown = nil;
        timer_destinationETA = nil;
        countdownStarted = NO;
    }
    else
    {
        helpLabel_selection.text = @"Which station are you at?";
    }
    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        rashidiyaDirectionButton.frame = CGRectMake(0, -rashidiyaDirectionButton.frame.size.height - 15, 320, rashidiyaDirectionButton.frame.size.height);
        jebelAliDirectionButton.frame = CGRectMake(0, -rashidiyaDirectionButton.frame.size.height - 15, 320, rashidiyaDirectionButton.frame.size.height);
        etisalatDirectionButton.frame = CGRectMake(0, rashidiyaDirectionButton.frame.size.height * 4 + 10, 320, rashidiyaDirectionButton.frame.size.height);
        creekDirectionButton.frame = CGRectMake(0, rashidiyaDirectionButton.frame.size.height * 4 + 10, 320, rashidiyaDirectionButton.frame.size.height);
        selectedDirectionButton.frame = CGRectMake(0, 0, 320, directionMenuSeparator_1.frame.origin.y + 15);
        directionMenuSeparator_2.alpha = 0.0;
        directionMenuSeparator_3.frame = CGRectMake(14, screenBounds.size.height - 68, 292, 17);
        
        if ( (stationIsSelected || stationAutoselected) && !isOnTrain )
        {
            [stationList selectRowAtIndexPath:selectedIndexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
            [[stationList delegate] tableView:stationList didSelectRowAtIndexPath:selectedIndexPath];
            
            [self alternateNotificationLabelLanguage];
            timer_notification = [NSTimer scheduledTimerWithTimeInterval:4.0 target:self selector:@selector(alternateNotificationLabelLanguage) userInfo:nil repeats:NO];
        }
        else
        {
            errorIcon.frame = CGRectMake(133, (screenBounds.size.height / 2) - 23, 53, 45);
            stationNumberNode.frame = CGRectMake(280, screenBounds.size.height - 49, 31, 23);
            locationArrow.frame = CGRectMake(80, screenBounds.size.height - 40, 23, 23);
            nextTrainLabel.frame = CGRectMake(20, (screenBounds.size.height / 2) + 5, 280, 65);
            countdownLabel.frame = CGRectMake(0, (screenBounds.size.height / 2) - 70, 320, 21);
            helpLabel_distance.frame = CGRectMake(0, screenBounds.size.height, 320, 12);
            helpLabel_ETA.frame = CGRectMake(0, (screenBounds.size.height / 2) + 60, 320, 14);
            helpLabel_distance.alpha = 0.0;
            helpLabel_ETA.alpha = 0.0;
            errorIcon.alpha = 0.0;
            stationNumberNode.alpha = 0.0;
            locationArrow.alpha = 0.0;
            nextTrainLabel.alpha = 0.0;
            countdownLabel.alpha = 0.0;
            stationList.alpha = 1.0;
        }
        
        helpLabel_selection.alpha = 1.0;
        helpLabel_selection.frame = CGRectMake(0, screenBounds.size.height - 44, 320, 14);
    } completion:^(BOOL finished){
        
    }];
}

- (void)setDirection:(id)sender
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    UIButton *button = (UIButton *)sender;
    selectedDirectionButton = button;
    
    switch ( button.tag )
    {
        case 0:
            appDelegate.direction = @"Rashidiya";
            break;
            
        case 1:
            appDelegate.direction = @"JebelAli";
            break;
            
        case 2:
            appDelegate.direction = @"Etisalat";
            break;
            
        case 3:
            appDelegate.direction = @"Creek";
            break;
            
        default:
            break;
    }
    
    if ( directionIsSelected )
    {
        [self presentDirectionList];
        directionIsSelected = NO;
        stationIsSelected = NO;
        stationAutoselected = NO;
        shouldAutoselectStation = NO;
        
        [timer_helpLabel invalidate];
        [timer_nextTrainLabel invalidate];
        [timer_nextTrainFetch invalidate];
        [timer_countdown invalidate];
        [timer_destinationETA invalidate];
        timer_helpLabel = nil;
        timer_nextTrainLabel = nil;
        timer_nextTrainFetch = nil;
        timer_countdown = nil;
        timer_destinationETA = nil;
    }
    else
    {
        [self dismissDirectionList];
        directionIsSelected = YES;
    }
}

- (void)presentAboutSection
{
    backView.hidden = NO;
    stationList.scrollsToTop = NO;
    backScrollView.scrollsToTop = YES;
    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        screenLowerGlow.alpha = 0.0;
        screenUpperGlow.alpha = 0.0;
    } completion:^(BOOL finished){
        pixelPattern.alpha = 0.1;
        [backView addSubview:pixelPattern];
        [backView sendSubviewToBack:pixelPattern];
    }];
    
    [UIView transitionWithView:frontView duration:0.75 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        frontView.hidden = YES;
    } completion:^(BOOL finished){
        
    }];
    
    [UIView transitionWithView:backView duration:0.75 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        
    } completion:^(BOOL finished){
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            screenUpperGlow.alpha = 0.5;
            screenLowerGlow.alpha = 0.2;
        } completion:^(BOOL finished){
            
        }];
        
        // Activate pulse effect.
        CABasicAnimation *pulseAnimation_menuSeparator = [CABasicAnimation animationWithKeyPath:@"opacity"];
        [pulseAnimation_menuSeparator setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [pulseAnimation_menuSeparator setFromValue:(id)[NSNumber numberWithDouble:0.5]];
        [pulseAnimation_menuSeparator setToValue:(id)[NSNumber numberWithDouble:0.8]];
        [pulseAnimation_menuSeparator setAutoreverses:YES];
        [pulseAnimation_menuSeparator setDuration:0.5];
        [pulseAnimation_menuSeparator setRepeatCount:INT16_MAX]; // Set this to some high number that it'll probably never reach.
        
        [directionMenuSeparator_1.layer removeAllAnimations];
        [directionMenuSeparator_2.layer removeAllAnimations];
        [directionMenuSeparator_3.layer removeAllAnimations];
        [directionMenuSeparator_4.layer addAnimation:pulseAnimation_menuSeparator forKey:nil];
        
        // Activate pulse effect.
        CABasicAnimation *pulseAnimation_callRTAButtonGlow = [CABasicAnimation animationWithKeyPath:@"opacity"];
        [pulseAnimation_callRTAButtonGlow setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [pulseAnimation_callRTAButtonGlow setFromValue:(id)[NSNumber numberWithDouble:0.1]];
        [pulseAnimation_callRTAButtonGlow setToValue:(id)[NSNumber numberWithDouble:1.0]];
        [pulseAnimation_callRTAButtonGlow setAutoreverses:YES];
        [pulseAnimation_callRTAButtonGlow setDuration:0.5];
        [pulseAnimation_callRTAButtonGlow setRepeatCount:INT16_MAX];
        
        [callRTAButtonGlow.layer addAnimation:pulseAnimation_callRTAButtonGlow forKey:nil];
        
        // Activate pulse effect.
        CABasicAnimation *pulseAnimation_callRTAButton = [CABasicAnimation animationWithKeyPath:@"opacity"];
        [pulseAnimation_callRTAButton setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [pulseAnimation_callRTAButton setFromValue:(id)[NSNumber numberWithDouble:0.8]];
        [pulseAnimation_callRTAButton setToValue:(id)[NSNumber numberWithDouble:1.0]];
        [pulseAnimation_callRTAButton setAutoreverses:YES];
        [pulseAnimation_callRTAButton setDuration:0.5];
        [pulseAnimation_callRTAButton setRepeatCount:INT16_MAX];
        
        [callRTAButton.layer addAnimation:pulseAnimation_callRTAButton forKey:nil];
        
        // Activate pulse effect.
        CABasicAnimation *pulseAnimation_nolInfoButtonGlow = [CABasicAnimation animationWithKeyPath:@"opacity"];
        [pulseAnimation_nolInfoButtonGlow setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [pulseAnimation_nolInfoButtonGlow setFromValue:(id)[NSNumber numberWithDouble:0.1]];
        [pulseAnimation_nolInfoButtonGlow setToValue:(id)[NSNumber numberWithDouble:1.0]];
        [pulseAnimation_nolInfoButtonGlow setAutoreverses:YES];
        [pulseAnimation_nolInfoButtonGlow setDuration:0.5];
        [pulseAnimation_nolInfoButtonGlow setRepeatCount:INT16_MAX];
        
        [nolInfoButtonGlow.layer addAnimation:pulseAnimation_nolInfoButtonGlow forKey:nil];
        
        // Activate pulse effect.
        CABasicAnimation *pulseAnimation_nolInfoButton = [CABasicAnimation animationWithKeyPath:@"opacity"];
        [pulseAnimation_nolInfoButton setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [pulseAnimation_nolInfoButton setFromValue:(id)[NSNumber numberWithDouble:0.8]];
        [pulseAnimation_nolInfoButton setToValue:(id)[NSNumber numberWithDouble:1.0]];
        [pulseAnimation_nolInfoButton setAutoreverses:YES];
        [pulseAnimation_nolInfoButton setDuration:0.5];
        [pulseAnimation_nolInfoButton setRepeatCount:INT16_MAX];
        
        [nolInfoButton.layer addAnimation:pulseAnimation_nolInfoButton forKey:nil];
        
        // Activate pulse effect.
        CABasicAnimation *pulseAnimation_rateButtonGlow = [CABasicAnimation animationWithKeyPath:@"opacity"];
        [pulseAnimation_rateButtonGlow setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [pulseAnimation_rateButtonGlow setFromValue:(id)[NSNumber numberWithDouble:0.1]];
        [pulseAnimation_rateButtonGlow setToValue:(id)[NSNumber numberWithDouble:1.0]];
        [pulseAnimation_rateButtonGlow setAutoreverses:YES];
        [pulseAnimation_rateButtonGlow setDuration:0.5];
        [pulseAnimation_rateButtonGlow setRepeatCount:INT16_MAX];
        
        [rateAppButtonGlow.layer addAnimation:pulseAnimation_rateButtonGlow forKey:nil];
        
        // Activate pulse effect.
        CABasicAnimation *pulseAnimation_rateButton = [CABasicAnimation animationWithKeyPath:@"opacity"];
        [pulseAnimation_rateButton setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [pulseAnimation_rateButton setFromValue:(id)[NSNumber numberWithDouble:0.8]];
        [pulseAnimation_rateButton setToValue:(id)[NSNumber numberWithDouble:1.0]];
        [pulseAnimation_rateButton setAutoreverses:YES];
        [pulseAnimation_rateButton setDuration:0.5];
        [pulseAnimation_rateButton setRepeatCount:INT16_MAX];
        
        [rateAppButton.layer addAnimation:pulseAnimation_rateButton forKey:nil];
        
        // Activate pulse effect.
        CABasicAnimation *pulseAnimation_checkBalanceButtonGlow = [CABasicAnimation animationWithKeyPath:@"opacity"];
        [pulseAnimation_checkBalanceButtonGlow setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [pulseAnimation_checkBalanceButtonGlow setFromValue:(id)[NSNumber numberWithDouble:0.1]];
        [pulseAnimation_checkBalanceButtonGlow setToValue:(id)[NSNumber numberWithDouble:1.0]];
        [pulseAnimation_checkBalanceButtonGlow setAutoreverses:YES];
        [pulseAnimation_checkBalanceButtonGlow setDuration:0.5];
        [pulseAnimation_checkBalanceButtonGlow setRepeatCount:INT16_MAX];
        
        [checkBalanceButtonGlow.layer addAnimation:pulseAnimation_checkBalanceButtonGlow forKey:nil];
        
        // Activate pulse effect.
        CABasicAnimation *pulseAnimation_checkBalanceButton = [CABasicAnimation animationWithKeyPath:@"opacity"];
        [pulseAnimation_checkBalanceButton setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [pulseAnimation_checkBalanceButton setFromValue:(id)[NSNumber numberWithDouble:0.8]];
        [pulseAnimation_checkBalanceButton setToValue:(id)[NSNumber numberWithDouble:1.0]];
        [pulseAnimation_checkBalanceButton setAutoreverses:YES];
        [pulseAnimation_checkBalanceButton setDuration:0.5];
        [pulseAnimation_checkBalanceButton setRepeatCount:INT16_MAX];
        
        [checkBalanceButton.layer addAnimation:pulseAnimation_checkBalanceButton forKey:nil];
    }];
}

- (void)dismissAboutSection
{
    if ( !nolCardScrollView.hidden )
    {
        [self saveCardInfo];
        [self dismissNolInfo];
    }
    else
    {
        frontView.hidden = NO;
        stationList.scrollsToTop = YES;
        backScrollView.scrollsToTop = NO;
        
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            screenLowerGlow.alpha = 0.0;
            screenUpperGlow.alpha = 0.0;
        } completion:^(BOOL finished){
            pixelPattern.alpha = 0.1;
            [frontView addSubview:pixelPattern];
            [frontView sendSubviewToBack:pixelPattern];
        }];
        
        [UIView transitionWithView:backView duration:0.75 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            backView.hidden = YES;
        } completion:^(BOOL finished){
            
        }];
        
        [UIView transitionWithView:frontView duration:0.75 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            
        } completion:^(BOOL finished){
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                screenUpperGlow.alpha = 0.5;
                screenLowerGlow.alpha = 0.2;
            } completion:^(BOOL finished){
                
            }];
            
            if ( directionMenuSeparator_2.alpha != 0 ) // DON'T activate the pulse if they're already hidden!
            {
                // Activate pulse effect.
                CABasicAnimation *pulseAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
                [pulseAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
                [pulseAnimation setFromValue:(id)[NSNumber numberWithDouble:0.5]];
                [pulseAnimation setToValue:(id)[NSNumber numberWithDouble:0.8]];
                [pulseAnimation setAutoreverses:YES];
                [pulseAnimation setDuration:0.5];
                [pulseAnimation setRepeatCount:INT16_MAX];
                
                [directionMenuSeparator_1.layer addAnimation:pulseAnimation forKey:nil];
                [directionMenuSeparator_2.layer addAnimation:pulseAnimation forKey:nil];
                [directionMenuSeparator_3.layer addAnimation:pulseAnimation forKey:nil];
            }
            
            [directionMenuSeparator_4.layer removeAllAnimations];
            [nolInfoButtonGlow.layer removeAllAnimations];
            [nolInfoButton.layer removeAllAnimations];
            [callRTAButtonGlow.layer removeAllAnimations];
            [callRTAButton.layer removeAllAnimations];
            [rateAppButtonGlow.layer removeAllAnimations];
            [rateAppButton.layer removeAllAnimations];
            [checkBalanceButtonGlow.layer removeAllAnimations];
            [checkBalanceButton.layer removeAllAnimations];
        }];
    }
}

- (void)presentNolInfo
{
    [Sound soundEffect:3]; // Play the selection sound.
    
    timer_nolCard = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(alternateNolCardInfoLanguage) userInfo:nil repeats:YES];
    backScrollView.scrollsToTop = NO;
    nolCardScrollView.hidden = NO;
    
    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        nolCardScrollView.frame = CGRectMake(0, nolCardScrollView.frame.origin.y, nolCardScrollView.frame.size.width, nolCardScrollView.frame.size.height);
        backScrollView.frame = CGRectMake(-200, backScrollView.frame.origin.y, backScrollView.frame.size.width, backScrollView.frame.size.height);
        backScrollView.alpha = 0;
        nolCardScrollView.alpha = 1;
    } completion:^(BOOL finished){
        backScrollView.hidden = YES;
    }];
}

- (void)dismissNolInfo
{
    [timer_nolCard invalidate];
    timer_nolCard = nil;
    backScrollView.scrollsToTop = YES;
    backScrollView.hidden = NO;
    
    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        nolCardScrollView.frame = CGRectMake(200, nolCardScrollView.frame.origin.y, nolCardScrollView.frame.size.width, nolCardScrollView.frame.size.height);
        backScrollView.frame = CGRectMake(0, backScrollView.frame.origin.y, backScrollView.frame.size.width, backScrollView.frame.size.height);
        backScrollView.alpha = 1;
        nolCardScrollView.alpha = 0;
    } completion:^(BOOL finished){
        nolCardScrollView.hidden = YES;
        
    }];
}

- (void)alternateNolCardInfoLanguage
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        nolCardNumberFieldLabel.alpha = 0.0;
        nolCardNumberField.alpha = 0.0;
    } completion:^(BOOL finished){
        NSString *cardNumber = nolCardNumber;
        NSString *placeholder = @"";
        
        if ( displayedNolCardInfoIsEnglish )
        {
            displayedNolCardInfoIsEnglish = NO;
            nolCardNumberFieldLabel.textAlignment = NSTextAlignmentRight;
            nolCardNumberField.textAlignment = NSTextAlignmentRight;
            placeholder = @"أدخل الرقم الموجود على خلف البطاقة...";
            cardNumber = [appDelegate westernToArabicNumerals:cardNumber];
            nolCardNumberFieldLabel.text = @"رقم بطاقة نول";
        }
        else
        {
            displayedNolCardInfoIsEnglish = YES;
            nolCardNumberFieldLabel.textAlignment = NSTextAlignmentLeft;
            nolCardNumberField.textAlignment = NSTextAlignmentLeft;
            placeholder = @"Enter the number on the back...";
            nolCardNumberFieldLabel.text = @"Nol Card Number";
        }
        
        nolCardNumberField.placeholder = placeholder;
        nolCardNumberField.text = cardNumber;
        
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            nolCardNumberFieldLabel.alpha = 1.0;
            nolCardNumberField.alpha = 1.0;
        } completion:^(BOOL finished){
            
        }];
    }];
}

- (void)alternateNotificationLabelLanguage
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    int usageCount = [[appDelegate.dataController readProperty:@"runCount"] intValue];
    
    if ( usageCount <= 3 )
    {
        if ( displayedNotificationIsEnglish )
        {
            displayedNotificationIsEnglish = NO;
            notificationPanelLabel.text = @"تم اختيار المحطة وفقاً لموقعك الحالي.";
            
            long double delayInSeconds = 3.5;
            
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    notificationPanel.frame = CGRectMake(0, -rashidiyaDirectionButton.frame.size.height - 40, 320, rashidiyaDirectionButton.frame.size.height + 20);
                } completion:^(BOOL finished){
                    
                }];
            });
        }
        else
        {
            displayedNotificationIsEnglish = YES;
            notificationPanelLabel.text = @"Station auto-selected based on your current location.";
        }
        
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            notificationPanel.frame = CGRectMake(0, 0, 320, rashidiyaDirectionButton.frame.size.height + 20);
        } completion:^(BOOL finished){
            
        }];
    }
}

- (void)alternateHelpLabelLanguage
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        helpLabel_selection.alpha = 0.0;
    } completion:^(BOOL finished){
        stationList.hidden = YES;
        NSIndexPath *targetIndexPath;
        
        if ( isOnTrain )
        {
            targetIndexPath = destinationIndexPath;
        }
        else
        {
            targetIndexPath = selectedIndexPath;
        }
        
        if ( [appDelegate.direction isEqualToString:@"Rashidiya"] || [appDelegate.direction isEqualToString:@"JebelAli"] )
        {
            if ( displayedStationInfoIsEnglish )
            {
                displayedStationInfoIsEnglish = NO;
                helpLabel_selection.text = [appDelegate.stationList_red_names_ar objectAtIndex:targetIndexPath.row];
            }
            else
            {
                displayedStationInfoIsEnglish = YES;
                helpLabel_selection.text = [appDelegate.stationList_red_names_en objectAtIndex:targetIndexPath.row];
            }
        }
        else
        {
            if ( displayedStationInfoIsEnglish )
            {
                displayedStationInfoIsEnglish = NO;
                helpLabel_selection.text = [appDelegate.stationList_green_names_ar objectAtIndex:targetIndexPath.row];
            }
            else
            {
                displayedStationInfoIsEnglish = YES;
                helpLabel_selection.text = [appDelegate.stationList_green_names_en objectAtIndex:targetIndexPath.row];
            }
        }
        
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            helpLabel_selection.alpha = 1.0;
        } completion:^(BOOL finished){
            
        }];
    }];
}

- (void)alternateTimingLabelLanguage
{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *date = [NSDate date];
    
    NSDateComponents *currentDatecomponents = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:date];
    NSInteger currentHour = [currentDatecomponents hour];
    int currentSeconds = [date timeIntervalSinceReferenceDate];
    int ETASeconds = [ETA timeIntervalSinceReferenceDate];
    int timeOnPlatform = TIME_ON_PLATFORM;
    
    // Waits at interchange stations are different.
    if ( [appDelegate.direction isEqualToString:@"Rashidiya"] || [appDelegate.direction isEqualToString:@"JebelAli"] )
    {
        if ( selectedIndexPath.row == 7 || selectedIndexPath.row == 8 )
        {
            timeOnPlatform = TIME_ON_PLATFORM_INTER_RED;
        }
    }
    else
    {
        if ( selectedIndexPath.row == 9 || selectedIndexPath.row == 15 )
        {
            timeOnPlatform = TIME_ON_PLATFORM_INTER_GREEN;
        }
    }
    
    //========================================
    
    if ( currentHour == 0 ) // 24-hour format fix.
    {
        currentSeconds -= 86400;
    }
    
    if ( currentHour < 5 ) // 24-hour format fix.
    {
        // Because NSDate uses UTC time, sometimes the current date is before 00:00 am and the ETA is after it.
        // This messes up the calculations. The solution is to notch up the ETA value by 24 hours.
        ETASeconds += 86400;
    }
    
    int timeLeftInSeconds = abs(ETASeconds - currentSeconds);
    int timeLeftInMinutes = (timeLeftInSeconds + 59) / 60;
    
    NSString *displayString = [NSString stringWithFormat:@"%d", timeLeftInMinutes];
    
    if ( displayedTimeIsEnglish )
    {
        displayedTimeIsEnglish = NO;
        
        if ( currentSeconds >= ETASeconds + TIME_FROM_ANNOUNCEMENT )
        {
            onTrainButton.hidden = NO;
            displayString = @"القطار على الرصيف";
            secondsToDeparture = TIME_FROM_ANNOUNCEMENT + timeOnPlatform - (currentSeconds - ETASeconds);
            
            if ( secondsToDeparture >= 0 ) // Don't want negative numbers showing up.
            {
                countdownLabel.text = [NSString stringWithFormat:@"%d", secondsToDeparture];
            }
            
            [onTrainButton setTitle:@"أنا على متن القطار" forState:UIControlStateNormal];
            
            [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                countdownLabel.frame = CGRectMake(0, (screenBounds.size.height / 2) - 60, 320, 21);
                helpLabel_ETA.frame = CGRectMake(0, (screenBounds.size.height / 2) + 60, 320, 65);
                helpLabel_ETA.alpha = 0.0;
                countdownLabel.alpha = 1.0;
                onTrainButton.alpha = 1.0;
            } completion:^(BOOL finished){
                
            }];
            
            if ( !countdownStarted )
            {
                countdownStarted = YES;
                timer_countdown = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countdownToDeparture) userInfo:nil repeats:YES]; // Begin countdown.
            }
            
            if ( !timer_nextTrainFetch )
            {
                timer_nextTrainFetch = [NSTimer scheduledTimerWithTimeInterval:secondsToDeparture + 18 target:self selector:@selector(fetchTrainTiming) userInfo:nil repeats:NO]; // How long the train waits on the platform.
            }
        }
        else if ( currentSeconds >= (ETASeconds - 20) && currentSeconds < ETASeconds + TIME_FROM_ANNOUNCEMENT )
        {
            displayString = @"القطار يقترب من المحطة";
        }
        else
        {
            if ( isLastTrain )
            {
                [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    countdownLabel.text = @"آخر قطار!";
                    countdownLabel.frame = CGRectMake(0, (screenBounds.size.height / 2) - 60, 320, 21);
                    countdownLabel.alpha = 1.0;
                } completion:^(BOOL finished){
                    
                }];
            }
            
            if ( timeLeftInMinutes == 1 )
            {
                displayString = [NSString stringWithFormat:@"القطار القادم\n%@ دقيقة", [appDelegate westernToArabicNumerals:displayString]];
            }
            else
            {
                displayString = [NSString stringWithFormat:@"القطار القادم\n%@ دقائق", [appDelegate westernToArabicNumerals:displayString]];
            }
        }
    }
    else
    {
        displayedTimeIsEnglish = YES;
        
        if ( currentSeconds >= ETASeconds + TIME_FROM_ANNOUNCEMENT )
        {
            onTrainButton.hidden = NO;
            displayString = @"Train is on the platform";
            secondsToDeparture = TIME_FROM_ANNOUNCEMENT + TIME_ON_PLATFORM - (currentSeconds - ETASeconds);
            
            if ( secondsToDeparture >= 0 )
            {
                countdownLabel.text = [NSString stringWithFormat:@"%d", secondsToDeparture];
            }
            
            [onTrainButton setTitle:@"I'm on the train" forState:UIControlStateNormal];
            
            [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                countdownLabel.frame = CGRectMake(0, (screenBounds.size.height / 2) - 60, 320, 21);
                helpLabel_ETA.frame = CGRectMake(0, (screenBounds.size.height / 2) + 60, 320, 65);
                helpLabel_ETA.alpha = 0.0;
                countdownLabel.alpha = 1.0;
                onTrainButton.alpha = 1.0;
            } completion:^(BOOL finished){
                
            }];
            
            if ( !countdownStarted )
            {
                countdownStarted = YES;
                timer_countdown = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countdownToDeparture) userInfo:nil repeats:YES]; // Begin countdown.
            }
            
            if ( !timer_nextTrainFetch )
            {
                timer_nextTrainFetch = [NSTimer scheduledTimerWithTimeInterval:secondsToDeparture + 18 target:self selector:@selector(fetchTrainTiming) userInfo:nil repeats:NO]; // How long the train waits on the platform.
            }
        }
        else if ( currentSeconds >= (ETASeconds - 20) && currentSeconds < ETASeconds + TIME_FROM_ANNOUNCEMENT )
        {
            displayString = @"Train entering station";
        }
        else
        {
            if ( isLastTrain )
            {
                [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    countdownLabel.text = @"Last train!";
                    countdownLabel.frame = CGRectMake(0, (screenBounds.size.height / 2) - 60, 320, 21);
                    countdownLabel.alpha = 1.0;
                } completion:^(BOOL finished){
                    
                }];
            }
            
            if ( timeLeftInMinutes == 1 )
            {
                displayString = [NSString stringWithFormat:@"Next Train\n1 min"];
            }
            else
            {
                displayString = [NSString stringWithFormat:@"Next Train\n%d mins", timeLeftInMinutes];
            }
        }
    }
    
    nextTrainLabel.text = displayString;
    
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        nextTrainLabel.frame = CGRectMake(20, (screenBounds.size.height / 2) - 20, 280, 65);
        nextTrainLabel.alpha = 1.0;
    } completion:^(BOOL finished){
        
    }];
}

- (void)fetchTrainTiming
{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    countdownStarted = NO;
    [timer_nextTrainFetch invalidate];
    [timer_nextTrainLabel invalidate];
    [timer_countdown invalidate];
    timer_nextTrainFetch = nil;
    timer_nextTrainLabel = nil;
    timer_countdown = nil;
    
    if ( stationIsSelected )
    {
        [appDelegate.strobeLight activateStrobeLight];
        
        NSArray *stationTimings;
        
        NSDate *date = [NSDate date];
        
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *currentDateComponents = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:date];
        NSInteger currentHour = [currentDateComponents hour];
        NSInteger currentMinute = [currentDateComponents minute];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"EEEE"]; // For checking what day of the week it is.
        
        NSString *weekDay = [dateFormatter stringFromDate:date];
        int lastIndex = stationTimings.count; // Index of the last train timing.
        
        if ( [appDelegate.direction isEqualToString:@"Rashidiya"] )
        {
            if ( [weekDay isEqualToString:@"Saturday"] && currentHour >= 1 && currentMinute > 4 )  // Logic fix for when the clock passes 12 am.
            {
                stationTimings = [appDelegate.stationTimings_Rashidiya_saturday objectAtIndex:selectedIndexPath.row];
                lastIndex = stationTimings.count - 1; // Index of the last train timing.
            }
            else if ( [weekDay isEqualToString:@"Friday"] && currentHour >= 1 && currentMinute > 8 )
            {
                stationTimings = [appDelegate.stationTimings_Rashidiya_friday objectAtIndex:selectedIndexPath.row];
                lastIndex = stationTimings.count - 1;
            }
            else
            {
                stationTimings = [appDelegate.stationTimings_Rashidiya_weekDays objectAtIndex:selectedIndexPath.row];
                
                if ( [weekDay isEqualToString:@"Thursday"] )
                {
                    lastIndex = stationTimings.count - 1;
                }
                else
                {
                    lastIndex = stationTimings.count - 7;
                }
            }
        }
        else if ( [appDelegate.direction isEqualToString:@"JebelAli"] )
        {
            if ( [weekDay isEqualToString:@"Saturday"] && currentHour >= 1 && currentMinute > 3 )
            {
                stationTimings = [appDelegate.stationTimings_JebelAli_saturday objectAtIndex:selectedIndexPath.row];
                lastIndex = stationTimings.count - 1;
            }
            else if ( [weekDay isEqualToString:@"Friday"] && currentHour >= 1 && currentMinute > 9 )
            {
                stationTimings = [appDelegate.stationTimings_JebelAli_friday objectAtIndex:selectedIndexPath.row];
                lastIndex = stationTimings.count - 1;
            }
            else
            {
                stationTimings = [appDelegate.stationTimings_JebelAli_weekDays objectAtIndex:selectedIndexPath.row];
                
                if ( [weekDay isEqualToString:@"Thursday"] )
                {
                    lastIndex = stationTimings.count - 1;
                }
                else
                {
                    lastIndex = stationTimings.count - 7;
                }
            }
        }
        else if ( [appDelegate.direction isEqualToString:@"Etisalat"] )
        {
            if ( [weekDay isEqualToString:@"Saturday"] && currentHour >= 1 )
            {
                stationTimings = [appDelegate.stationTimings_Etisalat_weekDays objectAtIndex:selectedIndexPath.row];
                lastIndex = stationTimings.count - 8;
            }
            else if ( [weekDay isEqualToString:@"Friday"] && currentHour >= 1 && currentMinute > 2 )
            {
                stationTimings = [appDelegate.stationTimings_Etisalat_friday objectAtIndex:selectedIndexPath.row];
                lastIndex = stationTimings.count - 1;
            }
            else
            {
                stationTimings = [appDelegate.stationTimings_Etisalat_weekDays objectAtIndex:selectedIndexPath.row];
                
                if ( [weekDay isEqualToString:@"Thursday"] )
                {
                    lastIndex = stationTimings.count - 1;
                }
                else
                {
                    lastIndex = stationTimings.count - 8;
                }
            }
        }
        else
        {
            if ( [weekDay isEqualToString:@"Saturday"] && currentHour >= 1 && currentMinute > 4 )
            {
                stationTimings = [appDelegate.stationTimings_Creek_weekDays objectAtIndex:selectedIndexPath.row];
                lastIndex = stationTimings.count - 8;
            }
            else if ( [weekDay isEqualToString:@"Friday"] && currentHour >= 1 && currentMinute > 6 )
            {
                stationTimings = [appDelegate.stationTimings_Creek_friday objectAtIndex:selectedIndexPath.row];
                lastIndex = stationTimings.count - 1;
            }
            else
            {
                stationTimings = [appDelegate.stationTimings_Creek_weekDays objectAtIndex:selectedIndexPath.row];
                
                if ( [weekDay isEqualToString:@"Thursday"] )
                {
                    lastIndex = stationTimings.count - 1;
                }
                else
                {
                    lastIndex = stationTimings.count - 8;
                }
            }
        }
        
        for ( int i = 0; i < stationTimings.count; i++ )
        {
            [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            NSString *dateString = [dateFormatter stringFromDate:date];
            NSString *time = [stationTimings objectAtIndex:i];
            trainServiceRunning = YES;
            isLastTrain = NO;
            
            if ( i == lastIndex )
            {
                isLastTrain = YES;
            }
            else if ( i > lastIndex )
            {
                trainServiceRunning = NO;
                break;
            }
            
            NSString *finalString = [NSString stringWithFormat:@"%@ %@ +0400", dateString, time];
            
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ssZZZ"];
            ETA = [dateFormatter dateFromString:finalString];
            
            NSDateComponents *ETAComponents = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:ETA];
            NSInteger ETAHour = [ETAComponents hour];
            NSInteger ETAMinute = [ETAComponents minute];
            
            if ( ETAHour == 0 ) // Fucks up the conditions otherwise...
            {
                ETAHour = 24;
            }
            
            if ( currentHour == 0 )
            {
                currentHour = 24;
            }
            
            if ( (ETAHour > currentHour) || (ETAHour == currentHour && ETAMinute >= currentMinute) )
            {
                secondsToDeparture = TIME_ON_PLATFORM;
                trainServiceRunning = YES;
                
                break;
            }
        }
        
        if ( !trainServiceRunning )
        {
            [appDelegate.strobeLight negativeStrobeLight];
            
            nextTrainLabel.text = @"لا توجد معلومات\nNo information";
            
            [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                nextTrainLabel.frame = CGRectMake(20, (screenBounds.size.height / 2) - 10, 280, 65);
                countdownLabel.frame = CGRectMake(0, (screenBounds.size.height / 2) - 70, 320, 21);
                helpLabel_distance.frame = CGRectMake(0, screenBounds.size.height / 2, 320, 12);
                helpLabel_ETA.frame = CGRectMake(0, (screenBounds.size.height / 2) + 60, 320, 14);
                helpLabel_ETA.alpha = 0.0;
                helpLabel_distance.alpha = 0.0;
                countdownLabel.alpha = 0.0;
                onTrainButton.alpha = 0.0;
                nextTrainLabel.alpha = 1.0;
            } completion:^(BOOL finished){
                onTrainButton.hidden = YES;
            }];
            
            return;
        }
        
        NSDateComponents *ETAComponents = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:ETA];
        NSInteger ETAHour = [ETAComponents hour];
        NSInteger ETAMinute = [ETAComponents minute];
        NSString *timePeriod = @"am";
        timeOfArrival = [NSString stringWithFormat:@"%02d:%02d %@", ETAHour, ETAMinute, timePeriod];
        
        if ( ETAHour > 12 ) // Convert back to 12-hour format for display purposes.
        {
            ETAHour -= 12;
            timePeriod = @"pm";
            timeOfArrival = [NSString stringWithFormat:@"%02d:%02d %@", ETAHour, ETAMinute, timePeriod];
        }
        
        if ( ETAHour >= 12 ) // This needs its own fix for the case of 12 pm.
        {
            timePeriod = @"pm";
            timeOfArrival = [NSString stringWithFormat:@"%02d:%02d %@", ETAHour, ETAMinute, timePeriod];
        }
        
        if ( ETAHour == 0 )
        {
            ETAHour = 12;
            timePeriod = @"am";
            timeOfArrival = [NSString stringWithFormat:@"%02d:%02d %@", ETAHour, ETAMinute, timePeriod];
        }
        
        [self updateDistanceLabel];
        
        helpLabel_ETA.text = [NSString stringWithFormat:@"ETA %@", timeOfArrival];
        onTrainButton.alpha = 0.0;
        onTrainButton.hidden = YES;
        
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            countdownLabel.frame = CGRectMake(0, (screenBounds.size.height / 2) - 70, 320, 21);
            helpLabel_distance.frame = CGRectMake(0, screenBounds.size.height - 45, 320, 12);
            helpLabel_ETA.frame = CGRectMake(0, (screenBounds.size.height / 2) + 70, 320, 14);
            helpLabel_ETA.alpha = 1.0;
            helpLabel_distance.alpha = 1.0;
            countdownLabel.alpha = 0.0;
        } completion:^(BOOL finished){
            
        }];
        
        [self alternateTimingLabelLanguage];
        
        if ( !timer_nextTrainLabel )
        {
            timer_nextTrainLabel = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(alternateTimingLabelLanguage) userInfo:nil repeats:YES];
        }
        
        [appDelegate.strobeLight deactivateStrobeLight];
    }
}

- (void)fetchNearbyStation
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [dataRequest clearDelegatesAndCancel]; // Cancel any previously running requests.
    fetchingNearbyStation = YES;
    
    // Get today's date.
    NSDate *today = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *currentDatecomponents = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:today];
    NSInteger currentYear = [currentDatecomponents year];
    NSInteger currentMonth = [currentDatecomponents month];
    NSInteger currentDay = [currentDatecomponents day];
    
    NSString *urlString = @"https://api.foursquare.com/v2/venues/search?"; // 4sq requires this first param as v=yyyymmdd.
    
    // Put it together.
    urlString = [urlString stringByAppendingFormat:@"v=%d%02d%02d", currentYear, currentMonth, currentDay];
    urlString = [urlString stringByAppendingFormat:@"&client_id=ZHK22TFDORRHHDKGN4L40EQKGUBJEXM3F2FPGS14JCM1MKPE"];
    urlString = [urlString stringByAppendingFormat:@"&client_secret=PMQDW1TFREX5P2UJU2G0C42IIT01SQBR52YOHFN2TCW3S2RK"];
    urlString = [urlString stringByAppendingFormat:@"&intent=browse"];
    urlString = [urlString stringByAppendingFormat:@"&radius=800"];
    urlString = [urlString stringByAppendingFormat:@"&ll=%f,%f", appDelegate.currentLocation.latitude, appDelegate.currentLocation.longitude]; // The ordering is important!!!
    
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    dataRequest = [ASIFormDataRequest requestWithURL:url];
    __weak ASIFormDataRequest *wrequest = dataRequest;
    
    [wrequest setRequestMethod:@"GET"];
    [wrequest setCompletionBlock:^{
        NSError *jsonError;
        responseData = [NSJSONSerialization JSONObjectWithData:[wrequest.responseString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:&jsonError];
        BOOL shouldBreak = NO;
        NSLog(@"%@", responseData);
        for ( NSMutableDictionary *venue in [[responseData objectForKey:@"response"] objectForKey:@"venues"] ) // Save any train stations.
        {
            for ( NSMutableDictionary *categories in [venue objectForKey:@"categories"] )
            {
                NSString *catName = [categories objectForKey:@"shortName"];
                
                if ( [catName isEqualToString:@"Train Station"] || [catName isEqualToString:@"Light Rail"] || [catName isEqualToString:@"Subway"] || [catName isEqualToString:@"Building"] ) // "Building" is for the NHT station.
                {
                    nearestStationData = venue;
                    
                    NSString *stationName = [nearestStationData objectForKey:@"name"];
                    // Fix & remove unecessary keywords.
                    stationName = [stationName stringByReplacingOccurrencesOfString:@"metro" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, stationName.length)];
                    stationName = [stationName stringByReplacingOccurrencesOfString:@"station" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, stationName.length)];
                    stationName = [stationName stringByReplacingOccurrencesOfString:@"Center" withString:@"Centre" options:NSCaseInsensitiveSearch range:NSMakeRange(0, stationName.length)];
                    stationName = [stationName stringByReplacingOccurrencesOfString:@"|" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, stationName.length)];
                    stationName = [stationName stringByReplacingOccurrencesOfString:@"and" withString:@"&" options:NSCaseInsensitiveSearch range:NSMakeRange(0, stationName.length)];
                    stationName = [stationName stringByReplacingOccurrencesOfString:@"Khalid Bin Al Waleed" withString:@"BurJuman" options:NSCaseInsensitiveSearch range:NSMakeRange(0, stationName.length)];
                    
                    NSCharacterSet *notAllowedChars = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ&"] invertedSet];
                    stationName = [[stationName componentsSeparatedByCharactersInSet:notAllowedChars] componentsJoinedByString:@" "];
                    stationName = [stationName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                    
                    // Special case fixes.
                    if ( [stationName rangeOfString:@"Jumeirah Lake Towers" options:NSCaseInsensitiveSearch].location != NSNotFound ) 
                    {
                        stationName = @"Jumeirah Lakes Towers";
                    }
                    
                    if ( [stationName rangeOfString:@"Airport Terminal 3" options:NSCaseInsensitiveSearch].location != NSNotFound )
                    {
                        stationName = @"Airport Terminal 3";
                    }
                    
                    if ( [stationName rangeOfString:@"Rashidya" options:NSCaseInsensitiveSearch].location != NSNotFound )
                    {
                        stationName = @"Rashidiya";
                    }
                    
                    for (int i = 0; i < appDelegate.stationList_red_names_en.count; i++)
                    {
                        if ( [[appDelegate.stationList_red_names_en objectAtIndex:i] rangeOfString:stationName options:NSCaseInsensitiveSearch].location != NSNotFound )
                        {
                            shouldBreak = YES; // To break the outer loops.
                            stationAutoselected = YES;
                            selectedIndexPath = [NSIndexPath indexPathForRow:i inSection:0];
                            
                            if ( directionIsSelected )
                            {
                                [stationList selectRowAtIndexPath:selectedIndexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
                                [[stationList delegate] tableView:stationList didSelectRowAtIndexPath:selectedIndexPath];
                                
                                [self alternateNotificationLabelLanguage];
                                timer_notification = [NSTimer scheduledTimerWithTimeInterval:4.0 target:self selector:@selector(alternateNotificationLabelLanguage) userInfo:nil repeats:NO];
                            }
                            
                            break;
                        }
                    }
                    
                    if ( !shouldBreak )
                    {
                        for (int i = 0; i < appDelegate.stationList_green_names_en.count; i++)
                        {
                            if ( [[appDelegate.stationList_green_names_en objectAtIndex:i] rangeOfString:stationName options:NSCaseInsensitiveSearch].location != NSNotFound )
                            {
                                shouldBreak = YES; // To break the outer loops.
                                stationAutoselected = YES;
                                selectedIndexPath = [NSIndexPath indexPathForRow:i inSection:0];
                                
                                if ( directionIsSelected )
                                {
                                    [stationList selectRowAtIndexPath:selectedIndexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
                                    [[stationList delegate] tableView:stationList didSelectRowAtIndexPath:selectedIndexPath];
                                    
                                    [self alternateNotificationLabelLanguage];
                                    timer_notification = [NSTimer scheduledTimerWithTimeInterval:4.0 target:self selector:@selector(alternateNotificationLabelLanguage) userInfo:nil repeats:NO];
                                }
                                
                                break;
                            }
                        }
                    }
                }
                
                if ( shouldBreak )
                {
                    break;
                }
            }
            
            if ( shouldBreak )
            {
                break;
            }
        }
        
        fetchingNearbyStation = NO;
        shouldAutoselectStation = NO;
        [appDelegate.strobeLight deactivateStrobeLight];
        
        if ( nolCardNumber.length > 0 ) // Kickstart this.
        {
            [self checkCardBalance:nil];
        }
    }];
    [wrequest setFailedBlock:^{
        [appDelegate.strobeLight negativeStrobeLight];
        
        NSError *error = [dataRequest error];
        NSLog(@"%@", error);
    }];
    [wrequest startAsynchronous];
}

- (void)dispalayDestinationETA
{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *date = [NSDate date];
    
    NSDateComponents *currentDatecomponents = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:date];
    NSInteger currentHour = [currentDatecomponents hour];
    int currentSeconds = [date timeIntervalSinceReferenceDate];
    int ETASeconds = [ETADestination timeIntervalSinceReferenceDate];
    int timeOnPlatform = TIME_ON_PLATFORM;
    
    // Waits at interchange stations are different.
    if ( [appDelegate.direction isEqualToString:@"Rashidiya"] || [appDelegate.direction isEqualToString:@"JebelAli"] )
    {
        if ( selectedIndexPath.row == 7 || selectedIndexPath.row == 8 )
        {
            timeOnPlatform = TIME_ON_PLATFORM_INTER_RED;
        }
    }
    else
    {
        if ( selectedIndexPath.row == 9 || selectedIndexPath.row == 15 )
        {
            timeOnPlatform = TIME_ON_PLATFORM_INTER_GREEN;
        }
    }
    //========================================
    
    if ( currentHour == 0 ) // 24-hour format fix.
    {
        currentSeconds = currentSeconds - 86400;
    }
    
    if ( currentHour < 5 ) // 24-hour format fix.
    {
        // Because NSDate uses UTC time, sometimes the current date is before 00:00 am and the ETA is after it.
        // This messes up the calculations. The solution is to notch up the ETA VALUE by 24 hours.
        ETASeconds = ETASeconds + 86400;
    }
    
    int timeLeftInSeconds = abs(ETASeconds - currentSeconds);
    int timeLeftInMinutes = (timeLeftInSeconds + 59) / 60;
    
    NSString *displayString = [NSString stringWithFormat:@"%d", timeLeftInMinutes];
    
    if ( displayedTimeIsEnglish )
    {
        displayedTimeIsEnglish = NO;
        
        if ( currentSeconds >= ETASeconds + TIME_FROM_ANNOUNCEMENT )
        {
            displayString = @"انزل من القطار";
            secondsToDeparture = TIME_FROM_ANNOUNCEMENT + timeOnPlatform - (currentSeconds - ETASeconds);
            
            if ( secondsToDeparture >= 0 ) // Don't want negative numbers showing up.
            {
                countdownLabel.text = [NSString stringWithFormat:@"%d", secondsToDeparture];
            }
            
            [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                helpLabel_ETA.frame = CGRectMake(0, (screenBounds.size.height / 2) + 60, 320, 65);
                helpLabel_ETA.alpha = 0.0;
            } completion:^(BOOL finished){
                
            }];
            
            if ( !countdownStarted )
            {
                countdownStarted = YES;
                timer_countdown = [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(setDirection:) userInfo:nil repeats:NO]; // Begin countdown.
            }
        }
        else if ( currentSeconds >= (ETASeconds - 20) && currentSeconds < ETASeconds + TIME_FROM_ANNOUNCEMENT )
        {
            displayString = @"المحطة القادمة هي محطتنا";
        }
        else
        {
            if ( timeLeftInMinutes == 1 )
            {
                displayString = [NSString stringWithFormat:@"سنصل بعد\n%@ دقيقة", [appDelegate westernToArabicNumerals:displayString]];
            }
            else
            {
                displayString = [NSString stringWithFormat:@"سنصل بعد\n%@ دقائق", [appDelegate westernToArabicNumerals:displayString]];
            }
        }
    }
    else
    {
        displayedTimeIsEnglish = YES;
        
        if ( currentSeconds >= ETASeconds + TIME_FROM_ANNOUNCEMENT )
        {
            displayString = @"Get off the train";
            secondsToDeparture = TIME_FROM_ANNOUNCEMENT + timeOnPlatform - (currentSeconds - ETASeconds);
            
            if ( secondsToDeparture >= 0 ) // Don't want negative numbers showing up.
            {
                countdownLabel.text = [NSString stringWithFormat:@"%d", secondsToDeparture];
            }
            
            [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                helpLabel_ETA.frame = CGRectMake(0, (screenBounds.size.height / 2) + 60, 320, 65);
                helpLabel_ETA.alpha = 0.0;
            } completion:^(BOOL finished){
                
            }];
            
            if ( !countdownStarted )
            {
                countdownStarted = YES;
                timer_countdown = [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(setDirection:) userInfo:nil repeats:NO];
            }
        }
        else if ( currentSeconds >= (ETASeconds - 20) && currentSeconds < ETASeconds + TIME_FROM_ANNOUNCEMENT )
        {
            displayString = @"This station is our stop";
        }
        else
        {
            if ( timeLeftInMinutes == 1 )
            {
                displayString = [NSString stringWithFormat:@"We'll be arriving in\n1 min"];
            }
            else
            {
                displayString = [NSString stringWithFormat:@"We'll be arriving in\n%d mins", timeLeftInMinutes];
            }
        }
    }
    
    nextTrainLabel.text = displayString;
    
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        nextTrainLabel.frame = CGRectMake(20, (screenBounds.size.height / 2) - 20, 280, 65);
        nextTrainLabel.alpha = 1.0;
    } completion:^(BOOL finished){
        
    }];
}

- (void)updateDistanceLabel
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSArray *stationCoordinates;
    NSIndexPath *targetIndexPath;
    
    if ( isOnTrain )
    {
        targetIndexPath = destinationIndexPath;
    }
    else
    {
        targetIndexPath = selectedIndexPath;
    }
    
    if ( [appDelegate.direction isEqualToString:@"Rashidiya"] || [appDelegate.direction isEqualToString:@"JebelAli"] )
    {
        stationCoordinates = [appDelegate.stationCoordinates_red objectAtIndex:targetIndexPath.row];
    }
    else
    {
        stationCoordinates = [appDelegate.stationCoordinates_green objectAtIndex:targetIndexPath.row];
    }
    
    CLLocation *currentLocation = [[CLLocation alloc] initWithLatitude:appDelegate.currentLocation.latitude longitude:appDelegate.currentLocation.longitude];
    CLLocation *stationLocation = [[CLLocation alloc] initWithLatitude:[[stationCoordinates objectAtIndex:0] doubleValue] longitude:[[stationCoordinates objectAtIndex:1] doubleValue]];
    
    CLLocationDistance distance = [currentLocation distanceFromLocation:stationLocation];
    NSString *distanceUnit = @"feet";
    
    if ( distance >= 3280.84 )
    {
        distanceUnit = @"km";
        distance = distance / 3280.84;
    }
    
    int roundedDistance = lroundf(distance);
    
    NSNumber *value = [NSNumber numberWithInt:roundedDistance];
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [numberFormatter setGroupingSeparator:@","];
    
    NSString *message = [NSString stringWithFormat:@"You're %@ %@ from the station", [numberFormatter stringForObjectValue:value], distanceUnit];
    
    if ( distance <= 50 && ![distanceUnit isEqualToString:@"km"] )
    {
        message = @"You're in the station";
    }
    
    helpLabel_distance.text = message;
}

- (void)countdownToDeparture
{
    if ( secondsToDeparture > 0 )
    {
        secondsToDeparture--;
    }
    
    if ( secondsToDeparture >= 0 )
    {
        
        countdownLabel.text = [NSString stringWithFormat:@"%d", secondsToDeparture];
    }
}

- (void)showSocialProfiles:(id)sender
{
    UIButton *button = (UIButton *)sender;
    
    NSString *name = @"";
    NSMutableArray *buttons = [[NSMutableArray alloc] initWithObjects:@"Facebook", @"Twitter", @"Instagram", nil];
    
    if ( button.tag == 0 )
    {
        name = @"Ali";
        [buttons addObject:@"Blog"];
    }
    else if ( button.tag == 1 )
    {
        name = @"Diana";
        [buttons removeObject:@"Facebook"];
    }
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:[NSString stringWithFormat:@"%@'s Social Profiles", name]
                                                             delegate:self
                                                    cancelButtonTitle:nil
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:nil];
    
    for (int i = 0; i < buttons.count; i++)
    {
        [actionSheet addButtonWithTitle:[buttons objectAtIndex:i]];
    }
    
    [actionSheet addButtonWithTitle:@"Cancel"];
    actionSheet.cancelButtonIndex = buttons.count;
    
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    actionSheet.tag = button.tag;
    [actionSheet showFromRect:self.view.frame inView:self.view animated:YES];
}

- (void)embarkTrain
{
    [Sound soundEffect:3]; // Play the selection sound.
    
    isOnTrain = YES;
    
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        onTrainButton.alpha = 0.0;
    } completion:^(BOOL finished){
        onTrainButton.hidden = YES;
        
        [self dismissDirectionList];
    }];
}

- (void)callRTA
{
    [Sound soundEffect:3]; // Play the selection sound.
    
    if ( ![[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://8009090"]] )
    {
        UIAlertView *logoutAlert = [[UIAlertView alloc]
                                    initWithTitle:@"Error"
                                    message:@"Your device can't make phone calls." delegate:self
                                    cancelButtonTitle:nil
                                    otherButtonTitles:@"Okay", nil];
        [logoutAlert show];
    }
}

- (void)rateApp
{
    [Sound soundEffect:3]; // Play the selection sound.
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://phobos.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=%@&mt=8", APP_ID]];
    [[UIApplication sharedApplication] openURL:url];
}

- (void)changeCardType:(id)sender
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    UIButton *button = (UIButton *)sender;
    NSString *overlayLabelText = @"";
    
    UILabel *cardTypeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, button.frame.size.width, button.frame.size.height)];
    cardTypeLabel.textColor = [UIColor colorWithRed:22/255.0 green:60/255.0 blue:93/255.0 alpha:1.0];
    cardTypeLabel.textAlignment = NSTextAlignmentCenter;
    cardTypeLabel.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:MAIN_FONT_SIZE];
    cardTypeLabel.numberOfLines = 1;
    cardTypeLabel.backgroundColor = [UIColor clearColor];
    cardTypeLabel.opaque = YES;
    
    switch ( button.tag )
    {
        case 0:
            [appDelegate.dataController writeValue:@"gold" forProperty:@"cardType"];
            overlayLabelText = @"Gold";
            break;
            
        case 1:
            [appDelegate.dataController writeValue:@"silver" forProperty:@"cardType"];
            overlayLabelText = @"Silver";
            break;
            
        case 2:
            [appDelegate.dataController writeValue:@"blue" forProperty:@"cardType"];
            overlayLabelText = @"Blue";
            break;
            
        case 3:
            [appDelegate.dataController writeValue:@"red" forProperty:@"cardType"];
            overlayLabelText = @"Red";
            break;
            
        default:
            break;
    }
    
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        cardSelectionFrame.alpha = 0.0;
        cardSelectionOverlay.alpha = 0.0;
    } completion:^(BOOL finished){
        cardTypeLabel.text = overlayLabelText;
        [button addSubview:cardSelectionFrame];
        [button addSubview:cardSelectionOverlay];
        [cardSelectionOverlay addSubview:cardTypeLabel];
        
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            cardSelectionFrame.alpha = 1.0;
            cardSelectionOverlay.alpha = 1.0;
        } completion:^(BOOL finished){
            [UIView animateWithDuration:0.2 delay:2 options:UIViewAnimationOptionCurveEaseOut animations:^{
                cardSelectionOverlay.alpha = 0.0;
            } completion:^(BOOL finished){
                [cardTypeLabel removeFromSuperview];
            }];
        }];
    }];
    
    [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        button.transform = CGAffineTransformMakeRotation(-0.13962634);
    } completion:^(BOOL finished){
        [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            button.transform = CGAffineTransformMakeRotation(0.13962634);
        } completion:^(BOOL finished){
            [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                button.transform = CGAffineTransformMakeRotation(-0.0698131701);
            } completion:^(BOOL finished){
                [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    button.transform = CGAffineTransformMakeRotation(0);
                } completion:^(BOOL finished){
                    
                }];
            }];
        }];
    }];
}

- (void)checkCardBalance:(id)sender
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [nolCardNumberField resignFirstResponder];
    
    if  ( sender && [appDelegate.dataController readProperty:@"cardBalance"].length > 0 )
    {
        NSString *balance = [appDelegate.dataController readProperty:@"cardBalance"];
        NSString *balanceMessage = [NSString stringWithFormat:@"رصيدك الحالي هو %@ درهم\n\nYour current balance is AED %@", [appDelegate westernToArabicNumerals:balance], balance];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:balanceMessage delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        [alert show];
    }
    else if ( nolCardNumber.length > 0 )
    {
        [appDelegate.strobeLight activateStrobeLight];
        
        [dataRequest clearDelegatesAndCancel];
        
        nolCardNumberField.enabled = NO;
        checkBalanceButton.enabled = NO;
        
        NSString *cardNumber = nolCardNumber;
        
        NSCharacterSet *notAllowedChars = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] invertedSet];
        cardNumber = [[cardNumber componentsSeparatedByCharactersInSet:notAllowedChars] componentsJoinedByString:@""];
        cardNumber = [cardNumber stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        
        NSString *urlString = @"http://rta.tacme.com/RTAP2/NolService.svc";
        
        NSURL *url = [NSURL URLWithString:urlString];
        
        dataRequest = [ASIFormDataRequest requestWithURL:url];
        __weak ASIFormDataRequest *wrequest = dataRequest;
        
        NSString *XML = [NSString stringWithFormat:@"<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns=\"http://tempuri.org/\"><soap:Header/><soap:Body><GetNolBalance><NolCardNumber>%@</NolCardNumber><language>ar</language></GetNolBalance></soap:Body></soap:Envelope>", cardNumber];
        [wrequest setPostBody:[[XML dataUsingEncoding:NSUTF8StringEncoding] mutableCopy]];
        
        [wrequest addRequestHeader:@"Content-Type" value:@"text/xml; charset=utf-8;"];
        [wrequest addRequestHeader:@"SOAPAction" value:@"http://tempuri.org/INolService/GetNolBalance"];
        [wrequest setCompletionBlock:^{
            /*UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:wrequest.responseString delegate:Nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
            [alert show];*/
            
            NSString *parsedXML;
            NSScanner *scanner = [NSScanner scannerWithString:wrequest.responseString];
            
            // By default, NSScanner will skip whitespace - we don't want it to skip anything here.
            [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@""]];
            [scanner scanUpToString:@"<GetNolBalanceResult>" intoString:&parsedXML];
            
            parsedXML = [wrequest.responseString stringByReplacingOccurrencesOfString:parsedXML withString:@""];
            parsedXML = [parsedXML stringByReplacingOccurrencesOfString:@"<GetNolBalanceResult>" withString:@""];
            
            scanner = [NSScanner scannerWithString:parsedXML];
            [scanner scanUpToString:@"</GetNolBalanceResult>" intoString:&parsedXML];
            
            if ( parsedXML.length == 0 )
            {
                [appDelegate.strobeLight negativeStrobeLight];
            }
            else
            {
                float balance = [parsedXML doubleValue];
                [[UIApplication sharedApplication] setApplicationIconBadgeNumber:2];
                [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
                
                if ( balance <= 9.0 )
                {
                    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
                    
                    if ( localNotif )
                    {
                        NSString *balanceMessage = [NSString stringWithFormat:@"Your %@ Nol Card's balance is running low (AED %.02f left). Better top it up!", [appDelegate.dataController readProperty:@"cardType"], balance];
                        
                        localNotif.alertBody = balanceMessage;
                        localNotif.alertAction = @"Read Message";
                        localNotif.hasAction = NO;
                        localNotif.applicationIconBadgeNumber = 1;
                        [[UIApplication sharedApplication] presentLocalNotificationNow:localNotif];
                        
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:balanceMessage delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
                        [alert show];
                    }
                }
                else if  ( [appDelegate.dataController readProperty:@"cardBalance"].length == 0 )
                {
                    NSString *balanceString = [NSString stringWithFormat:@"%.02f", balance];
                    NSString *balanceMessage = [NSString stringWithFormat:@"رصيدك الحالي هو %@ درهم\n\nYour current balance is AED %@", [appDelegate westernToArabicNumerals:balanceString], balanceString];
                    
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:balanceMessage delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
                    [alert show];
                }
                
                [appDelegate.dataController writeValue:[NSString stringWithFormat:@"%.02f", balance] forProperty:@"cardBalance"];
            }
            
            [appDelegate.strobeLight deactivateStrobeLight];
            nolCardNumberField.enabled = YES;
            checkBalanceButton.enabled = YES;
        }];
        [wrequest setFailedBlock:^{
            [appDelegate.strobeLight negativeStrobeLight];
            nolCardNumberField.enabled = YES;
            checkBalanceButton.enabled = YES;
            
            NSError *error = [dataRequest error];
            NSLog(@"%@", error);
        }];
        [wrequest startAsynchronous];
    }
}

- (void)saveCardInfo
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [nolCardNumberField resignFirstResponder];
    [appDelegate.dataController writeValue:nolCardNumber forProperty:@"cardNumber"];
}

#pragma mark -
#pragma mark CLLocationManagerDelegate methods

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    appDelegate.currentLocation = newLocation.coordinate;
    
    if ( shouldAutoselectStation && !stationIsSelected && !fetchingNearbyStation )
    {
        [self fetchNearbyStation];
    }
    
    [self updateDistanceLabel];
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if ( status != kCLAuthorizationStatusAuthorized || ![CLLocationManager locationServicesEnabled] )
    {
        [appDelegate.strobeLight negativeStrobeLight];
        appDelegate.currentLocation = CLLocationCoordinate2DMake(9999, 9999);
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [appDelegate.strobeLight negativeStrobeLight];
    appDelegate.currentLocation = CLLocationCoordinate2DMake(9999, 9999);
}

#pragma mark -
#pragma mark UIScrollViewDelegate methods.

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    if ( scrollView.tag == 0 ) // Station list.
    {
        maskLayer_stationList.position = CGPointMake(0, scrollView.contentOffset.y);
    }
    
    [CATransaction commit];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if ( [appDelegate.direction isEqualToString:@"Rashidiya"] || [appDelegate.direction isEqualToString:@"JebelAli"] )
    {
        return appDelegate.stationList_red_names_en.count;
    }
    else
    {
        return appDelegate.stationList_green_names_en.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    static NSString *cellIdentifier = @"ItemCell";
    mapNode = (MapVerticalNodeCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if ( mapNode == nil )
    {
        mapNode = [[MapVerticalNodeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        mapNode.selectionStyle = UITableViewCellSelectionStyleGray;
        mapNode.frame = CGRectMake(0, 0, mapNode.frame.size.width, mapNode.frame.size.height);
    }
    
    if ( [appDelegate.direction isEqualToString:@"Rashidiya"] || [appDelegate.direction isEqualToString:@"JebelAli"] )
    {
        if (indexPath.row == 0)
        {
            mapNode.line_top.hidden = YES;
        }
        else
        {
            mapNode.line_top.hidden = NO;
        }
        
        if ( indexPath.row == appDelegate.stationList_red_names_en.count - 1 )
        {
            mapNode.line_bottom.hidden = YES;
        }
        else
        {
            mapNode.line_bottom.hidden = NO;
        }
        
        mapNode.line_top.image = [[UIImage imageNamed:@"line_red_vertical"] stretchableImageWithLeftCapWidth:4 topCapHeight:4];
        mapNode.line_bottom.image = [[UIImage imageNamed:@"line_red_vertical"] stretchableImageWithLeftCapWidth:4 topCapHeight:4];
        mapNode.stationNameLabel.text = [NSString stringWithFormat:@"%@\n%@", [appDelegate.stationList_red_names_ar objectAtIndex:indexPath.row], [appDelegate.stationList_red_names_en objectAtIndex:indexPath.row]];
        
        if ( indexPath.row == 7 || indexPath.row == 8 )
        {
            if ( indexPath.row == 7 )
            {
                mapNode.stationNumberLabel.text = @"20  18";
            }
            else
            {
                mapNode.stationNumberLabel.text = @"26  19";
            }
            
            mapNode.stationNumberLabel.frame = CGRectMake(20, 2, 63, 23);
            mapNode.node.image = [UIImage imageNamed:@"node_red_change"];
            mapNode.node.frame = CGRectMake(-14, 30, 83, 26);
            mapNode.plane_icon.hidden = YES;
        }
        else
        {
            if ( indexPath.row == 2 || indexPath.row == 3 )
            {
                mapNode.plane_icon.hidden = NO;
            }
            else
            {
                mapNode.plane_icon.hidden = YES;
            }
            
            mapNode.stationNumberLabel.text = [NSString stringWithFormat:@"%@", [appDelegate.stationList_red_numbers objectAtIndex:indexPath.row]];
            mapNode.stationNumberLabel.frame = CGRectMake(0, 2, 36, 23);
            mapNode.node.image = [UIImage imageNamed:@"node_red"];
            mapNode.node.frame = CGRectMake(20, 30, 36, 26);
        }
    }
    else
    {
        if (indexPath.row == 0)
        {
            mapNode.line_top.hidden = YES;
        }
        else
        {
            mapNode.line_top.hidden = NO;
        }
        
        if ( indexPath.row == appDelegate.stationList_green_names_en.count - 1 )
        {
            mapNode.line_bottom.hidden = YES;
        }
        else
        {
            mapNode.line_bottom.hidden = NO;
        }
        
        mapNode.line_top.image = [[UIImage imageNamed:@"line_green_vertical"] stretchableImageWithLeftCapWidth:4 topCapHeight:4];
        mapNode.line_bottom.image = [[UIImage imageNamed:@"line_green_vertical"] stretchableImageWithLeftCapWidth:4 topCapHeight:4];
        mapNode.stationNameLabel.text = [NSString stringWithFormat:@"%@\n%@", [appDelegate.stationList_green_names_ar objectAtIndex:indexPath.row], [appDelegate.stationList_green_names_en objectAtIndex:indexPath.row]];
        mapNode.plane_icon.hidden = YES;
        
        if ( indexPath.row == 9 || indexPath.row == 15 )
        {
            if ( indexPath.row == 9 )
            {
                mapNode.stationNumberLabel.text = @"18  20";
            }
            else
            {
                mapNode.stationNumberLabel.text = @"19  26";
            }
            
            mapNode.stationNumberLabel.frame = CGRectMake(20, 2, 63, 23);
            mapNode.node.image = [UIImage imageNamed:@"node_green_change"];
            mapNode.node.frame = CGRectMake(-14, 30, 83, 26);
        }
        else
        {
            mapNode.stationNumberLabel.text = [NSString stringWithFormat:@"%@", [appDelegate.stationList_green_numbers objectAtIndex:indexPath.row]];
            mapNode.stationNumberLabel.frame = CGRectMake(0, 2, 36, 23);
            mapNode.node.image = [UIImage imageNamed:@"node_green"];
            mapNode.node.frame = CGRectMake(20, 30, 36, 26);
        }
    }
    
    return mapNode;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    stationIsSelected = YES;
    
    if ( isOnTrain )
    {
        destinationIndexPath = indexPath;
    }
    else
    {
        selectedIndexPath = indexPath;
    }
    
    // In case the user was selecting a destination...
    rashidiyaDirectionButton.enabled = YES;
    jebelAliDirectionButton.enabled = YES;
    etisalatDirectionButton.enabled = YES;
    creekDirectionButton.enabled = YES;
    rashidiyaDirectionButton.alpha = 1.0;
    jebelAliDirectionButton.alpha = 1.0;
    etisalatDirectionButton.alpha = 1.0;
    creekDirectionButton.alpha = 1.0;
    
    [Sound soundEffect:3]; // Play the selection sound.
    
    CGSize stationNameSize;
    
    if ( [appDelegate.direction isEqualToString:@"Rashidiya"] || [appDelegate.direction isEqualToString:@"JebelAli"] )
    {
        stationNameSize = [[appDelegate.stationList_red_names_en objectAtIndex:indexPath.row] sizeWithFont:[UIFont fontWithName:@"ArialRoundedMTBold" size:SECONDARY_FONT_SIZE] constrainedToSize:CGSizeMake(320, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
    }
    else
    {
        stationNameSize = [[appDelegate.stationList_green_names_en objectAtIndex:indexPath.row] sizeWithFont:[UIFont fontWithName:@"ArialRoundedMTBold" size:SECONDARY_FONT_SIZE] constrainedToSize:CGSizeMake(320, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
    }
    
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        helpLabel_selection.frame = CGRectMake(0, screenBounds.size.height - 40, 320, 12);
        helpLabel_selection.alpha = 0.0;
        stationList.alpha = 0.0;
    } completion:^(BOOL finished){
        stationList.hidden = YES;
        
        if ( [appDelegate.direction isEqualToString:@"Rashidiya"] || [appDelegate.direction isEqualToString:@"JebelAli"] )
        {
            helpLabel_selection.text = [appDelegate.stationList_red_names_en objectAtIndex:indexPath.row];
            stationNumberNodeLabel.text = [appDelegate.stationList_red_numbers objectAtIndex:indexPath.row];
        }
        else
        {
            helpLabel_selection.text = [appDelegate.stationList_green_names_en objectAtIndex:indexPath.row];
            stationNumberNodeLabel.text = [appDelegate.stationList_green_numbers objectAtIndex:indexPath.row];
        }
        
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            directionMenuSeparator_3.frame = CGRectMake(14, screenBounds.size.height - 89, 292, 17);
            stationNumberNode.frame = CGRectMake(280, screenBounds.size.height - 51, 31, 23);
            locationArrow.frame = CGRectMake(130 - (stationNameSize.width / 2), screenBounds.size.height - 70, 23, 23);
            helpLabel_selection.frame = CGRectMake(0, screenBounds.size.height - 65, 320, 14);
            helpLabel_selection.alpha = 1.0;
            locationArrow.alpha = 1.0;
            stationNumberNode.alpha = 1.0;
        } completion:^(BOOL finished){
            if ( isOnTrain )
            {
                [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    helpLabel_distance.frame = CGRectMake(0, screenBounds.size.height - 45, 320, 12);
                    helpLabel_ETA.frame = CGRectMake(0, (screenBounds.size.height / 2) + 70, 320, 14);
                    helpLabel_ETA.alpha = 1.0;
                    helpLabel_distance.alpha = 1.0;
                } completion:^(BOOL finished){
                    
                }];
                
                ETADestination = [NSDate date];
                
                if ( [appDelegate.direction isEqualToString:@"Rashidiya"] )
                {
                    if ( destinationIndexPath.row > selectedIndexPath.row )
                    {
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!"
                                                                        message:@"أنت على متن القطار الخطأ! اصعد على القطار القادم إلى جبل علي.\n\nYou seem to be on the wrong train then! Get off at the next station & take the next train to Jebel Ali."
                                                                       delegate:nil
                                                              cancelButtonTitle:@"Okay"
                                                              otherButtonTitles:nil];
                        [alert show];
                        [self dismissDirectionList];
                        
                        return;
                    }
                    else
                    {
                        for ( int i = selectedIndexPath.row; i > destinationIndexPath.row ; i-- )
                        {
                            int distancetTimeInSeconds = [[appDelegate.stationTimeDifference_red objectAtIndex:i] intValue] * 60;
                            ETADestination = [ETADestination dateByAddingTimeInterval:distancetTimeInSeconds];
                        }
                    }
                }
                else if ( [appDelegate.direction isEqualToString:@"JebelAli"] )
                {
                    if ( destinationIndexPath.row < selectedIndexPath.row )
                    {
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!"
                                                                        message:@"أنت على متن القطار الخطأ! اصعد على القطار القادم إلى الراشدية.\n\nYou seem to be on the wrong train then! Get off at the next station & take the next train to Rashidiya."
                                                                       delegate:nil
                                                              cancelButtonTitle:@"Okay"
                                                              otherButtonTitles:nil];
                        [alert show];
                        [self dismissDirectionList];
                        
                        return;
                    }
                    else
                    {
                        for ( int i = selectedIndexPath.row; i < destinationIndexPath.row ; i++ )
                        {
                            int distancetTimeInSeconds = [[appDelegate.stationTimeDifference_red objectAtIndex:i + 1] intValue] * 60;
                            ETADestination = [ETADestination dateByAddingTimeInterval:distancetTimeInSeconds];
                        }
                    }
                }
                else if ( [appDelegate.direction isEqualToString:@"Etisalat"] )
                {
                    if ( destinationIndexPath.row > selectedIndexPath.row )
                    {
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!"
                                                                        message:@"أنت على متن القطار الخطأ! اصعد على القطار القادم إلى الخور.\n\nYou seem to be on the wrong train then! Get off at the next station & take the next train to Creek."
                                                                       delegate:nil
                                                              cancelButtonTitle:@"Okay"
                                                              otherButtonTitles:nil];
                        [alert show];
                        [self dismissDirectionList];
                        
                        return;
                    }
                    else
                    {
                        for ( int i = selectedIndexPath.row; i > destinationIndexPath.row ; i-- )
                        {
                            int distancetTimeInSeconds = [[appDelegate.stationTimeDifference_green objectAtIndex:i] intValue] * 60;
                            ETADestination = [ETADestination dateByAddingTimeInterval:distancetTimeInSeconds];
                        }
                    }
                }
                else if ( [appDelegate.direction isEqualToString:@"Creek"] )
                {
                    if ( destinationIndexPath.row < selectedIndexPath.row )
                    {
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!"
                                                                        message:@"أنت على متن القطار الخطأ! اصعد على القطار القادم إلى اتصالات.\n\nYou seem to be on the wrong train then! Get off at the next station & take the next train to Etisalat."
                                                                       delegate:nil
                                                              cancelButtonTitle:@"Okay"
                                                              otherButtonTitles:nil];
                        [alert show];
                        [self dismissDirectionList];
                        
                        return;
                    }
                    else
                    {
                        for ( int i = selectedIndexPath.row; i < destinationIndexPath.row ; i++ )
                        {
                            int distancetTimeInSeconds = [[appDelegate.stationTimeDifference_green objectAtIndex:i + 1] intValue] * 60;
                            ETADestination = [ETADestination dateByAddingTimeInterval:distancetTimeInSeconds];
                        }
                    }
                }
                
                NSCalendar *calendar = [NSCalendar currentCalendar];
                NSDateComponents *ETAComponents = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:ETADestination];
                NSInteger ETAHour = [ETAComponents hour];
                NSInteger ETAMinute = [ETAComponents minute];
                NSString *timePeriod = @"am";
                timeOfArrival = [NSString stringWithFormat:@"%02d:%02d %@", ETAHour, ETAMinute, timePeriod];
                
                if ( ETAHour > 12 ) // Convert back to 12-hour format for display purposes.
                {
                    ETAHour -= 12;
                    timePeriod = @"pm";
                    timeOfArrival = [NSString stringWithFormat:@"%02d:%02d %@", ETAHour, ETAMinute, timePeriod];
                }
                
                if ( ETAHour >= 12 ) // This needs its own fix for the case of 12 pm.
                {
                    timePeriod = @"pm";
                    timeOfArrival = [NSString stringWithFormat:@"%02d:%02d %@", ETAHour, ETAMinute, timePeriod];
                }
                
                if ( ETAHour == 0 )
                {
                    ETAHour = 12;
                    timePeriod = @"am";
                    timeOfArrival = [NSString stringWithFormat:@"%02d:%02d %@", ETAHour, ETAMinute, timePeriod];
                }
                
                helpLabel_ETA.text = [NSString stringWithFormat:@"ETA at destination: %@", timeOfArrival];
                
                [self dispalayDestinationETA];
                
                timer_destinationETA = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(dispalayDestinationETA) userInfo:nil repeats:YES];
            }
            else
            {
                [self fetchTrainTiming];
            }
            
            // Activate pulse effect.
            CABasicAnimation *pulseAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
            [pulseAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
            [pulseAnimation setFromValue:(id)[NSNumber numberWithDouble:0.5]];
            [pulseAnimation setToValue:(id)[NSNumber numberWithDouble:1.0]];
            [pulseAnimation setAutoreverses:YES];
            [pulseAnimation setDuration:0.5];
            [pulseAnimation setRepeatCount:INT16_MAX];
            
            [locationArrow.layer addAnimation:pulseAnimation forKey:nil];
            
            // Activate pulse effect.
            CABasicAnimation *pulseAnimation_onTrainButtonGlow = [CABasicAnimation animationWithKeyPath:@"opacity"];
            [pulseAnimation_onTrainButtonGlow setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
            [pulseAnimation_onTrainButtonGlow setFromValue:(id)[NSNumber numberWithDouble:0.1]];
            [pulseAnimation_onTrainButtonGlow setToValue:(id)[NSNumber numberWithDouble:1.0]];
            [pulseAnimation_onTrainButtonGlow setAutoreverses:YES];
            [pulseAnimation_onTrainButtonGlow setDuration:0.5];
            [pulseAnimation_onTrainButtonGlow setRepeatCount:INT16_MAX];
            
            [onTrainButtonGlow.layer addAnimation:pulseAnimation_onTrainButtonGlow forKey:nil];
            
            // Activate pulse effect.
            CABasicAnimation *pulseAnimation_onTrainButton = [CABasicAnimation animationWithKeyPath:@"opacity"];
            [pulseAnimation_onTrainButton setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
            [pulseAnimation_onTrainButton setFromValue:(id)[NSNumber numberWithDouble:0.8]];
            [pulseAnimation_onTrainButton setToValue:(id)[NSNumber numberWithDouble:1.0]];
            [pulseAnimation_onTrainButton setAutoreverses:YES];
            [pulseAnimation_onTrainButton setDuration:0.5];
            [pulseAnimation_onTrainButton setRepeatCount:INT16_MAX];
            
            [onTrainButton.layer addAnimation:pulseAnimation_onTrainButton forKey:nil];
        }];
    }];
    
    if ( !timer_helpLabel )
    {
        timer_helpLabel = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(alternateHelpLabelLanguage) userInfo:nil repeats:YES];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark -
#pragma mark UIActionSheetDelegate methods

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ( actionSheet.tag == 0 ) // Ali
    {
        switch ( buttonIndex )
        {
            case 0:
            {
                NSURL *url = [NSURL URLWithString:@"http://facebook.com/MachOSX"];
                NSURL *appUrl = [NSURL URLWithString:@"fb://profile/MachOSX"];
                
                if ( ![[UIApplication sharedApplication] openURL:appUrl] )
                {
                    [[UIApplication sharedApplication] openURL:url];
                }
            }
                break;
                
            case 1:
            {
                NSURL *url = [NSURL URLWithString:@"http://twitter.com/MachOSX"];
                NSURL *appUrl_twitter = [NSURL URLWithString:@"twitter://user?screen_name=MachOSX"];
                NSURL *appUrl_tweetbot = [NSURL URLWithString:@"tweetbot://MachOSX/user_profile/MachOSX"];
                
                if ( ![[UIApplication sharedApplication] openURL:appUrl_tweetbot] ) // I like Tweetbot more.
                {
                    if ( ![[UIApplication sharedApplication] openURL:appUrl_twitter] ) // Try the native app.
                    {
                        [[UIApplication sharedApplication] openURL:url];
                    }
                }
            }
                break;
                
            case 2:
            {
                NSURL *url = [NSURL URLWithString:@"http://instagram.com/machosx"];
                NSURL *appUrl = [NSURL URLWithString:@"instagram://user?username=machosx"];
                
                if ( ![[UIApplication sharedApplication] openURL:appUrl] )
                {
                    [[UIApplication sharedApplication] openURL:url];
                }
            }
                break;
                
            case 3:
            {
                NSURL *url = [NSURL URLWithString:@"http://machosx.tumblr.com/"];
                NSURL *appUrl = [NSURL URLWithString:@"tumblr://x-callback-url/blog?blogName=machosx"];
                
                if ( ![[UIApplication sharedApplication] openURL:appUrl] )
                {
                    [[UIApplication sharedApplication] openURL:url];
                }
            }
                break;
                
            default:
                break;
        }
    }
    else if ( actionSheet.tag == 1 ) // Diana
    {
        switch ( buttonIndex )
        {
            case 0:
            {
                NSURL *url = [NSURL URLWithString:@"http://twitter.com/LaDyiaNova"];
                NSURL *appUrl_twitter = [NSURL URLWithString:@"twitter://user?screen_name=LaDyiaNova"];
                NSURL *appUrl_tweetbot = [NSURL URLWithString:@"tweetbot://LaDyiaNova/user_profile/LaDyiaNova"];
                
                if ( ![[UIApplication sharedApplication] openURL:appUrl_tweetbot] ) // I like Tweetbot more.
                {
                    if ( ![[UIApplication sharedApplication] openURL:appUrl_twitter] ) // Try the native app.
                    {
                        [[UIApplication sharedApplication] openURL:url];
                    }
                }
            }
                break;
                
            case 1:
            {
                NSURL *url = [NSURL URLWithString:@"http://instagram.com/ladyianova"];
                NSURL *appUrl = [NSURL URLWithString:@"instagram://user?username=ladyianova"];
                
                if ( ![[UIApplication sharedApplication] openURL:appUrl] )
                {
                    [[UIApplication sharedApplication] openURL:url];
                }
            }
                break;
                
            default:
                break;
        }
    }
}

#pragma mark -
#pragma mark UITextFieldDelegate methods

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if ( textField.tag == 0 ) // Nol Card Number field.
    {
        [timer_nolCard invalidate];
        timer_nolCard = nil;
        displayedNolCardInfoIsEnglish = YES;
        nolCardNumberFieldLabel.textAlignment = NSTextAlignmentLeft;
        nolCardNumberField.textAlignment = NSTextAlignmentLeft;
        nolCardNumberField.placeholder = @"Enter the number on the back...";
        nolCardNumberField.text = nolCardNumber;
        nolCardNumberFieldLabel.text = @"Nol Card Number";
        
        [nolCardScrollView setContentOffset:CGPointMake(0, 40) animated:YES];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if ( textField.tag == 0 ) // Nol Card Number field.
    {
        if ( textField.text.length == 0 )
        {
            checkBalanceButton.enabled = NO;
        }
        else
        {
            checkBalanceButton.enabled = YES;
        }
        
        if ( ![nolCardNumber isEqualToString:textField.text] ) // If it's a new card number, wipe out the old balance.
        {
            [appDelegate.dataController writeValue:@"" forProperty:@"cardBalance"];
        }
        
        nolCardNumber = textField.text;
        timer_nolCard = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(alternateNolCardInfoLanguage) userInfo:nil repeats:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
