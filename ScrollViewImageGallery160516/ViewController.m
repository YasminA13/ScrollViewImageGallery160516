//
//  ViewController.m
//  ScrollViewImageGallery160516
//
//  Created by Yasmin Ahmad on 2016-05-16.
//  Copyright © 2016 YasminA. All rights reserved.
//

#import "ViewController.h"
#import "NewViewController.h"



@interface ViewController () <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *lighthouse;
@property (strong, nonatomic) UIImageView *lighthouseNight;
@property (strong, nonatomic) UIImageView *lighthouseField;
@property (strong, nonatomic) NSArray *imageArray;
@property NSInteger imageSelected;


@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    [self setUpImages];
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self prepareGestureRecognizers];
    
}

-(void)setUpImages{
    
    self.lighthouseNight = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Lighthouse-night.jpg"]];
    self.lighthouseField = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Lighthouse-in-Field.jpg"]];
    self.lighthouse = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Lighthouse.jpg"]];
    NSArray *imageArray = @[self.lighthouseNight, self.lighthouseField, self.lighthouse];
    self.imageArray = imageArray;

    CGFloat nextX = 0;
    CGFloat totalWidth = 0;
    CGFloat maxHeight = 0;
    for (UIImageView *imgView in imageArray) {
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        [self.scrollView addSubview:imgView];
        imgView.frame = CGRectMake(nextX, 0,
                                   CGRectGetWidth(imgView.frame),
                                   CGRectGetHeight(imgView.frame));
        nextX += imgView.frame.origin.x;
        totalWidth += CGRectGetWidth(imgView.frame);
        maxHeight = MAX(maxHeight, CGRectGetHeight(imgView.frame));
    }
    self.scrollView.contentSize = CGSizeMake(totalWidth, maxHeight);
//    self.lighthouseNight.tag = 0;
//    self.lighthouseField.tag = 1;
//    self.lighthouse.tag = 2;
//
//    [self.lighthouse setContentMode:UIViewContentModeScaleAspectFit];
//    [self.lighthouseField setContentMode:UIViewContentModeScaleAspectFit];
//    [self.lighthouseNight setContentMode:UIViewContentModeScaleAspectFit];
//    
//    
//    [self.scrollView addSubview:self.lighthouseNight];
//    [self.scrollView addSubview:self.lighthouseField];
//    [self.scrollView addSubview:self.lighthouse];
//    
//    self.lighthouseNight.frame = CGRectMake(0, 0, self.lighthouseNight.frame.size.width, self.lighthouseNight.frame.size.height);
//    self.lighthouseField.frame = CGRectMake(self.lighthouseNight.frame.size.width, 0, self.lighthouseField.frame.size.width, self.lighthouseField.frame.size.height);
//    self.lighthouse.frame = CGRectMake(self.lighthouseField.frame.size.width + self.lighthouseNight.frame.size.width, 0, self.lighthouse.frame.size.width, self.lighthouse.frame.size.height);

//    self.scrollView.contentSize = CGSizeMake(self.lighthouseNight.bounds.size.width + self.lighthouseField.bounds.size.width + self.lighthouse.bounds.size.width, MAX (MAX(self.lighthouse.bounds.size.height, self.lighthouseNight.bounds.size.height), self.lighthouseField.bounds.size.height));
}

-(void)prepareGestureRecognizers{
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImage:)];
    
    [self.scrollView addGestureRecognizer:tapGesture];
    
}

-(void)tapImage:(UITapGestureRecognizer*)sender{
    
    CGPoint location = [sender locationInView:self.scrollView];
    NSLog(@"%f %f", location.x, location.y);

    for (UIImageView *img in self.imageArray) {
        if (CGRectContainsPoint(img.frame, location)) {
            [self performSegueWithIdentifier:@"ShowDetail" sender:img];
        }
    }
//    if (location.x < 1591) {
//        self.imageSelected = 0;
//    }
//    else if (location.x > 1591 && location.x < 3515){
//        self.imageSelected = 1;
//    }
//    else if (location.x > 3515){
//        self.imageSelected = 2;
//    }
//    NSLog(@"Image selected: %ld", (long)self.imageSelected);
//    
//    [self performSegueWithIdentifier:@"ShowDetail" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
        if ([[segue identifier] isEqualToString:@"ShowDetail"]) {

            NewViewController *nVC = [segue destinationViewController];
            UIImageView *detailImage = sender; //self.imageArray[self.imageSelected];
            nVC.scrollImage = detailImage;
    
        }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
