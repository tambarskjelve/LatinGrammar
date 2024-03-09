Class {
	#name : #DeclensionPresenter,
	#superclass : #SpPresenter,
	#category : #LatinGrammar
}

{ #category : #layout }
DeclensionPresenter >> defaultLayout [ 
	^ SpTabLayout new
		add: (DeclensionTabContentPresenter new) label:'1st';
		add: (DeclensionTabContentPresenter new) label:'2nd';
		add: (DeclensionTabContentPresenter new) label:'3rd';
		add: (DeclensionTabContentPresenter new) label:'3rd i';
		add: (DeclensionTabContentPresenter new) label:'4th';
		add: (DeclensionTabContentPresenter new) label:'5th'. 
]

{ #category : #initialization }
DeclensionPresenter >> initializePresenters [ 
]

{ #category : #initialization }
DeclensionPresenter >> initializeWindow: aWindowPresenter [
	aWindowPresenter 
		title: 'Latin Declensions';
		initialExtent: 400@300.
]
