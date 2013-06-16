//
//  SuperCardViewController.m
//  SuperCard
//
//  Created by Mads Bielefeldt on 29/05/13.
//  Copyright (c) 2013 GN Resound. All rights reserved.
//

#import "SuperCardViewController.h"
#import "PlayingCardView.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@interface SuperCardViewController ()

@property (weak, nonatomic) IBOutlet PlayingCardView *playingCardView;

@property (strong, nonatomic) Deck *deck;

@end

@implementation SuperCardViewController

- (Deck *)deck
{
    if (!_deck) _deck = [[PlayingCardDeck alloc] init];
    return _deck;
}

- (void)drawRandomPlayingCard
{
    Card *card = [self.deck drawRandomCard];
    if ([card isKindOfClass:[PlayingCard class]])
    {
        PlayingCard *playingCard = (PlayingCard *)card;
        self.playingCardView.rank = playingCard.rank;
        self.playingCardView.suit = playingCard.suit;
    }
}

- (void)setPlayingCard:(PlayingCardView *)playingCardView
{
    _playingCardView = playingCardView;
    
    [self drawRandomPlayingCard];
    
    [playingCardView addGestureRecognizer:[[UIPinchGestureRecognizer alloc] initWithTarget:playingCardView action:@selector(pinch:)]];
}

- (IBAction)swipe:(UISwipeGestureRecognizer *)sender
{
    [UIView transitionWithView:self.playingCardView
                      duration:0.5
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        if (!self.playingCardView.faceUp) {
                            [self drawRandomPlayingCard];                            
                        }
                        self.playingCardView.faceUp = !self.playingCardView.faceUp;
                    }
                    completion:nil];
}

@end
