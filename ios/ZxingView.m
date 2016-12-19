#import "ZxingView.h"
#import "RCTConvert.h"
#import <UIKit/UIKit.h>
#import "ZXingObjC/ZXingObjC.h"

@implementation ZxingView{
    UIImageView *_image;
    ZXBarcodeFormat _barCodeFormat;
    NSDictionary *_supportedBarCodeFormats;
    
    NSString *_text;
    int *_width;
    int *_height;
}

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _supportedBarCodeFormats = @{
                                     @"AZTEC": [NSNumber numberWithUnsignedInteger:kBarcodeFormatAztec],
                                     @"CODABAR": [NSNumber numberWithUnsignedInteger:kBarcodeFormatCodabar],
                                     @"CODE_39": [NSNumber numberWithUnsignedInteger:kBarcodeFormatCode39],
                                     @"CODE_93": [NSNumber numberWithUnsignedInteger:kBarcodeFormatCode93],
                                     @"CODE_128": [NSNumber numberWithUnsignedInteger:kBarcodeFormatCode128],
                                     @"DATA_MATRIX": [NSNumber numberWithUnsignedInteger:kBarcodeFormatDataMatrix],
                                     @"EAN_8": [NSNumber numberWithUnsignedInteger:kBarcodeFormatEan8],
                                     @"EAN_13": [NSNumber numberWithUnsignedInteger:kBarcodeFormatEan13],
                                     @"ITF": [NSNumber numberWithUnsignedInteger:kBarcodeFormatITF],
                                     @"MAXICODE": [NSNumber numberWithUnsignedInteger:kBarcodeFormatMaxiCode],
                                     @"PDF_417": [NSNumber numberWithUnsignedInteger:kBarcodeFormatPDF417],
                                     @"QR_CODE": [NSNumber numberWithUnsignedInteger:kBarcodeFormatQRCode],
                                     @"RSS_14": [NSNumber numberWithUnsignedInteger:kBarcodeFormatRSS14],
                                     @"RSS_EXPANDED": [NSNumber numberWithUnsignedInteger:kBarcodeFormatRSSExpanded],
                                     @"UPC_A": [NSNumber numberWithUnsignedInteger:kBarcodeFormatUPCA],
                                     @"UPC_E": [NSNumber numberWithUnsignedInteger:kBarcodeFormatUPCE],
                                     @"UPC_EAN_EXTENSION": [NSNumber numberWithUnsignedInteger:kBarcodeFormatUPCEANExtension]
                                     };

    }
    
    self.width = 200;
    self.height = 200;
    
    return self;
}

-(void)setText: (NSString *)text
{
    NSLog(@"In setText ");
    _text = text;
    [self removeImage];
}

-(void)setFormat: (NSString *)format
{
    _barCodeFormat = [_supportedBarCodeFormats[format] intValue];
    NSLog(@"Using barcode %d", _barCodeFormat);
}


-(void)setWidth:(int *)width
{
    NSLog(@"setWidth %d", width);
    _width = width;
    [self removeImage];
}

-(void)setHeight:(int *)height
{
    NSLog(@"setHeight %d", height);
    _height = height;
    [self removeImage];
}

-(void) removeImage
{
    if (_image) {
        [_image removeFromSuperview];
    }
}

-(void)layoutSubviews
{
    NSLog(@"In layoutSubviews");
    [super layoutSubviews];
    NSError *zebraError = nil;
    ZXEncodeHints *hints = [ZXEncodeHints hints];
    hints.encoding = NSUTF8StringEncoding;
    ZXMultiFormatWriter *writer = [ZXMultiFormatWriter writer];
    UIColor *onUIColor = [UIColor colorWithWhite:0.0 alpha:1.0];
    UIColor *offUIColor = [UIColor colorWithWhite:1.0 alpha:1.0];
    
    ZXBitMatrix *bitMatrix = [writer encode:_text format:_barCodeFormat width:_width height:_height hints:hints error:&zebraError];
    ZXImage *zebraImage = [ZXImage imageWithMatrix:bitMatrix onColor:onUIColor.CGColor offColor:offUIColor.CGColor];
    UIImage *image = [UIImage imageWithCGImage:zebraImage.cgimage];
    
    _image = [[UIImageView alloc] init];
    [_image setImage:image];
    _image.frame = self.bounds;
    
    [self insertSubview:_image atIndex:0];
}
@end
