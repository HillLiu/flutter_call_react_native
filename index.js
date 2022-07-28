import React from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View
} from 'react-native';

const MyReactNativeApp = () => {
  return (
    <View style={styles.container}>
      <Text style={styles.hello}>
        Hello World 
      </Text>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#FFFFFF'
  },
  hello: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10
  },
});

// Module name
AppRegistry.registerComponent('MyReactNativeApp', () => MyReactNativeApp);
