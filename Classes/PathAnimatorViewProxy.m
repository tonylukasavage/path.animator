#import "PathAnimatorViewProxy.h"
#import "PathAnimatorView.h"

@implementation PathAnimatorViewProxy

-(void)rotate:(id)args
{
    PathAnimatorView *iv = (PathAnimatorView*)[self view];
    [iv rotate:[args objectAtIndex:0]];
}

@end
