Class {
	#name : #DeclensionTabContentPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'caseNames',
		'pluralTextInputs',
		'singularTextInputs',
		'singularCaseIndicator',
		'pluralCaseIndicator',
		'fasit',
		'grammarCase',
		'caseKeys',
		'currentWord'
	],
	#category : #LatinGrammar
}

{ #category : #'as yet unclassified' }
DeclensionTabContentPresenter class >> forCase: aDictionary [
	^ self basicNew 
		grammarCase: aDictionary; 
		initialize;
		yourself.
	

]

{ #category : #layout }
DeclensionTabContentPresenter >> defaultLayout [  
	"Default layout needs to select the first gender for its particular case. "
	| grammarSection caseColumn singularInputColumn singularOutputColumn pluralInputColumn |
	
	caseColumn := SpBoxLayout newTopToBottom
		borderWidth: 10;
		spacing: 10;
		add: (currentWord capitalized).
	caseNames do: [ :case | caseColumn add: case ].
	
	singularInputColumn := SpBoxLayout newTopToBottom
		borderWidth: 10;
		spacing: 10;
		add: 'Singular'.
	caseKeys do: [ :symbol | singularInputColumn add: (singularTextInputs at: symbol) ].
	
	singularOutputColumn := SpBoxLayout newTopToBottom
		add: (SpBoxLayout newTopToBottom);
		add: (SpBoxLayout newTopToBottom add: (self iconNamed: 'thumbsUp'));
		add: (SpBoxLayout newTopToBottom add: (self iconNamed: 'thumbsUp'));
		add: (SpBoxLayout newTopToBottom add: (self iconNamed: 'thumbsUp'));
		add: (self iconNamed: 'thumbsDown');
		add: (self iconNamed: 'glamorousRedCircle').
	"caseKeys do: [ :symbol | singularOutputColumn add: (self iconNamed: 'thumbsUp') ]."
	
	pluralInputColumn := SpBoxLayout newTopToBottom
		borderWidth: 10;
		spacing: 10;
		add: 'Plural'.
	caseKeys do: [ :symbol | pluralInputColumn add: (pluralTextInputs at: symbol) ].
			
	grammarSection := SpBoxLayout newLeftToRight
		add: caseColumn;
		add: singularInputColumn;
		add: singularOutputColumn;
		add: pluralInputColumn.
		
	^ SpBoxLayout newTopToBottom
		add: grammarSection;
		add: (SpBoxLayout newLeftToRight
					add: (SpBoxLayout newLeftToRight
							add: (self newButton label: 'feminine'; yourself) ;
							add: (self newButton label: 'masculine'; yourself));
					add: (SpBoxLayout newLeftToRight
							add: (self newButton label: ''; yourself) ;
							add: (self newButton label: 'next'; yourself)));
		yourself.
	
]

{ #category : #accessing }
DeclensionTabContentPresenter >> grammarCase [
	^ grammarCase 
]

{ #category : #accessing }
DeclensionTabContentPresenter >> grammarCase: aDictionary [
	grammarCase := aDictionary.
	currentWord := (((aDictionary at: ((aDictionary at: 'genders') at: 1)) at: 'wordlist') at: 1) at: 'word'.
]

{ #category : #initialization }
DeclensionTabContentPresenter >> initializePresenters [ 

	| defaultCase |

	caseNames := #('Nominative' 'Genitive' 'Dative' 'Accusative' 'Ablative').
	caseKeys := #( 'nom' 'gen' 'dat' 'acc' 'abl' ).
	fasit := #('aqua' 'aquae' 'aquae' 'aquam' 'aquā').
	
	singularTextInputs := Dictionary new.
	pluralTextInputs := Dictionary new.
	
	caseKeys do: [ :key | 
		singularTextInputs add: key->(self newTextInput). 
		pluralTextInputs add: key->(self newTextInput)].
	
	"Make sure each text input test for correct gender"
	"caseSymbols do: [ :symbol | pluralInputColumn add: (pluralTextInputs at: symbol) ]."
	defaultCase := (grammarCase at: 'genders') at: 1.
	caseKeys do: [ :key | 
		(singularTextInputs at: key) whenSubmitDo: [ :text | | correctWord |
			correctWord := ((((grammarCase at: defaultCase) at: 'wordlist') at: 1) at: 'rootword'), (((grammarCase at: defaultCase) at: 'singular') at: key).
			text = correctWord ifTrue: [Transcript show: 'correct!'] ifFalse: [Transcript show: 'false!'] ].
		(pluralTextInputs at: key) whenSubmitDo: [ :text | | correctWord |
			correctWord := ((((grammarCase at: defaultCase) at: 'wordlist') at: 1) at: 'rootword'), (((grammarCase at: defaultCase) at: 'plural') at: key).
			text = correctWord ifTrue: [Transcript show: 'correct!'] ifFalse: [Transcript show: 'false!'] ]
	]
"((((grammarCase at: 'female') at: 'wordlist') at: 1) at: 'rootword'), (((grammarCase at: 'female') at: 'singular') at: 'gen')"
" whenSubmitDo: [ :text | text = (grammarCase ) if Transcript show: 'hello!' ]"
]

{ #category : #'scripting - widgets' }
DeclensionTabContentPresenter >> newButton [
	^ self instantiate: SpButtonPresenter
]

{ #category : #initialization }
DeclensionTabContentPresenter >> plural [
	^ pluralTextInputs
]

{ #category : #initialization }
DeclensionTabContentPresenter >> singular [
	^ singularTextInputs
]
