# react-native-zxing

A react native component to generate barcode.

## install
    - Pending to be published
`npm install react-native-zxing --save`
### IOs manual setup
    - Open your project workspace in xcode
    - Add node_modules/Zxing/Zxing.xcodeproj/project.pbxproj to Libraries
    - Add node_modules/Zxing/Carthage/Build/iOS/ZXingObjC.framework to frameworks
    - In Build Phases -> Link Binary With Libraries, Link the libZxing.a available in Libraries/Zxing.xcodeproj/Products folder
    - In Build Settings -> Search Paths -> Framework Search Paths, add `$(SRCROOT)/../node_modules/Zxing/Carthage` with recursive option
    - In General -> Embedded Binaries, Add ZXingObjC.framework

## Usage
```
import Zxing from 'Zxing'

class BarcodeComponent extends Component {

    render() {
        return (
            <View>
                <Zxing text="Text to be embedded in barcode"
                    style={{height: 200 width: 200}}/>
            </View>)
    }
}
```
## Props
 Name | Description | Default | Type
------|-------------|----------|-----------
text | text to be encoded in barcode - required | none | string
onColor | Pending| none | string
offColor | Pending | none | string
type | Pending | aztec - for now | string

## Custom styling
    - Height and Width can be controlled from style props, same as View.propTypes.style.

## P.S
Thanks to the react native community. PRs welcome.

## License
*MIT*
