//
//  MapVerticalNodeCell.m
//  MetroMate
//
//  Created by Ali Mahouk on 5/23/13.
//
//

#import "MapVerticalNodeCell.h"
#import "AppDelegate.h"

@implementation MapVerticalNodeCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if ( self )
    {
        self.backgroundColor = [UIColor clearColor];
        
        _line_top = [[UIImageView alloc] initWithFrame:CGRectMake(32, 0, 13, 30)];
        _line_top.opaque = YES;
        
        _line_bottom = [[UIImageView alloc] initWithFrame:CGRectMake(32, 55, 13, 30)];
        _line_bottom.opaque = YES;
        
        _node = [[UIImageView alloc] init];
        _node.opaque = YES;
        
        _plane_icon = [[UIImageView alloc] initWithFrame:CGRectMake(250, 35, 25, 25)];
        _plane_icon.image = [UIImage imageNamed:@"airplane_pictogram"];
        _plane_icon.hidden = YES;
        _plane_icon.opaque = YES;
        
        _stationNumberLabel = [[UILabel alloc] init];
        _stationNumberLabel.textAlignment = NSTextAlignmentCenter;
        _stationNumberLabel.textColor = [UIColor whiteColor];
        _stationNumberLabel.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:MIN_MAIN_FONT_SIZE];
        _stationNumberLabel.numberOfLines = 1;
        _stationNumberLabel.backgroundColor = [UIColor clearColor];
        _stationNumberLabel.opaque = YES;
        
        _stationNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(75, 0, 270, 80)];
        _stationNameLabel.textColor = [UIColor whiteColor];
        _stationNameLabel.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:MAIN_FONT_SIZE];
        _stationNameLabel.numberOfLines = 0;
        _stationNameLabel.backgroundColor = [UIColor clearColor];
        _stationNameLabel.opaque = YES;
        
        [_node addSubview:_stationNumberLabel];
        [self.contentView addSubview:_line_top];
        [self.contentView addSubview:_line_bottom];
        [self.contentView addSubview:_node];
        [self.contentView addSubview:_plane_icon];
        [self.contentView addSubview:_stationNameLabel];
    }
    
    return self;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    if ( highlighted )
    {
        _stationNameLabel.textColor = [UIColor colorWithRed:22/255.0 green:60/255.0 blue:93/255.0 alpha:1.0];
    }
    else
    {
        _stationNameLabel.textColor = [UIColor whiteColor];
    }
    
    [super setHighlighted:(BOOL)highlighted animated:animated];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:NO animated:animated];
}

@end
