//
//  TimelineViewController.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TimelineViewController.h"
#import "APIManager.h"
#import "Tweet.h"
#import "Tweetcell.h"
#import "UIImageView+AFNetworking.h"
#import "ComposeViewController.h"
#import "AppDelegate.h"
#import "LoginViewController.h"

@interface TimelineViewController () <ComposeViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>


//STEP ONE
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *tweetArray;

@property (strong, nonatomic) UIRefreshControl *refreshControl;

@end

@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //refresh control
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(fetchTweets) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex:0];
    
    
    //STEP THREE
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    //fetch tweets timeline
    [self fetchTweets];
    
}

-(void)fetchTweets {
    // Get timeline
    
    //STEP FOUR
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweets, NSError *error) {
        if (tweets) {
            //STEP 6
            self.tweetArray = tweets;
            NSLog(@"😎😎😎 Successfully loaded home timeline");
            
            //STEP 7
            [self.tableView reloadData];
            [self.refreshControl endRefreshing];
            /**
             for (NSDictionary *dictionary in tweets) {
             NSString *text = dictionary[@"text"];
             NSLog(@"%@", text);
             
             }
             **/
            
            
        } else {
            NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
        }
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)beginRefresh:(UIRefreshControl *)refreshControl {
    

}


- (IBAction)logoutTap:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    appDelegate.window.rootViewController = loginViewController;
    
    [[APIManager shared] logout];
}




//STEP 8
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    //STEP 10
    
    TweetCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"TweetCell" forIndexPath:indexPath];
    
    Tweet *tweet = self.tweetArray[indexPath.row];
    
    cell.tweet = tweet;
    
    cell.fvCount.text = [NSString stringWithFormat:@"%i", cell.tweet.favoriteCount];
    
    cell.rtCount.text = [NSString stringWithFormat:@"%i", cell.tweet.retweetCount];
    cell.opName.text = tweet.user.name;
    NSString *userName = tweet.user.screenName;
    cell.opHandle.text = [@"@" stringByAppendingString:userName];
    cell.postText.text = tweet.text;
    cell.postDate.text = tweet.createdAtString;
    
    NSString *url = tweet.user.profPicURL;
    NSURL *picURL = [NSURL URLWithString:url];
    //NSURLRequest *request = [NSURLRequest requestWithURL:picURL];
    [cell.profilePic setImageWithURL:picURL];
    
    
    //cell.postDate.text =
    
    
//    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
//    NSString *posterURLString = movie[@"poster_path"];
//    NSString *totalURLString = [baseURLString stringByAppendingString:posterURLString];
//
//    NSURL *posterURL = [NSURL URLWithString:totalURLString];
//    NSURLRequest *request = [NSURLRequest requestWithURL:posterURL];
//
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //STEP 9
    return self.tweetArray.count;
    
    
}


 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 UINavigationController *navigationController = [segue destinationViewController];
 ComposeViewController *composeController = (ComposeViewController*)navigationController.topViewController;
 composeController.delegate = self;
 }



- (void)didTweet:(nonnull Tweet *)tweet {

    [self fetchTweets];
}


@end
