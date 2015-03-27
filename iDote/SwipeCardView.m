//
//  SwipeCardView.m
//  Tinder Navigation Test
//
//  Created by Adriano Soares on 21/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "SwipeCardView.h"

@interface SwipeCardView()
@property UIImageView *imageView;
@property UIView *labelView;
@property UILabel *labelName;
@end


@implementation SwipeCardView


- (id)initWithData:(Animal *)data
{
    self = [super init];
    if (!self) return nil;
    
    animationTime = 0.2;
    _data = data;
    self.backgroundColor = [UIColor greenColor];
    self.clipsToBounds = YES;
    self.autoresizesSubviews = YES;
    self.contentMode = UIViewContentModeScaleAspectFill;
    [self loadImageAndStyle];
    
    
    return self;
}

- (void)loadImageAndStyle
{
    NSURL *imageURL = [[NSURL alloc] initWithString:_data.mainImageURL];
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"300"]];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^{
        NSData *data = [NSData dataWithContentsOfURL:imageURL];
        UIImage *image = [UIImage imageWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            _imageView.image = image;
        });
    });
    
    [self addSubview:_imageView];
    
    _labelView = [[UIView alloc] init];
    _labelView.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:_labelView];
    
    _labelName = [[UILabel alloc] init];
    _labelName.text = _data.nome;
    _labelName.textColor = [UIColor darkTextColor];
    _labelName.font = [UIFont systemFontOfSize:14];
    
    [_labelView addSubview:_labelName];
    
    [self.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.layer setBorderWidth:0.5f];
    self.layer.cornerRadius = 0.5;
    self.layer.shadowOffset = CGSizeMake(7, 7);
    self.layer.shadowRadius = 5;
    self.layer.shadowOpacity = 0.5;
}

- (void) moveLeft {
    switch (_position) {
            
        case SwipeCardPositionCenter: {
            _position = SwipeCardPositionLeft;
            [UIView animateWithDuration:animationTime
                             animations:^{
                                 self.center = CGPointMake(0 - self.superview.frame.size.width * 0.3,
                                                           self.center.y);
                             }];
            
            break;
        }
        case SwipeCardPositionRight: {
            _position = SwipeCardPositionCenter;
            [UIView animateWithDuration:animationTime
                             animations:^{
                                 self.center = self.superview.center;
                             }];
            
            break;
        }
        case SwipeCardPositionLeft: {
            [self removeFromSuperview];
            NSLog(@"REmove");
            break;
        }
    }
    
}

- (void) moveRight {
    switch (_position) {
        case SwipeCardPositionCenter: {
            _position = SwipeCardPositionRight;
            [UIView animateWithDuration:animationTime
                             animations:^{
                                 self.center = CGPointMake(self.superview.frame.size.width *1.3,
                                                           self.center.y);
                             }];
            break;
        }
        case SwipeCardPositionLeft: {
            _position = SwipeCardPositionCenter;
            [UIView animateWithDuration:animationTime
                             animations:^{
                                 self.center = self.superview.center;
                             }];
            break;
        }
            
        case SwipeCardPositionRight: {
            NSLog(@"REmove");
            [self removeFromSuperview];
            break;
        }
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _imageView.clipsToBounds = YES;
    _imageView.backgroundColor = [UIColor lightGrayColor];
    _imageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.width);
    _imageView.autoresizesSubviews = YES;
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    _labelView.clipsToBounds = YES;
    _labelView.frame = CGRectMake(0, self.frame.size.width, self.frame.size.width, self.frame.size.height*0.20);
    
    NSDictionary *fontAtrtibutes = @{NSFontAttributeName: [UIFont systemFontOfSize:14]};

    CGRect rect = [_labelName.text
                   boundingRectWithSize:CGSizeMake(_labelView.superview.frame.size.width*0.8, CGFLOAT_MAX)
                   options:NSStringDrawingUsesLineFragmentOrigin
                   attributes:fontAtrtibutes
                   context:nil];
    
    _labelName.frame = CGRectMake(_labelName.superview.frame.size.width * 0.05,
                                  _labelName.superview.frame.size.height *0.1,
                                  rect.size.width,
                                  rect.size.height);
    
    _labelName.center = CGPointMake(_labelName.superview.center.x, _labelName.center.y);
   // _labelName.center = _label
    
}
- (void)dealloc {
}


@end
