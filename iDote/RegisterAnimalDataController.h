//
//  RegisterAnimalDataController.h
//  iDote
//
//  Created by Jonathan Andrade on 23/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Animal.h"

@interface RegisterAnimalDataController : UIViewController

@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *labelIdade;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedGenero;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedPorte;


@end