//
//  ViewController.m
//  DemoAntiAliasing
//
//  Created by Ralph Li on 8/31/15.
//  Copyright © 2015 LJC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"???");
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    
    NSMutableArray *array = [@[] mutableCopy];
    for ( int i = 0 ; i < 500; ++i )
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        imageView.center = CGPointMake(screenWidth/2, screenWidth/2);
        imageView.image = [UIImage imageNamed:@"test.jpg"];
        [self.view addSubview:imageView];
        
        [array addObject:imageView];
        
        imageView.layer.transform = CATransform3DRotate(CATransform3DIdentity, M_PI/12, 0, 0, 1);
    }
    self.imageArray = array;
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    CFTimeInterval beginTime = CACurrentMediaTime();
    for ( int i = 0 ; i < self.imageArray.count ; ++i )
    {
        UIImageView *imageView = self.imageArray[self.imageArray.count-i-1];
        
        CABasicAnimation *rotate = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotate.toValue = @(M_PI*2);
        rotate.duration = 10;
        rotate.beginTime = beginTime + rotate.duration*i/self.imageArray.count;
        rotate.repeatCount = HUGE_VALF;
        
        [imageView.layer addAnimation:rotate forKey:@"rotate"];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    
    for ( UIImageView *imageView in self.imageArray )
    {
        [imageView.layer removeAllAnimations];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
