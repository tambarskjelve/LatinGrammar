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

{ #category : #'as yet unclassified' }
LatinGrammar >> jsonString [
	^ '{
	''2nd'' : {
		''neuter'' : {
			''plural'' : {
				''gen'' : ''ōrum'',
				''abl'' : ''īs'',
				''acc'' : ''a'',
				''nom'' : ''a'',
				''dat'' : ''īs''
			},
			''singular'' : {
				''gen'' : ''ī'',
				''abl'' : ''ō'',
				''acc'' : ''um'',
				''nom'' : ''um'',
				''dat'' : ''ō''
			}
		},
		''male'' : {
			''plural'' : {
				''gen'' : ''ōrum'',
				''abl'' : ''īs'',
				''acc'' : ''ōs'',
				''nom'' : ''ī'',
				''dat'' : ''īs''
			},
			''singular'' : {
				''gen'' : ''ī'',
				''abl'' : ''ō'',
				''acc'' : ''um'',
				''nom'' : ''us'',
				''dat'' : ''ō''
			}
		}
	},
	''3rdi'' : {
		''neuter'' : {
			''plural'' : {
				''gen'' : ''ium'',
				''abl'' : ''ibus'',
				''acc'' : ''ia'',
				''nom'' : ''ia'',
				''dat'' : ''ibus''
			},
			''singular'' : {
				''gen'' : ''is'',
				''abl'' : ''ī'',
				''acc'' : ''e'',
				''nom'' : ''e'',
				''dat'' : ''ī''
			}
		},
		''male'' : {
			''plural'' : {
				''gen'' : ''ium'',
				''abl'' : ''ibus'',
				''acc'' : ''ēs'',
				''nom'' : ''ēs'',
				''dat'' : ''ibus''
			},
			''singular'' : {
				''gen'' : ''is'',
				''abl'' : ''e'',
				''acc'' : ''em'',
				''nom'' : ''is'',
				''dat'' : ''ī''
			}
		}
	},
	''5th'' : {
		''female'' : {
			''plural'' : {
				''gen'' : ''ērum'',
				''abl'' : ''ēbus'',
				''acc'' : ''ēs'',
				''nom'' : ''ēs'',
				''dat'' : ''ēbus''
			},
			''singular'' : {
				''gen'' : ''eī'',
				''abl'' : ''ē'',
				''acc'' : ''em'',
				''nom'' : ''ēs'',
				''dat'' : ''eī''
			}
		},
		''male'' : {
			''plural'' : {
				''gen'' : ''ērum'',
				''abl'' : ''ēbus'',
				''acc'' : ''ēs'',
				''nom'' : ''ēs'',
				''dat'' : ''ēbus''
			},
			''singular'' : {
				''gen'' : ''ēī'',
				''abl'' : ''ē'',
				''acc'' : ''em'',
				''nom'' : ''ēs'',
				''dat'' : ''ēī''
			}
		}
	},
	''1st'' : {
		''female'' : {
			''plural'' : {
				''gen'' : ''ārum'',
				''abl'' : ''īs'',
				''acc'' : ''ās'',
				''nom'' : ''ae'',
				''dat'' : ''īs''
			},
			''singular'' : {
				''gen'' : ''ae'',
				''abl'' : ''ā'',
				''acc'' : ''am'',
				''nom'' : ''a'',
				''dat'' : ''ae''
			}
		}
	},
	''3rd'' : {
		''neuter'' : {
			''plural'' : {
				''gen'' : ''um'',
				''abl'' : ''ibus'',
				''acc'' : ''a'',
				''nom'' : ''a'',
				''dat'' : ''ibus''
			},
			''singular'' : {
				''gen'' : ''is'',
				''abl'' : ''e'',
				''acc'' : '''',
				''nom'' : '''',
				''dat'' : ''ī''
			}
		},
		''male'' : {
			''plural'' : {
				''gen'' : ''um'',
				''abl'' : ''ibus'',
				''acc'' : ''ēs'',
				''nom'' : ''ēs'',
				''dat'' : ''ibus''
			},
			''singular'' : {
				''gen'' : ''is'',
				''abl'' : ''e'',
				''acc'' : ''em'',
				''nom'' : '''',
				''dat'' : ''ī''
			}
		}
	},
	''4th'' : {
		''neuter'' : {
			''plural'' : {
				''gen'' : ''uum'',
				''abl'' : ''ibus'',
				''acc'' : ''ua'',
				''nom'' : ''ua'',
				''dat'' : ''ibus''
			},
			''singular'' : {
				''gen'' : ''ūs'',
				''abl'' : ''ū'',
				''acc'' : ''ū'',
				''nom'' : ''ū'',
				''dat'' : ''ū''
			}
		},
		''male'' : {
			''plural'' : {
				''gen'' : ''uum'',
				''abl'' : ''ibus'',
				''acc'' : ''ūs'',
				''nom'' : ''ūs'',
				''dat'' : ''ibus''
			},
			''singular'' : {
				''gen'' : ''ūs'',
				''abl'' : ''ū'',
				''acc'' : ''um'',
				''nom'' : ''us'',
				''dat'' : ''uī''
			}
		}
	}
}'
]
