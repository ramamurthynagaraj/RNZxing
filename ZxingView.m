#import "ZxingView.h"
#import "RCTConvert.h"
#import <UIKit/UIKit.h>
#import "ZXingObjC/ZXingObjC.h"

@implementation ZxingView{
    UIImageView *_image;
    NSString *_onColor;
    NSString *_offColor;
    NSString *_text;
}

-(void)setText: (NSString *)text
{
    if (_image) {
        [_image removeFromSuperview];
    }
    _text = text;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    NSError *zebraError = nil;
    ZXEncodeHints *hints = [ZXEncodeHints hints];
    hints.encoding = NSUTF8StringEncoding;
    ZXMultiFormatWriter *writer = [ZXMultiFormatWriter writer];
    UIColor *onUIColor = [UIColor colorWithWhite:0.0 alpha:1.0];
    UIColor *offUIColor = [UIColor colorWithWhite:1.0 alpha:1.0];
    
    ZXBitMatrix *bitMatrix = [writer encode:_text format:kBarcodeFormatAztec width:200 height:200 hints:hints error:&zebraError];
    ZXImage *zebraImage = [ZXImage imageWithMatrix:bitMatrix onColor:onUIColor.CGColor offColor:offUIColor.CGColor];
    UIImage *image = [UIImage imageWithCGImage:zebraImage.cgimage];
    
    _image = [[UIImageView alloc] init];
    [_image setImage:image];
    _image.frame = self.bounds;
    
    [self insertSubview:_image atIndex:0];
}
@end
