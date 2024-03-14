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
	grammarData := NeoJSONReader fromString: '{"1st":{"genders":["feminine"],"feminine":{"wordlist":[{"latin":"aqua","stem":"aqu","english":"water","gender":"feminine","declension":"1st"}],"singular":{"nom":"a","gen":"ae","dat":"ae","acc":"am","abl":"ā"},"plural":{"nom":"ae","gen":"ārum","dat":"īs","acc":"ās","abl":"īs"}}},"2nd":{"genders":["masculine","neuter"],"masculine":{"wordlist":[{"latin":"servus","stem":"serv","english":"slave","gender":"masculine","declension":"2nd"}],"singular":{"nom":"us","gen":"ī","dat":"ō","acc":"um","abl":"ō"},"plural":{"nom":"ī","gen":"ōrum","dat":"īs","acc":"ōs","abl":"īs"}},"neuter":{"wordlist":[{"latin":"dōnum","stem":"dōn","english":"gift","gender":"neuter","declension":"2nd"}],"singular":{"nom":"um","gen":"ī","dat":"ō","acc":"um","abl":"ō"},"plural":{"nom":"a","gen":"ōrum","dat":"īs","acc":"a","abl":"īs"}}},"3rd":{"genders":["masculine","neuter"],"masculine":{"wordlist":[{"latin":"rēx","stem":"rēg","english":"king","gender":"masculine","declension":"3rd"}],"singular":{"nom":"","gen":"is","dat":"ī","acc":"em","abl":"e"},"plural":{"nom":"ēs","gen":"um","dat":"ibus","acc":"ēs","abl":"ibus"}},"neuter":{"wordlist":[{"latin":"corpus","stem":"corpor","english":"body","gender":"neuter","declension":"3rd"}],"singular":{"nom":"","gen":"is","dat":"ī","acc":"","abl":"e"},"plural":{"nom":"a","gen":"um","dat":"ibus","acc":"a","abl":"ibus"}}},"3rdi":{"genders":["masculine","neuter"],"masculine":{"wordlist":[{"latin":"cīvis","stem":"cīv","english":"citizen","gender":"masculine","declension":"3rdi"}],"singular":{"nom":"is","gen":"is","dat":"ī","acc":"em","abl":"e"},"plural":{"nom":"ēs","gen":"ium","dat":"ibus","acc":"ēs","abl":"ibus"}},"neuter":{"wordlist":[{"latin":"mare","stem":"mar","english":"sea","gender":"neuter","declension":"3rdi"}],"singular":{"nom":"e","gen":"is","dat":"ī","acc":"e","abl":"ī"},"plural":{"nom":"ia","gen":"ium","dat":"ibus","acc":"ia","abl":"ibus"}}},"4th":{"genders":["masculine","neuter"],"masculine":{"wordlist":[{"latin":"frūctūs","stem":"frūct","english":"fruit","gender":"masculine","declension":"4th"}],"singular":{"nom":"us","gen":"ūs","dat":"uī","acc":"um","abl":"ū"},"plural":{"nom":"ūs","gen":"uum","dat":"ibus","acc":"ūs","abl":"ibus"}},"neuter":{"wordlist":[{"latin":"cornū","stem":"corn","english":"horn","gender":"neuter","declension":"4th"}],"singular":{"nom":"ū","gen":"ūs","dat":"ū","acc":"ū","abl":"ū"},"plural":{"nom":"ua","gen":"uum","dat":"ibus","acc":"ua","abl":"ibus"}}},"5th":{"genders":["feminine","masculine"],"feminine":{"wordlist":[{"latin":"rēs","stem":"r","english":"thing","gender":"feminine","declension":"5th"}],"singular":{"nom":"ēs","gen":"eī","dat":"eī","acc":"em","abl":"ē"},"plural":{"nom":"ēs","gen":"ērum","dat":"ēbus","acc":"ēs","abl":"ēbus"}},"masculine":{"wordlist":[{"latin":"diēs","stem":"di","english":"day","gender":"masculine","declension":"5th"}],"singular":{"nom":"ēs","gen":"ēī","dat":"ēī","acc":"em","abl":"ē"},"plural":{"nom":"ēs","gen":"ērum","dat":"ēbus","acc":"ēs","abl":"ēbus"}}}}'.

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
