Class {
	#name : #DeclensionPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'tabContentPresenters'
	],
	#category : #LatinGrammar
}

{ #category : #layout }
DeclensionPresenter >> defaultLayout [ 
	^ SpTabLayout new
		add: (tabContentPresenters at: 1) label:'1st';
		add: (tabContentPresenters at: 2) label:'2nd';
		add: (tabContentPresenters at: 3) label:'3rd';
		add: (tabContentPresenters at: 4) label:'3rd i';
		add: (tabContentPresenters at: 5) label:'4th';
		add: (tabContentPresenters at: 6) label:'5th'. 
]

{ #category : #initialization }
DeclensionPresenter >> initializePresenters [ 

	| grammarData |
	
	grammarData := NeoJSONReader fromString: '{"1st":{"genders":["female"],"female":{"singular":{"nom":"a","gen":"ae","dat":"ae","acc":"am","abl":"ā"},"plural":{"nom":"ae","gen":"ārum","dat":"īs","acc":"ās","abl":"īs"}}},"2nd":{"genders":["male","neuter"],"male":{"singular":{"nom":"us","gen":"ī","dat":"ō","acc":"um","abl":"ō"},"plural":{"nom":"ī","gen":"ōrum","dat":"īs","acc":"ōs","abl":"īs"}},"neuter":{"singular":{"nom":"um","gen":"ī","dat":"ō","acc":"um","abl":"ō"},"plural":{"nom":"a","gen":"ōrum","dat":"īs","acc":"a","abl":"īs"}}},"3rd":{"genders":["male","neuter"],"male":{"singular":{"nom":"","gen":"is","dat":"ī","acc":"em","abl":"e"},"plural":{"nom":"ēs","gen":"um","dat":"ibus","acc":"ēs","abl":"ibus"}},"neuter":{"singular":{"nom":"","gen":"is","dat":"ī","acc":"","abl":"e"},"plural":{"nom":"a","gen":"um","dat":"ibus","acc":"a","abl":"ibus"}}},"3rdi":{"genders":["male","neuter"],"male":{"singular":{"nom":"is","gen":"is","dat":"ī","acc":"em","abl":"e"},"plural":{"nom":"ēs","gen":"ium","dat":"ibus","acc":"ēs","abl":"ibus"}},"neuter":{"singular":{"nom":"e","gen":"is","dat":"ī","acc":"e","abl":"ī"},"plural":{"nom":"ia","gen":"ium","dat":"ibus","acc":"ia","abl":"ibus"}}},"4th":{"genders":["male","neuter"],"male":{"singular":{"nom":"us","gen":"ūs","dat":"uī","acc":"um","abl":"ū"},"plural":{"nom":"ūs","gen":"uum","dat":"ibus","acc":"ūs","abl":"ibus"}},"neuter":{"singular":{"nom":"ū","gen":"ūs","dat":"ū","acc":"ū","abl":"ū"},"plural":{"nom":"ua","gen":"uum","dat":"ibus","acc":"ua","abl":"ibus"}}},"5th":{"genders":["female","male"],"female":{"singular":{"nom":"ēs","gen":"eī","dat":"eī","acc":"em","abl":"ē"},"plural":{"nom":"ēs","gen":"ērum","dat":"ēbus","acc":"ēs","abl":"ēbus"}},"male":{"singular":{"nom":"ēs","gen":"ēī","dat":"ēī","acc":"em","abl":"ē"},"plural":{"nom":"ēs","gen":"ērum","dat":"ēbus","acc":"ēs","abl":"ēbus"}}}}'.

	tabContentPresenters := { 
		(DeclensionTabContentPresenter forCase: (grammarData at: '1st')) .
		(DeclensionTabContentPresenter forCase: (grammarData at: '2nd')) .
		(DeclensionTabContentPresenter forCase: (grammarData at: '3rd')) .
		(DeclensionTabContentPresenter forCase: (grammarData at: '3rdi')) .
		(DeclensionTabContentPresenter forCase: (grammarData at: '4th')) .
		(DeclensionTabContentPresenter forCase: (grammarData at: '5th')) 
	}
]

{ #category : #initialization }
DeclensionPresenter >> initializeWindow: aWindowPresenter [
	aWindowPresenter 
		title: 'Latin Declensions';
		initialExtent: 400@300.
]

{ #category : #initialization }
DeclensionPresenter >> tabContentPresenters [
	^ tabContentPresenters 
]
