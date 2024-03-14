Class {
	#name : #DeclensionCurrentWordPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'cases',
		'gender',
		'word',
		'rootWord',
		'declensions',
		'singularCases',
		'pluralCasses',
		'inputCorrect',
		'inputIncorrect',
		'columnForSingularCaseInput',
		'columnForPluralCaseInput',
		'columnForSingularCaseFeedback',
		'columnForPluralCaseFeedback',
		'caseColumn'
	],
	#category : #LatinGrammar
}

{ #category : #'as yet unclassified' }
DeclensionCurrentWordPresenter class >> forWord: aString withCases: aDictionary [
	^ self basicNew 
		forWord: aString withCases: aDictionary; 
		initialize;
		yourself.
]

{ #category : #layout }
DeclensionCurrentWordPresenter >> defaultLayout [ 
  			
	^ SpBoxLayout newLeftToRight
		add: caseColumn;
 		add: columnForSingularCaseInput;
		add: columnForSingularCaseFeedback;
 		add: columnForPluralCaseInput;
		add: columnForPluralCaseFeedback;
		yourself.
]

{ #category : #'as yet unclassified' }
DeclensionCurrentWordPresenter >> forWord: wordDictionary withCases: casesDictionary [
	
	cases := casesDictionary.
	gender := wordDictionary at: 'gender'.
	word := wordDictionary at: 'latin'.
	rootWord := wordDictionary at: 'stem'.
]

{ #category : #initialization }
DeclensionCurrentWordPresenter >> initializePresenters [ 

	"Default layout needs to select the first gender for its particular case. "
	| singularCaseSuffixes pluralCaseSuffixes |
	
	inputCorrect := self iconNamed: 'thumbsUp'.
 	inputIncorrect := self iconNamed: 'thumbsDown'.
	
	caseColumn := SpBoxLayout newTopToBottom
		borderWidth: 10;
		spacing: 10;
		add: (SpLabelPresenter new label: (word capitalized); displayBold: [true]).
	#('Nominative' 'Genitive' 'Dative' 'Accusative' 'Ablative') do: [ :case | caseColumn add: case ].
	
	columnForSingularCaseInput := SpBoxLayout newTopToBottom
		borderWidth: 10;
		spacing: 10;
		add: 'Singular'.
	
	columnForPluralCaseInput := SpBoxLayout newTopToBottom
		borderWidth: 10;
		spacing: 10;
		add: 'Plural'.
	
	columnForSingularCaseFeedback := SpBoxLayout newTopToBottom
		add: (SpImagePresenter new image: nil);
		yourself.
		
	columnForPluralCaseFeedback := SpBoxLayout newTopToBottom
		add: (SpImagePresenter new image: nil);
		yourself.
		
	singularCaseSuffixes := (cases at: 'singular').
	pluralCaseSuffixes := (cases at: 'plural').
		
	#( 'nom' 'gen' 'dat' 'acc' 'abl' ) do: [ :key | | inflection feedBackPresenter |
		inflection := (rootWord , (singularCaseSuffixes at: key)).
		feedBackPresenter := (SpImagePresenter new image: nil).
		columnForSingularCaseInput add: (self textInputForCase: inflection feedBackPresenter: feedBackPresenter).
		columnForSingularCaseFeedback add: feedBackPresenter.
		
		inflection := (rootWord , (pluralCaseSuffixes at: key)).
		feedBackPresenter := (SpImagePresenter new image: nil).
		columnForPluralCaseInput add: (self textInputForCase: inflection feedBackPresenter: feedBackPresenter).
		columnForPluralCaseFeedback add: feedBackPresenter.
	].
		
	

]

{ #category : #'as yet unclassified' }
DeclensionCurrentWordPresenter >> textInputForCase: aString feedBackPresenter: aPicturePresenter [
	
	^ (self newTextInput) whenSubmitDo: [ :text |
			(aString isEmpty) 
				ifTrue: [text = word 
					ifTrue: [aPicturePresenter image: inputCorrect  ] 
					ifFalse: [aPicturePresenter image: inputIncorrect ]] 
				ifFalse: [ text = aString 
					ifTrue: [aPicturePresenter image: inputCorrect  ] 
					ifFalse: [aPicturePresenter image: inputIncorrect ]]. 
			Transcript show: aString; cr.	
		]
]
