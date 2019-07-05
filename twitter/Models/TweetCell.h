//
//  TweetCell.h
//  twitter
//
//  Created by clairec on 7/1/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

NS_ASSUME_NONNULL_BEGIN


@interface TweetCell : UITableViewCell

//STEP TWO

@property (weak, nonatomic) IBOutlet UIImageView *profilePic;

@property (weak, nonatomic) IBOutlet UILabel *opName;
@property (weak, nonatomic) IBOutlet UILabel *opHandle;
@property (weak, nonatomic) IBOutlet UILabel *postDate;
@property (weak, nonatomic) IBOutlet UILabel *postText;


@property (weak, nonatomic) IBOutlet UIButton *retweetButton;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;
@property (weak, nonatomic) IBOutlet UILabel *rtCount;

@property (weak, nonatomic) IBOutlet UILabel *fvCount;




@property (strong, nonatomic) Tweet *tweet;

@end

NS_ASSUME_NONNULL_END
