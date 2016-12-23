# react-native-zxing

A react native component to generate barcode.

## install
* Pending to be published
`npm install react-native-zxing --save`

### iOS manual setup

* Open your project workspace in xcode
* Add node_modules/Zxing/ios/Zxing.xcodeproj/project.pbxproj to Libraries
* Add node_modules/Zxing/ios/Carthage/Build/iOS/ZXingObjC.framework to frameworks
* In Build Phases -> Link Binary With Libraries, Link the libZxing.a available in Libraries/Zxing.xcodeproj/Products folder
* In Build Settings -> Search Paths -> Framework Search Paths, add `$(SRCROOT)/../node_modules/Zxing/ios/Carthage` with recursive option
* On Project target -> General -> Embedded Binaries, Add ZXingObjC.framework
    
### Android manual setup
* Open settings.gradle in the android application and reference to Zxing node module as shown below
```
include ':rnzxing'
project(':rnzxing').projectDir = new File(rootProject.projectDir, '../node_modules/Zxing/android')
``` 
* Add ZXing and rnzxing to dependecies in build.gradle of the app
```
dependencies {
    compile project(':rnzxing')
    // https://mvnrepository.com/artifact/com.google.zxing/core
    compile group: 'com.google.zxing', name: 'core', version: '3.3.0'
```
* Add ZxingPackage to react native package

```
protected List<ReactPackage> getPackages() {
    return Arrays.<ReactPackage>asList(
        ...
        new ZxingPackage()
    );
}
```

## Usage
```
import Zxing from 'Zxing'

class BarcodeComponent extends Component {

    render() {
        return (
            <View>
                <Zxing text="Text to be embedded in barcode"
                    format="AZTEC"
                    style={{height: 200 width: 200}}/>
            </View>)
    }
}
```
## Props
 Name | Description | Default | Type
------|-------------|----------|-----------
text | text to be encoded in barcode - required | none | string
format | Format of the barcode - required | - |  'AZTEC', 'CODABAR', 'CODE_39', 'CODE_93','CODE_128', 'DATA_MATRIX', 'EAN_8','EAN_13', 'ITF', 'MAXICODE', 'PDF_417','QR_CODE', 'RSS_14', 'RSS_EXPANDED', 'UPC_A', 'UPC_E', 'UPC_EAN_EXTENSION'
width | width of barcode | 200 | int
height | height of barcode | 200 | int

## Custom styling
    - Height and Width can be controlled from style props, same as View.propTypes.style.

## P.S
Thanks to the react native community. PRs welcome.

## License
*MIT*
