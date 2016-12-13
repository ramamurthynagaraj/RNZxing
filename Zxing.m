#import "Zxing.h"
#import "ZxingView.h"

@implementation Zxing

RCT_EXPORT_MODULE()

- (RCTView *)view
{
    return [[ZxingView alloc] init];
}

RCT_EXPORT_VIEW_PROPERTY(text, NSString);

@end
