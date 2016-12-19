import React, { Component } from 'react';
import {
    AppRegistry,
    StyleSheet,
    Text,
    View
} from 'react-native'
import Zxing from 'Zxing'

class Barcode extends Component {
    render() {
        return (
            <View style={styles.container}>
                <Zxing text="Welcome to React Native!"
                    format="AZTEC"
                    style={styles.barcode} />
            </View>
        )
    }
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#F5FCFF',
    },
    barcode: {
        height: 300,
        width: 300,
        alignSelf: 'center'
    }
});

export default Barcode