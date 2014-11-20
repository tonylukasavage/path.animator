#import "PathAnimatorView.h"
#import "UIModule.h"
#import <QuartzCore/QuartzCore.h>

@implementation PathAnimatorView

-(void)rotate:(id)args
{
    ENSURE_UI_THREAD(rotate, args);

    NSString *timingFunction = kCAMediaTimingFunctionDefault;
    int t = [[args objectForKey:@"timingFunction"] intValue];
    switch (t) {
        case UIViewAnimationCurveEaseInOut:
            timingFunction = kCAMediaTimingFunctionEaseInEaseOut;
            break;
        case UIViewAnimationCurveEaseIn:
            timingFunction = kCAMediaTimingFunctionEaseIn;
            break;
        case UIViewAnimationCurveEaseOut:
            timingFunction = kCAMediaTimingFunctionEaseOut;
            break;
        case UIViewAnimationCurveLinear:
            timingFunction = kCAMediaTimingFunctionLinear;
            break;
        default:
            timingFunction = kCAMediaTimingFunctionDefault;
            break;
    }
    
    float delay = [[args objectForKey:@"delay"] floatValue] / 1000.0;
    float duration = [[args objectForKey:@"duration"] floatValue] / 1000.0;
    float angle = [[args objectForKey:@"angle"] floatValue] * M_PI / 180.0;
    float repeat = [[args objectForKey:@"repeat"] floatValue];

    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:angle];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = repeat;
    rotationAnimation.fillMode = kCAFillModeForwards;
    rotationAnimation.beginTime = CACurrentMediaTime() + delay;    
    
    [self.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

@end
