//
//  SoccerPlayer.h
//  SoccerPlayerMarketPlace
//
//  Created by Hakan Silek on 18.07.2018.
//  Copyright © 2018 Hakan Silek. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, Position) {
    ALL=0,
    STRIKER,
    MIDFIELD,
    DEFENSE,
    GOALKEEPER
};

@interface SoccerPlayer : NSObject

@property (nonatomic, strong) NSString *name;
@property (assign) Position position;

+(instancetype)soccerPlayerWithName:(NSString*)name andPosition:(Position)position;
-(id)initWithName:(NSString*)name andPosition:(Position)p;
@end
