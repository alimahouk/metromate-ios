//
//  RootViewController.h
//  MetroMate
//
//  Created by Ali Mahouk on 5/12/13.
//
//

#import <CoreLocation/CoreLocation.h>
#import "ASIFormDataRequest.h"
#import "MBProgressHUD.h"
#import "MapVerticalNodeCell.h"

@interface RootViewController : UIViewController <CLLocationManagerDelegate, MBProgressHUDDelegate, UITableViewDelegate, UITableViewDataSource, UIActionSheetDelegate, UITextFieldDelegate> {
    CLLocationManager *locationManager;
    __block ASIFormDataRequest *dataRequest;
    NSDictionary *responseData;
    NSDictionary *nearestStationData;
    MBProgressHUD *HUD;
    UIView *frontView;
    UIView *backView;
    UIView *pixelPattern;
    UIImageView *screenLowerGlow;
    UIImageView *screenUpperGlow;
    UIImageView *directionMenuSeparator_1;
    UIImageView *directionMenuSeparator_2;
    UIImageView *directionMenuSeparator_3;
    UIImageView *directionMenuSeparator_4;
    UIImageView *notificationPanel;
    UIImageView *onTrainButtonGlow;
    UIImageView *nolInfoButtonGlow;
    UIImageView *callRTAButtonGlow;
    UIImageView *rateAppButtonGlow;
    UIImageView *checkBalanceButtonGlow;
    UIImageView *stationNumberNode;
    UIImageView *locationArrow;
    UIImageView *errorIcon;
    UIImageView *SHRoof;
    UIImageView *cardSelectionFrame;
    UIImageView *cardSelectionOverlay;
    UIButton *infoButton;
    UIButton *backToFrontViewButton;
    UIButton *rashidiyaDirectionButton;
    UIButton *jebelAliDirectionButton;
    UIButton *etisalatDirectionButton;
    UIButton *creekDirectionButton;
    UIButton *selectedDirectionButton;
    UIButton *onTrainButton;
    UIButton *nolInfoButton;
    UIButton *callRTAButton;
    UIButton *rateAppButton;
    UIButton *checkBalanceButton;
    UILabel *notificationPanelLabel;
    UILabel *helpLabel_distance;
    UILabel *helpLabel_ETA;
    UILabel *helpLabel_selection;
    UILabel *stationNumberNodeLabel;
    UILabel *nextTrainLabel;
    UILabel *countdownLabel;
    UILabel *loveLabel;
    UILabel *disclaimerLabel;
    UILabel *aboutLabel;
    UILabel *nolCardNumberFieldLabel;
    UITextField *nolCardNumberField;
    CAGradientLayer *maskLayer_stationList;
    UITableView *stationList;
    MapVerticalNodeCell *mapNode;
    UIScrollView *backScrollView;
    UIScrollView *nolCardScrollView;
    NSIndexPath *selectedIndexPath;
    NSIndexPath *destinationIndexPath;
    NSTimer *timer_nolCard;
    NSTimer *timer_notification;
    NSTimer *timer_helpLabel;
    NSTimer *timer_nextTrainLabel;
    NSTimer *timer_nextTrainFetch;
    NSTimer *timer_countdown;
    NSTimer *timer_destinationETA;
    int secondsToDeparture;
    NSDate *ETA;
    NSDate *ETADestination;
    NSString *timeOfArrival;
    NSString *nolCardNumber;
    BOOL shouldAutoselectStation;
    BOOL stationAutoselected;
    BOOL directionIsSelected;
    BOOL stationIsSelected;
    BOOL fetchingNearbyStation;
    BOOL displayedNolCardInfoIsEnglish;
    BOOL displayedNotificationIsEnglish;
    BOOL displayedStationInfoIsEnglish;
    BOOL displayedTimeIsEnglish;
    BOOL countdownStarted;
    BOOL isLastTrain;
    BOOL trainServiceRunning;
    BOOL isOnTrain;
}

- (void)presentDirectionList;
- (void)dismissDirectionList;
- (void)setDirection:(id)sender;
- (void)presentAboutSection;
- (void)dismissAboutSection;
- (void)presentNolInfo;
- (void)dismissNolInfo;
- (void)alternateNolCardInfoLanguage;
- (void)alternateNotificationLabelLanguage;
- (void)alternateHelpLabelLanguage;
- (void)alternateTimingLabelLanguage;
- (void)fetchTrainTiming;
- (void)fetchNearbyStation;
- (void)dispalayDestinationETA;
- (void)updateDistanceLabel;
- (void)countdownToDeparture;
- (void)showSocialProfiles:(id)sender;
- (void)embarkTrain;
- (void)callRTA;
- (void)rateApp;
- (void)changeCardType:(id)sender;
- (void)checkCardBalance:(id)sender;
- (void)saveCardInfo;

@end
