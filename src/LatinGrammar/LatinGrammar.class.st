Class {
	#name : #LatinGrammar,
	#superclass : #SpApplication,
	#instVars : [
		'declensions'
	],
	#category : #LatinGrammar
}

{ #category : #initialization }
LatinGrammar >> initialize [ 
	
	super initialize.
	declensions := Dictionary new.
]
