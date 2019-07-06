//
//  DetailsViewController.m
//  twitter
//
//  Created by clairec on 7/5/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "DetailsViewController.h"
#import "TimelineViewController.h"
#import "Tweet.h"
#import "TweetCell.h"
#import "UIImageView+AFNetworking.h"

@interface DetailsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *tweetText;
@property (weak, nonatomic) IBOutlet UIImageView *proPic;


@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@", self.tweet.text);
    
    self.tweetText.text = self.tweet.text;
    
    NSString *url = self.tweet.user.profPicURL;
    NSURL *picURL = [NSURL URLWithString:url];
    //NSURLRequest *request = [NSURLRequest requestWithURL:picURL];
    [self.proPic setImageWithURL:picURL];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
