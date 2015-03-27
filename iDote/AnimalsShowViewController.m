//
//  AnimalsShowViewController.m
//  iDote
//
//  Created by Jonathan Andrade on 24/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "AnimalsShowViewController.h"
#import "CardView.h"

@interface AnimalsShowViewController () <UITextFieldDelegate>
@property (nonatomic) UISwipeGestureRecognizer *swipeLeftRecognizer;
@property (nonatomic) UISwipeGestureRecognizer *swipeRightRecognizer;

@property CardView* cardView;
@end

@implementation AnimalsShowViewController

-(void)viewDidLoad {
    [super viewDidLoad];    
    
    _swipeLeftRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                     action:@selector(swipeLeftHandler:)];
    [_swipeLeftRecognizer setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:_swipeLeftRecognizer];
    
    _swipeRightRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                      action:@selector(swipeRightHandler:)];
    [_swipeRightRecognizer setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:_swipeRightRecognizer];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(tapCenter:)
                                                 name:@"TapCenter"
                                               object:nil];
}

-(IBAction)backFromRegisterAnimal:(UIStoryboardSegue *)sender {
    
}

- (void) tapCenter:(NSNotification *) notification {
    Animal *animal = (Animal *)notification.object;
    [self performSegueWithIdentifier:@"ShowAnimalSegue" sender:animal];
}


- (void) swipeLeftHandler:(UISwipeGestureRecognizer *)gesture {
    NSLog(@"Swipe Left");
    [_cardView swipeLeft];
}
- (void) swipeRightHandler:(UISwipeGestureRecognizer *)gesture {
    NSLog(@"Swipe Right");
    [_cardView swipeRight];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowAnimalSegue"]) {
        
    }

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _cardView = [[CardView alloc] init];
    _cardView.frame = self.view.frame;
    [self.view addSubview:_cardView];
    
}

- (IBAction)touchDownBackground:(id)sender {
    [self.view endEditing:YES];
}

@end
