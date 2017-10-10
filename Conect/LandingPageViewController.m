//
//  LandingPageViewController.m
//  Conect
//
//  Created by Bharat Mahajan on 10/31/16.
//  Copyright © 2016 Bharat Mahajan. All rights reserved.
//

#import "LandingPageViewController.h"
#import "HomePageViewController.h"
#import "APLPendulumBehavior.h"
#import "APLDecorationView.h"

@interface LandingPageViewController ()
@property (nonatomic, weak) IBOutlet UIView *square;
@property (nonatomic, weak) IBOutlet UIImageView *attachmentPoint;
@property (weak, nonatomic) IBOutlet UIImageView *imgCollaberaText;
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, weak) APLPendulumBehavior *pendulumBehavior;
@end


@implementation LandingPageViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.attachmentPoint.image = [self.attachmentPoint.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    // Visually show the connection between the attachmentPoint and the square.
    [(APLDecorationView*)self.view trackAndDrawAttachmentFromView:self.attachmentPoint toView:self.square withAttachmentOffset:CGPointMake(0, -0.95f * self.square.bounds.size.height/2)];
    
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];

    CGPoint pendulumAttachmentPoint = self.attachmentPoint.center;
    
    // An example of a high-level behavior simulating a simple pendulum.
    APLPendulumBehavior *pendulumBehavior = [[APLPendulumBehavior alloc] initWithWeight:self.square suspendedFromPoint:pendulumAttachmentPoint];
    [animator addBehavior:pendulumBehavior];
    self.pendulumBehavior = pendulumBehavior;
    
    self.animator = animator;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [self.navigationController setNavigationBarHidden:YES];

    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    [standardDefaults setFloat:self.imgCollaberaText.center.y forKey:@"collaberaText"];
    [standardDefaults synchronize];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushNextView:) name:@"pushNextView" object:nil];

}

-(void)pushNextView:(NSNotification*)notification
{
    if ([[notification name] isEqualToString:@"pushNextView"])
    {
        [UIView animateWithDuration:1.0
                         animations:^{
                             self.imgCollaberaText.transform = CGAffineTransformScale(CGAffineTransformIdentity, 2.0, 2.0);
                         } completion:^(BOOL finished) {
                             [self performSelector:@selector(presentNextView) withObject:nil afterDelay:0.5];
                         }];
    }
}

-(void)presentNextView
{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    HomePageViewController *homePageViewController = (HomePageViewController*)[mainStoryboard instantiateViewControllerWithIdentifier: @"homePage"];
    [self presentViewController:homePageViewController animated:YES completion:nil];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    [[NSNotificationCenter defaultCenter] removeObserver:self];

}
//| ----------------------------------------------------------------------------
//  IBAction for the Pan Gesture Recognizer that has been configured to track
//  touches in self.view.
//
- (IBAction)dragWeight:(UIPanGestureRecognizer*)gesture
{
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        [self.pendulumBehavior beginDraggingWeightAtPoint:[gesture locationInView:self.view]];
}
    else if (gesture.state == UIGestureRecognizerStateEnded)
    {
        [self.pendulumBehavior endDraggingWeightWithVelocity:[gesture velocityInView:self.view]];
    }
    else if (gesture.state == UIGestureRecognizerStateCancelled)
    {
        gesture.enabled = YES;

        [self.pendulumBehavior endDraggingWeightWithVelocity:[gesture velocityInView:self.view]];
    }
    else if (!CGRectContainsPoint(self.square.bounds, [gesture locationInView:self.square]))
        // End the gesture if the user's finger moved outside square1's bounds.
        // This causes the gesture to transition to the cencelled state.
        gesture.enabled = NO;
    else
        [self.pendulumBehavior dragWeightToPoint:[gesture locationInView:self.view]];
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
