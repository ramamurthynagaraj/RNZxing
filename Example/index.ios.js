/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
	AppRegistry,
	View
} from 'react-native'
import Barcode from './barcode'
export default class Example extends Component {
	render() {
		return (
			<Barcode />
		);
	}
}

AppRegistry.registerComponent('Example', () => Example);
