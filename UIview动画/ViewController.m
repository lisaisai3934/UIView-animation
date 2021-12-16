//
//  ViewController.m
//  UIview动画
//
//  Created by bytedance on 2021/12/16.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)UIView *animationView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _animationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    _animationView.backgroundColor = [UIColor systemPinkColor];
    [self.view addSubview:_animationView];
}
-(void)viewDidAppear:(BOOL)animated{
    [self startAnimation];
}
- (void) startAnimation {
    [UIView beginAnimations:@"UIViewAnimation" context:(__bridge void *)(self)];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationDelay:0.0];
    [UIView setAnimationRepeatCount:2];
    [UIView setAnimationRepeatAutoreverses:YES];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(complete)];
    _animationView.center = CGPointMake(CGRectGetMaxX(self.view.bounds) - self.animationView.bounds.size.width * 0.5, CGRectGetMidY(self.view.bounds));
    [UIView commitAnimations];
}
-(void)complete{
    NSLog(@"动画结束");
}
@end
