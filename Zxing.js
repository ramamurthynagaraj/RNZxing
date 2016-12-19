import React, { PropTypes, Component } from 'react'
import {
    requireNativeComponent,
    View
} from 'react-native'


class Zxing extends Component {
    render() {
        return (<RNZxing {...this.props} />)
    }
}


Zxing.propTypes = Object.assign({}, View.propTypes, {
    text: PropTypes.string.isRequired,
    format: PropTypes.oneOf([
        'AZTEC', 'CODABAR', 'CODE_39', 'CODE_93',
        'CODE_128', 'DATA_MATRIX', 'EAN_8',
        'EAN_13', 'ITF', 'MAXICODE', 'PDF_417',
        'QR_CODE', 'RSS_14', 'RSS_EXPANDED',
        'UPC_A', 'UPC_E', 'UPC_EAN_EXTENSION']).isRequired,
    width: PropTypes.number,
    height: PropTypes.number
})

var RNZxing = requireNativeComponent('Zxing', Zxing)

module.exports = Zxing