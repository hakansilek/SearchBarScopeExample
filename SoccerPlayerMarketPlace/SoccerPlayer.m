//
//  SoccerPlayer.m
//  SoccerPlayerMarketPlace
//
//  Created by Hakan Silek on 18.07.2018.
//  Copyright © 2018 Hakan Silek. All rights reserved.
//

#import "SoccerPlayer.h"

@implementation SoccerPlayer

+ (instancetype)soccerPlayerWithName:(NSString *)name andPosition:(Position)position
{
    SoccerPlayer *player = [[SoccerPlayer alloc] initWithName:name andPosition:position];
    return  player;
}

- (id)initWithName:(NSString *)name andPosition:(Position)p
{
    self = [super init];
    if(self){
        self.name = name;
        self.position = p;
    }
    return self;
}
@end
