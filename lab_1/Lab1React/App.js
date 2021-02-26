import { StatusBar } from 'expo-status-bar';
import React from 'react';
import { Text, SafeAreaView, StyleSheet, View, Image, TouchableOpacity, TextInput } from 'react-native';

export default function App() {
	
  return (
  <>
	<StatusBar backgroundColor='#265B5F' />
	<SafeAreaView>
		<View style={styles.appBar}> 
			<Text style={styles.appBarText}>Example 1</Text>
		</View>
		<View style={styles.imageRow}>
			<Image source={require('./chart.png')} />
		</View>
		<View style={styles.buttonLayout}>
			<TouchableOpacity style={styles.button}>
				<Text style={styles.buttonText}> BUTTON </Text>
			</TouchableOpacity>
			
			<TouchableOpacity style={styles.button}>
				<Text style={styles.buttonText}> BUTTON </Text>
			</TouchableOpacity>
			
		</View>
		<View style={styles.buttonLayout}>
			<TouchableOpacity style={styles.button}>
				<Text style={styles.buttonText}> BUTTON </Text>
			</TouchableOpacity>
			
			<TouchableOpacity style={styles.button}>
				<Text style={styles.buttonText}> BUTTON </Text>
			</TouchableOpacity>
		</View>
		<View style={styles.inputField}>
			<Text>Email</Text>
			<TextInput style={styles.emailInput} selectionColor={'mediumvioletred'} />
		</View>
	</SafeAreaView>
    </>
  );
}

const styles = StyleSheet.create({
	appBar: {	
		height: 70,
		backgroundColor: `teal`,
		flexDirection: 'row',
		justifyContent: 'flex-start',
		alignItems: 'center',
		marginTop: 20,
	},
	appBarText: {
		fontSize: 20,
		fontWeight: 'bold',
		color: 'white',
		marginStart: 10,
		marginTop: 10	
  },
  imageRow: {
	  alignItems: 'center',
  },
  buttonLayout: {
	  flexDirection: 'row',
	  justifyContent: 'space-evenly',
	  marginTop: 50,
  },
  button: {
	  backgroundColor: '#D3D3D3',
	  alignItems: 'center',
	  padding: 10,
  },
  buttonText: {
	  color: 'black',
  },
  inputField: {
	  margin: 20,
	  height: 40,
	  flexDirection: 'row',
	  alignItems: 'center',	  
	  justifyContent: 'space-evenly',
	  marginTop: 50,
  },
  emailInput: {
	  flexGrow: .7,
	  fontSize: 12,
	  borderColor: 'mediumvioletred',
	  borderBottomWidth: 1,
  },
  
});
