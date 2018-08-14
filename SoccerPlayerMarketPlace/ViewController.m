//
//  ViewController.m
//  SoccerPlayerMarketPlace
//
//  Created by Hakan Silek on 18.07.2018.
//  Copyright © 2018 Hakan Silek. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    soccerPlayers = [[NSMutableArray alloc] init];
    filteredSoccerPlayers = [[NSArray alloc] init];
    
    
    
    SoccerPlayer *p1 = [SoccerPlayer soccerPlayerWithName:@"Lionel Messi" andPosition:STRIKER];
    SoccerPlayer *p2 = [SoccerPlayer soccerPlayerWithName:@"Neymar" andPosition:STRIKER];
    SoccerPlayer *p3 = [SoccerPlayer soccerPlayerWithName:@"Harry Kane" andPosition:STRIKER];
    SoccerPlayer *p4 = [SoccerPlayer soccerPlayerWithName:@"Kevin de Bruyne" andPosition:MIDFIELD];
    SoccerPlayer *p5 = [SoccerPlayer soccerPlayerWithName:@"Eden Hazard" andPosition:MIDFIELD];
    SoccerPlayer *p6 = [SoccerPlayer soccerPlayerWithName:@"Philippe Coutinhoe" andPosition:MIDFIELD];
    SoccerPlayer *p7 = [SoccerPlayer soccerPlayerWithName:@"Dele Alli" andPosition:MIDFIELD];
    SoccerPlayer *p8 = [SoccerPlayer soccerPlayerWithName:@"Kevin de Bruyne" andPosition:MIDFIELD];
    SoccerPlayer *p9 = [SoccerPlayer soccerPlayerWithName:@"Cristiano Ronaldo" andPosition:STRIKER];
    SoccerPlayer *p10 = [SoccerPlayer soccerPlayerWithName:@"Paulo Dybala" andPosition:STRIKER];
    SoccerPlayer *p11 = [SoccerPlayer soccerPlayerWithName:@"Kylian Mbappe" andPosition:STRIKER];
    SoccerPlayer *p12 = [SoccerPlayer soccerPlayerWithName:@"Robert Lewandowski" andPosition:STRIKER];
    SoccerPlayer *p13 = [SoccerPlayer soccerPlayerWithName:@"Romelu Lukaku" andPosition:STRIKER];
    SoccerPlayer *p14 = [SoccerPlayer soccerPlayerWithName:@"Raheem Sterling" andPosition:MIDFIELD];
    SoccerPlayer *p15 = [SoccerPlayer soccerPlayerWithName:@"Jan Oblak" andPosition:GOALKEEPER];
    SoccerPlayer *p16 = [SoccerPlayer soccerPlayerWithName:@"David de Gea" andPosition:GOALKEEPER];
    SoccerPlayer *p17 = [SoccerPlayer soccerPlayerWithName:@"Marc-Andre ter Stegen" andPosition:GOALKEEPER];
    SoccerPlayer *p18 = [SoccerPlayer soccerPlayerWithName:@"Ederson" andPosition:GOALKEEPER];
    SoccerPlayer *p19 = [SoccerPlayer soccerPlayerWithName:@"Alisson" andPosition:GOALKEEPER];
    SoccerPlayer *p20 = [SoccerPlayer soccerPlayerWithName:@"Mats Hummels" andPosition:DEFENSE];
    SoccerPlayer *p21 = [SoccerPlayer soccerPlayerWithName:@"Dani Carvajal" andPosition:DEFENSE];
    SoccerPlayer *p22 = [SoccerPlayer soccerPlayerWithName:@"Joshua Kimmich" andPosition:DEFENSE];
    [soccerPlayers addObjectsFromArray:[NSArray arrayWithObjects:p1,p14,p3,p17,p22,p6,p7,p15,p9,p10,p11,p12,p13,p2,p8,p16,p4,p18,p19,p20,p21,p5, nil]];
    self.navigationItem.title=@"Soccer Player Market";
    
    soccerPlayerSearchBarController = [[UISearchController alloc] initWithSearchResultsController:nil];//Olduğu sayfada sonucu goöstermek istediğimiz için nil değer verdik.
    soccerPlayerSearchBarController.dimsBackgroundDuringPresentation=NO;//arkaplanı dim(karartmak)yapma
    soccerPlayerSearchBarController.definesPresentationContext=YES; //başka bir ekrana geçince searchbarın silinmesini sağlar
    soccerPlayerSearchBarController.searchBar.delegate = self;
    soccerPlayerSearchBarController.searchResultsUpdater = self;
    [soccerPlayerSearchBarController.searchBar setShowsScopeBar:YES];
    [soccerPlayerSearchBarController.searchBar setScopeButtonTitles:@[@"Hepsi",@"Forvet",@"Orta Saha",@"Defans",@"Kaleci"]];
    soccerPlayerSearchBarController.searchBar.selectedScopeButtonIndex = 0;
    
    [self.tableView setTableHeaderView:soccerPlayerSearchBarController.searchBar];

    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   SoccerPlayer *player = soccerPlayerSearchBarController.isActive?[filteredSoccerPlayers objectAtIndex:indexPath.row]:[soccerPlayers objectAtIndex:indexPath.row];
    static NSString *myCellIdentifier = @"myCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:myCellIdentifier forIndexPath:indexPath];
    [cell.textLabel setText:player.name];
    [cell.detailTextLabel setText:[self getEnumValue:player.position]];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return soccerPlayerSearchBarController.isActive?[filteredSoccerPlayers count]:[soccerPlayers count];
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    [self filterSearchController:searchController.searchBar];
}

-(void)filterSearchController:(UISearchBar*)searchBar
{
    
    NSString *searchBarText = searchBar.text;
    int selectedScopeIndex = (int) soccerPlayerSearchBarController.searchBar.selectedScopeButtonIndex;
    if([searchBarText length]>0){
        NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"name CONTAINS[cd] %@ AND (position==%d OR (position>0 AND %d==0))",searchBarText,selectedScopeIndex,selectedScopeIndex];
        filteredSoccerPlayers = [soccerPlayers filteredArrayUsingPredicate:resultPredicate];
    }else{
        filteredSoccerPlayers = soccerPlayers;
    }
    
    
    
    [self.tableView reloadData];
}

- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope
{
    [self filterSearchController:searchBar];
}

-(NSString*)getEnumValue:(Position)p
{
    switch (p) {
        case STRIKER:
            return @"Forvet";
            break;
        case MIDFIELD:
            return @"Orta Saha";
            break;
        case DEFENSE:
            return @"Defans";
        case GOALKEEPER:
            return @"Kaleci";
            break;
        default:
            return @"HEPSİ";
            break;
    }
}

@end
