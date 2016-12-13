var ReactNative = require('react-native');
var React = require('react');
var {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  requireNativeComponent,
} = ReactNative;

var Zxing = React.createClass({
    propTypes: {
        ...View.propTypes,
        text: React.PropTypes.string,
    },
    render() {
        return <RNZxing {...this.props} />;
    }
});

var RNZxing = requireNativeComponent('Zxing', Zxing);

module.exports = Zxing;
