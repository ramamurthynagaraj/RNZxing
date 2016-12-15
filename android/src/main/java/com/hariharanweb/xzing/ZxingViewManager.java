package com.hariharanweb.xzing;

import android.graphics.Bitmap;
import android.util.Log;
import android.widget.ImageView;
import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.annotations.ReactProp;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;

import java.util.EnumMap;
import java.util.Map;

public class ZxingViewManager extends SimpleViewManager<ImageView> {
    private static final int WHITE = 0xFFFFFFFF;
    private static final int BLACK = 0xFF000000;
    private static final String TAG = "ZxingViewManager";
    private static final String NAME = "Zxing";

    private String text;
    private String format;
    private float width = 300;
    private float height = 300;

    @Override
    public String getName() {
        return NAME;
    }

    @Override
    protected ImageView createViewInstance(ThemedReactContext reactContext) {
        Log.d(TAG, "createViewInstance");
        ImageView iv = new ImageView(reactContext);
        return iv;
    }

    @ReactProp(name = "text")
    public void setText(ImageView view, String text) {
        Log.d(TAG, "setText ********");
        this.text = text;
        setBarcode(view);
    }

    @ReactProp(name = "format")
    public void setFormat(ImageView view, String format) {
        Log.d(TAG, "setFormat " + format);
        this.format = format;
        setBarcode(view);
    }

    @ReactProp(name = "width", defaultInt = 300)
    public void setWidth(ImageView view, int width) {
        Log.d(TAG, "setWidth " + width);
        this.width = width;
        setBarcode(view);
    }

    @ReactProp(name = "height", defaultInt = 300)
    public void setHeight(ImageView view, int height) {
        Log.d(TAG, "setHeight " + height);
        this.height = height;
        setBarcode(view);
    }

    private void setBarcode(ImageView imageView) {
        if (this.text == null || this.format == null)
            return;
        BarcodeFormat barcodeFormat = getFormat(this.format);
        try {
            Bitmap bitmap = encodeAsBitmap(this.text, barcodeFormat, (int) this.width, (int) this.height);
            imageView.setImageBitmap(bitmap);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private BarcodeFormat getFormat(String format) {
        return BarcodeFormat.valueOf(format);
    }

    private Bitmap encodeAsBitmap(String contents, BarcodeFormat format, int img_width, int img_height) throws Exception {
        Log.d(TAG, String.format("Creating barcode with format: %s width: %d height: %d", format, img_width, img_height));
        String contentsToEncode = contents;
        if (contentsToEncode == null) {
            return null;
        }
        Map<EncodeHintType, Object> hints = null;
        String encoding = guessAppropriateEncoding(contentsToEncode);
        if (encoding != null) {
            hints = new EnumMap<EncodeHintType, Object>(EncodeHintType.class);
            hints.put(EncodeHintType.CHARACTER_SET, encoding);
        }
        MultiFormatWriter writer = new MultiFormatWriter();
        BitMatrix result;
        try {
            result = writer.encode(contentsToEncode, format, img_width, img_height, hints);
        } catch (IllegalArgumentException iae) {
            throw new Exception("Unsupported barcode format");
        }
        int width = result.getWidth();
        int height = result.getHeight();
        int[] pixels = new int[width * height];
        for (int y = 0; y < height; y++) {
            int offset = y * width;
            for (int x = 0; x < width; x++) {
                pixels[offset + x] = result.get(x, y) ? BLACK : WHITE;
            }
        }

        Bitmap bitmap = Bitmap.createBitmap(width, height,
                Bitmap.Config.ARGB_8888);
        bitmap.setPixels(pixels, 0, width, 0, 0, width, height);
        return bitmap;
    }

    private static String guessAppropriateEncoding(CharSequence contents) {
        // Very crude at the moment
        for (int i = 0; i < contents.length(); i++) {
            if (contents.charAt(i) > 0xFF) {
                return "UTF-8";
            }
        }
        return null;
    }
}
