//
//  HomePageViewController.h
//  Conect
//
//  Created by Bharat Mahajan on 10/31/16.
//  Copyright © 2016 Bharat Mahajan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomePageViewController : UIViewController<UIGestureRecognizerDelegate>

- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer;

@end
