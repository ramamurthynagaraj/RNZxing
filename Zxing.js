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
    format: PropTypes.string.isRequired,
    width: PropTypes.number,
    height: PropTypes.number
})

var RNZxing = requireNativeComponent('Zxing', Zxing)

module.exports = Zxing