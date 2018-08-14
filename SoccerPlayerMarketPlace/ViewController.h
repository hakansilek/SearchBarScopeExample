//
//  ViewController.h
//  SoccerPlayerMarketPlace
//
//  Created by Hakan Silek on 18.07.2018.
//  Copyright © 2018 Hakan Silek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SoccerPlayer.h"
@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating, UISearchBarDelegate>
{
    UISearchController *soccerPlayerSearchBarController;
    NSMutableArray *soccerPlayers;
    NSArray *filteredSoccerPlayers;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

