//
//  TweetCell.m
//  twitter
//
//  Created by clairec on 7/1/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "Tweet.h"
#import "User.h"

@implementation TweetCell


//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//    NSLog(@"%@", self.tweet.text);
//    NSLog(@"%i", self.tweet.favoriteCount);
//    [self refreshData];
//}


- (void)initWithCoder {
    NSLog(@"%@", self.tweet.text);
    NSLog(@"%i", self.tweet.favoriteCount);
    [self refreshData];
}

-(void)refreshData{
    self.fvCount.text = [NSString stringWithFormat:@"%i", self.tweet.favoriteCount];
    
    self.rtCount.text = [NSString stringWithFormat:@"%i", self.tweet.retweetCount];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)retweetTap:(id)sender {
    

    if (self.retweetButton.selected){
        self.tweet.retweeted = NO;
        self.tweet.retweetCount -= 1;
        self.retweetButton.selected = NO;
    }
    else{
        self.tweet.retweeted = YES;
        self.tweet.retweetCount += 1;
        self.retweetButton.selected = YES;
    }
    [self refreshData];
    
}

- (IBAction)favoriteTap:(id)sender {
    

    if (self.favoriteButton.selected){
        self.tweet.favorited = NO;
        self.tweet.favoriteCount -= 1;
        self.favoriteButton.selected = NO;
    }
    else{
        self.tweet.favorited = YES;
        self.tweet.favoriteCount += 1;
        self.favoriteButton.selected = YES;
        
    }
    [self refreshData];
}


@end
