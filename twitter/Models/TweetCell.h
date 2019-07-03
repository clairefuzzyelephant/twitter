//
//  TweetCell.h
//  twitter
//
//  Created by clairec on 7/1/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TweetCell : UITableViewCell

//STEP TWO

@property (weak, nonatomic) IBOutlet UIImageView *profilePic;

@property (weak, nonatomic) IBOutlet UILabel *opName;
@property (weak, nonatomic) IBOutlet UILabel *opHandle;
@property (weak, nonatomic) IBOutlet UILabel *postDate;
@property (weak, nonatomic) IBOutlet UILabel *postText;


@property (strong, nonatomic) NSObject *tweet;

@end

NS_ASSUME_NONNULL_END
