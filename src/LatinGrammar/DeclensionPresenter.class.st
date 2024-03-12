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

" This belongs to the class and not the instance. Either here or the TabContent class."
	grammarData := NeoJSONReader fromString: '{"1st":{"genders":["female"],"female":{"wordlist":[{"word":"aqua","rootword":"aqu","english":"water"}],"singular":{"nom":"a","gen":"ae","dat":"ae","acc":"am","abl":"ā"},"plural":{"nom":"ae","gen":"ārum","dat":"īs","acc":"ās","abl":"īs"}}},"2nd":{"genders":["male","neuter"],"male":{"wordlist":[{"word":"servus","rootword":"serv","english":"slave"}],"singular":{"nom":"us","gen":"ī","dat":"ō","acc":"um","abl":"ō"},"plural":{"nom":"ī","gen":"ōrum","dat":"īs","acc":"ōs","abl":"īs"}},"neuter":{"wordlist":[{"word":"dōnum","rootword":"dōn","english":"gift"}],"singular":{"nom":"um","gen":"ī","dat":"ō","acc":"um","abl":"ō"},"plural":{"nom":"a","gen":"ōrum","dat":"īs","acc":"a","abl":"īs"}}},"3rd":{"genders":["male","neuter"],"male":{"wordlist":[{"word":"rēx","rootword":"rēg","english":"king"}],"singular":{"nom":"","gen":"is","dat":"ī","acc":"em","abl":"e"},"plural":{"nom":"ēs","gen":"um","dat":"ibus","acc":"ēs","abl":"ibus"}},"neuter":{"wordlist":[{"word":"corpus","rootword":"corpor","english":"body"}],"singular":{"nom":"","gen":"is","dat":"ī","acc":"","abl":"e"},"plural":{"nom":"a","gen":"um","dat":"ibus","acc":"a","abl":"ibus"}}},"3rdi":{"genders":["male","neuter"],"male":{"wordlist":[{"word":"cīvis","rootword":"cīv","english":"citizen"}],"singular":{"nom":"is","gen":"is","dat":"ī","acc":"em","abl":"e"},"plural":{"nom":"ēs","gen":"ium","dat":"ibus","acc":"ēs","abl":"ibus"}},"neuter":{"wordlist":[{"word":"mare","rootword":"mar","english":"sea"}],"singular":{"nom":"e","gen":"is","dat":"ī","acc":"e","abl":"ī"},"plural":{"nom":"ia","gen":"ium","dat":"ibus","acc":"ia","abl":"ibus"}}},"4th":{"genders":["male","neuter"],"male":{"wordlist":[{"word":"frūctūs","rootword":"frūct","english":"fruit"}],"singular":{"nom":"us","gen":"ūs","dat":"uī","acc":"um","abl":"ū"},"plural":{"nom":"ūs","gen":"uum","dat":"ibus","acc":"ūs","abl":"ibus"}},"neuter":{"wordlist":[{"word":"cornū","rootword":"corn","english":"horn"}],"singular":{"nom":"ū","gen":"ūs","dat":"ū","acc":"ū","abl":"ū"},"plural":{"nom":"ua","gen":"uum","dat":"ibus","acc":"ua","abl":"ibus"}}},"5th":{"genders":["female","male"],"female":{"wordlist":[{"word":"rēs","rootword":"r","english":"thing"}],"singular":{"nom":"ēs","gen":"eī","dat":"eī","acc":"em","abl":"ē"},"plural":{"nom":"ēs","gen":"ērum","dat":"ēbus","acc":"ēs","abl":"ēbus"}},"male":{"wordlist":[{"word":"diēs","rootword":"di","english":"day"}],"singular":{"nom":"ēs","gen":"ēī","dat":"ēī","acc":"em","abl":"ē"},"plural":{"nom":"ēs","gen":"ērum","dat":"ēbus","acc":"ēs","abl":"ēbus"}}}}'.

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
