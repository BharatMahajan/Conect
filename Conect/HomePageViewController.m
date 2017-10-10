//
//  HomePageViewController.m
//  Conect
//
//  Created by Bharat Mahajan on 10/31/16.
//  Copyright © 2016 Bharat Mahajan. All rights reserved.
//

#import "HomePageViewController.h"
#import "NotificationPageViewController.h"
@interface HomePageViewController ()
@property (nonatomic, weak) IBOutlet UIImageView *imgProfilePic;
@property (nonatomic, weak) IBOutlet UIImageView *imgProfile;
@property (nonatomic, weak) IBOutlet UIImageView *imgNotification;
@property (nonatomic, weak) IBOutlet UIImageView *imgTimeSheet;
@property (nonatomic, weak) IBOutlet UIImageView *imgReferal;
@property (nonatomic, weak) IBOutlet UIImageView *imgTicket;
@property (nonatomic, weak) IBOutlet UIImageView *imgRedeployMe;
@property (nonatomic,readwrite) CGPoint profilePicPoint;
@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:YES];

    self.profilePicPoint=self.imgProfilePic.center;
}
/*
- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:touch.view];
    self.imgProfilePic.center = touchLocation;
    
    if ([touch.view isEqual: self.view] || touch.view == nil) {
        return;
    }
    
}

- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:touch.view];
    if ([touch view] == self.imgNotification) {
        // move the image view
        self.imgNotification.image = [UIImage imageNamed:@"notification_hover"];
        self.imgProfilePic.center = touchLocation;
    }
//    else if ([touch view] == img2) {
//        // move the image view
//        img2.center = touchLocation;
//    }
//    if ([touch.view isEqual: self.view]) {
//        
//        self.imageview.center = touchLocation;
//        
//        return;
//    }
}

-(void)touchesEnded:(NSSet*)touches withEvent:(UIEvent *)event
{
    
}

-(void)touchesCancelled:(NSSet*)touches withEvent:(UIEvent *)event
{
    
}
*/
- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer
{
    
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
                                         recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];

    
    if ([recognizer state] == UIGestureRecognizerStateChanged)
    {
        if(CGRectIntersectsRect(self.imgProfilePic.frame,self.imgNotification.frame))
        {
            self.imgNotification.image = [UIImage imageNamed:@"notification_hover"];
            self.imgTimeSheet.image = [UIImage imageNamed:@"timesheet"];
            self.imgReferal.image = [UIImage imageNamed:@"referral"];
            self.imgTicket.image = [UIImage imageNamed:@"ticket"];
            self.imgRedeployMe.image = [UIImage imageNamed:@"redeployme"];
            self.imgProfile.image = [UIImage imageNamed:@"profile"];
        }
        else if (CGRectIntersectsRect(self.imgProfilePic.frame,self.imgTimeSheet.frame))
        {
            self.imgTimeSheet.image = [UIImage imageNamed:@"timesheet_hover"];
            self.imgNotification.image = [UIImage imageNamed:@"notification"];
            self.imgReferal.image = [UIImage imageNamed:@"referral"];
            self.imgTicket.image = [UIImage imageNamed:@"ticket"];
            self.imgRedeployMe.image = [UIImage imageNamed:@"redeployme"];
            self.imgProfile.image = [UIImage imageNamed:@"profile"];
        }
        else if (CGRectIntersectsRect(self.imgProfilePic.frame,self.imgReferal.frame))
        {
            self.imgReferal.image = [UIImage imageNamed:@"referral_hover"];
            self.imgNotification.image = [UIImage imageNamed:@"notification"];
            self.imgTimeSheet.image = [UIImage imageNamed:@"timesheet"];
            self.imgTicket.image = [UIImage imageNamed:@"ticket"];
            self.imgRedeployMe.image = [UIImage imageNamed:@"redeployme"];
            self.imgProfile.image = [UIImage imageNamed:@"profile"];
        }
        else if (CGRectIntersectsRect(self.imgProfilePic.frame,self.imgTicket.frame))
        {
            self.imgTicket.image = [UIImage imageNamed:@"ticket_hover"];
            self.imgNotification.image = [UIImage imageNamed:@"notification"];
            self.imgTimeSheet.image = [UIImage imageNamed:@"timesheet"];
            self.imgReferal.image = [UIImage imageNamed:@"referral"];
            self.imgRedeployMe.image = [UIImage imageNamed:@"redeployme"];
            self.imgProfile.image = [UIImage imageNamed:@"profile"];
        }
        else if (CGRectIntersectsRect(self.imgProfilePic.frame,self.imgRedeployMe.frame))
        {
            self.imgRedeployMe.image = [UIImage imageNamed:@"redeployme_hover"];
            self.imgNotification.image = [UIImage imageNamed:@"notification"];
            self.imgTimeSheet.image = [UIImage imageNamed:@"timesheet"];
            self.imgReferal.image = [UIImage imageNamed:@"referral"];
            self.imgTicket.image = [UIImage imageNamed:@"ticket"];
            self.imgProfile.image = [UIImage imageNamed:@"profile"];
        }
        else if (CGRectIntersectsRect(self.imgProfilePic.frame,self.imgProfile.frame))
        {
            self.imgProfile.image = [UIImage imageNamed:@"profile_hover"];
            self.imgNotification.image = [UIImage imageNamed:@"notification"];
            self.imgTimeSheet.image = [UIImage imageNamed:@"timesheet"];
            self.imgReferal.image = [UIImage imageNamed:@"referral"];
            self.imgTicket.image = [UIImage imageNamed:@"ticket"];
            self.imgRedeployMe.image = [UIImage imageNamed:@"redeployme"];
        }
        else
        {
            self.imgProfile.image = [UIImage imageNamed:@"profile"];
            self.imgNotification.image = [UIImage imageNamed:@"notification"];
            self.imgTimeSheet.image = [UIImage imageNamed:@"timesheet"];
            self.imgReferal.image = [UIImage imageNamed:@"referral"];
            self.imgTicket.image = [UIImage imageNamed:@"ticket"];
            self.imgRedeployMe.image = [UIImage imageNamed:@"redeployme"];
        }
    }
    
    
    if ([recognizer state] == UIGestureRecognizerStateEnded)
    {
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
//        HomePageViewController *homePageViewController = (HomePageViewController*)[mainStoryboard instantiateViewControllerWithIdentifier: @"homePage"];

        if(CGRectIntersectsRect(self.imgProfilePic.frame,self.imgNotification.frame))
        {

            NotificationPageViewController *notificationViewController = (NotificationPageViewController*)[mainStoryboard instantiateViewControllerWithIdentifier:@"notificationPage"];
            [self presentViewController:notificationViewController animated:YES completion:^{
                self.imgProfilePic.center = self.profilePicPoint;
                self.imgNotification.image = [UIImage imageNamed:@"notification"];
            }];

//            [self.navigationController pushViewController:notificationViewController animated:YES];
        }
        else if (CGRectIntersectsRect(self.imgProfilePic.frame,self.imgTimeSheet.frame))
        {
            UIViewController *notificationViewController = (UIViewController*)[mainStoryboard instantiateViewControllerWithIdentifier:@"timesheetPage"];
            [self.navigationController pushViewController:notificationViewController animated:YES];
        }
        else if (CGRectIntersectsRect(self.imgProfilePic.frame,self.imgReferal.frame))
        {
            UIViewController *notificationViewController = (UIViewController*)[mainStoryboard instantiateViewControllerWithIdentifier:@"referalPage"];
            [self.navigationController pushViewController:notificationViewController animated:YES];
        }
        else if (CGRectIntersectsRect(self.imgProfilePic.frame,self.imgTicket.frame))
        {
            UIViewController *notificationViewController = (UIViewController*)[mainStoryboard instantiateViewControllerWithIdentifier:@"ticketPage"];
            [self.navigationController pushViewController:notificationViewController animated:YES];
        }
        else if (CGRectIntersectsRect(self.imgProfilePic.frame,self.imgRedeployMe.frame))
        {
            UIViewController *notificationViewController = (UIViewController*)[mainStoryboard instantiateViewControllerWithIdentifier:@"redeploymePage"];
            [self.navigationController pushViewController:notificationViewController animated:YES];
        }
        else if (CGRectIntersectsRect(self.imgProfilePic.frame,self.imgProfile.frame))
        {
            UIViewController *notificationViewController = (UIViewController*)[mainStoryboard instantiateViewControllerWithIdentifier:@"profilePage"];
            [self.navigationController pushViewController:notificationViewController animated:YES];
        }
        else
        {
            self.imgProfilePic.center = self.profilePicPoint;
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
