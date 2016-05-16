//
//  NewViewController.m
//  ScrollViewImageGallery160516
//
//  Created by Yasmin Ahmad on 2016-05-16.
//  Copyright © 2016 YasminA. All rights reserved.
//

#import "NewViewController.h"

@interface NewViewController () <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *secondScrollView;
@property (strong, nonatomic) UITapGestureRecognizer *tap;

@end


@implementation NewViewController

-(void)viewDidLoad{
    
    [super viewDidLoad];
    if (self.scrollImage){
    [self.scrollImage setContentMode:UIViewContentModeScaleAspectFill];
    [self.secondScrollView addSubview:self.scrollImage];
    self.scrollImage.frame = CGRectMake(0, 0, self.scrollImage.frame.size.width, self.scrollImage.frame.size.height);
    
    
    self.secondScrollView.contentSize = CGSizeMake(self.scrollImage.bounds.size.width, MAX (MAX(self.scrollImage.bounds.size.height, self.scrollImage.bounds.size.height), self.scrollImage.bounds.size.height));

    }
    
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    
    return self.scrollImage;
}



@end
