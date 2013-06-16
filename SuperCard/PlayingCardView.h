//
//  PlayingCardView.h
//  SuperCard
//
//  Created by Mads Bielefeldt on 29/05/13.
//  Copyright (c) 2013 GN Resound. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView

@property (nonatomic) NSUInteger rank;
@property (strong, nonatomic) NSString *suit;

@property (nonatomic) BOOL faceUp;

- (void)pinch:(UIPinchGestureRecognizer *)gesture;

@end
