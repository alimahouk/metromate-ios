//
//  Sound.m
//  MetroMate
//
//  Created by Ali Mahouk on 12/5/13.
//  Copyright (c) 2013 Ali Mahouk. All rights reserved.
//

#import "Sound.h"

@implementation Sound

+ (void)soundEffect:(int)soundNumber
{
	
    NSString *effect = @"";
    NSString *type = @"";
	
	switch ( soundNumber )
    {
		case 0:
			effect = @"menu_accept";
			type = @"wav";
			break;
            
        case 1:
			effect = @"menu_back";
			type = @"wav";
			break;
            
        case 2:
			effect = @"menu_countdown";
			type = @"wav";
			break;
            
        case 3:
			effect = @"menu_focus";
			type = @"wav";
			break;
            
		default:
			break;
	}
	
    SystemSoundID soundID;
	
    NSString *path = [[NSBundle mainBundle] pathForResource:effect ofType:type];
    NSURL *url = [NSURL fileURLWithPath:path];
	
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundID);
    AudioServicesPlaySystemSound(soundID);
}

@end
