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
 
	| constraints |
	
	constraints := SpBoxConstraints new expand: false. 	
	
	^ SpBoxLayout newLeftToRight
		homogeneous: false;
		add: caseColumn expand: false;
 		add: columnForSingularCaseInput expand: true;
		add: columnForSingularCaseFeedback expand: false;
 		add: columnForPluralCaseInput expand: true;
		add: columnForPluralCaseFeedback expand: false;
		yourself.
]

{ #category : #'as yet unclassified' }
DeclensionCurrentWordPresenter >> forWord: wordDictionary withCases: casesDictionary [
	
	cases := casesDictionary.
	gender := wordDictionary at: 'gender'.
	word := wordDictionary at: 'latin'.
	rootWord := wordDictionary at: 'stem'.
]

{ #category : #'as yet unclassified' }
DeclensionCurrentWordPresenter >> inflectionFrom: aStem and: aSuffix [
	
	aSuffix isEmpty 
		ifTrue: [ ^ word ]
		ifFalse: [ ^ (aStem, aSuffix) ]
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
		add: (DeclensionImagePresenter new image: ThemeIcons new blankIcon);
		yourself.
		
	columnForPluralCaseFeedback := SpBoxLayout newTopToBottom
		add: (DeclensionImagePresenter new image: ThemeIcons new blankIcon);
		yourself.
		
	singularCaseSuffixes := (cases at: 'singular').
	pluralCaseSuffixes := (cases at: 'plural').
		
	#( 'nom' 'gen' 'dat' 'acc' 'abl' ) do: [ :key | | inflection feedBackPresenter |
		inflection := self inflectionFrom:rootWord and: (singularCaseSuffixes at: key).
		feedBackPresenter := (DeclensionImagePresenter new image: nil).
		columnForSingularCaseInput add: (self textInputForCase: inflection feedBackPresenter: feedBackPresenter).
		columnForSingularCaseFeedback add: feedBackPresenter.
		
		inflection := self inflectionFrom:rootWord and: (pluralCaseSuffixes at: key).
		feedBackPresenter := (DeclensionImagePresenter new image: nil).
		columnForPluralCaseInput add: (self textInputForCase: inflection feedBackPresenter: feedBackPresenter).
		columnForPluralCaseFeedback add: feedBackPresenter.
	].
]

{ #category : #'as yet unclassified' }
DeclensionCurrentWordPresenter >> textInputForCase: aString feedBackPresenter: aPicturePresenter [
	
	^ (self newTextInput) whenSubmitDo: [ :text |
			text = aString 
				ifTrue: [aPicturePresenter image: inputCorrect  ] 
				ifFalse: [aPicturePresenter image: inputIncorrect ].
	]
]
