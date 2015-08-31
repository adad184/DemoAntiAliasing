//
//  Example1Controller2.m
//  DemoAntiAliasing
//
//  Created by Ralph Li on 8/31/15.
//  Copyright © 2015 LJC. All rights reserved.
//

#import "Example2Controller.h"

@interface Example2Controller ()

@end

@implementation Example2Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *img = [self antiAlias:[UIImage imageNamed:@"test.jpg"]];
    
    for ( int i = 0 ; i < self.imageArray.count ; ++i )
    {
        UIImageView *imageView = self.imageArray[i];
        
        imageView.image = img;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImage*)antiAlias:(UIImage*)image
{
    int border = 1;
    CGRect rect = CGRectMake(border, border, image.size.width-2*border, image.size.height-2*border);
    UIImage *img = nil;
    
    UIGraphicsBeginImageContext(CGSizeMake(rect.size.width,rect.size.height));
    [image drawInRect:CGRectMake(-1, -1, image.size.width, image.size.height)];
    img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(image.size);
    [img drawInRect:rect];
    UIImage* antiImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return antiImage;
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
