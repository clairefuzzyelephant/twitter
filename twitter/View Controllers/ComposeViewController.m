//
//  ComposeViewController.m
//  twitter
//
//  Created by clairec on 7/2/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import "APIManager.h"
#import "Tweet.h"
#import "User.h"
#import "UIImageView+AFNetworking.h"


@interface ComposeViewController () <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *composeText;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.delegate = self;
}
- (IBAction)closeCompose:(id)sender {
    
    [self dismissViewControllerAnimated:true completion:nil];
}
- (IBAction)postTweet:(id)sender {
    
    NSString *viewText = self.composeText.text;
    NSLog(@"%@", viewText);
    
    [[APIManager shared]postStatusWithText:viewText completion:^(Tweet *tweet, NSError *error) {
        if(error){
            NSLog(@"Error composing Tweet: %@", error.localizedDescription);
        }
        else{
            [self.delegate didTweet:tweet];
            NSLog(@"Compose Tweet Success!");
            [self dismissViewControllerAnimated:true completion:nil];
        }
    }];
    
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
