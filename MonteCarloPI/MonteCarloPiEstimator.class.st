Class {
	#name : #MonteCarloPiEstimator,
	#superclass : #Object,
	#instVars : [
		'pi',
		'epsilon',
		'shots',
		'hits',
		'rand'
	],
	#category : #'MonteCarloPI-Base'
}

{ #category : #accessing }
MonteCarloPiEstimator >> epsilon [

	^ epsilon.
]

{ #category : #accessing }
MonteCarloPiEstimator >> epsilon: eps [

	epsilon := eps.


]

{ #category : #compute }
MonteCarloPiEstimator >> estimate: target_eps min_iterations: min_iter_count [

	| x y pi_i_1 pi_i |
	pi_i := pi.

	[ epsilon > target_eps or: shots < min_iter_count ] whileTrue: [ 
		pi_i_1 := pi_i.
		x := rand nextBetween: -1 and: 1.
		y := rand nextBetween: -1 and: 1.
		x * x + (y * y) <= 1 ifTrue: [ hits := hits + 1.0 ].
		shots := shots + 1.0.
		pi_i := 4.0 * (hits / shots).
		epsilon := pi_i_1 - pi_i.
		epsilon < 0 ifTrue: [ epsilon := -1 * epsilon ] ].

	pi := pi_i.
	^ pi
]

{ #category : #accessing }
MonteCarloPiEstimator >> hits [

	^ hits.
]

{ #category : #accessing }
MonteCarloPiEstimator >> hits: _hits [

	hits := _hits.
]

{ #category : #initialization }
MonteCarloPiEstimator >> initialize [

	pi := 0.0.
	epsilon := Float infinity.
	hits := 0.0.
	shots := 0.0.
	rand := Random new.
	rand useUnixRandomGeneratorSeed
]

{ #category : #accessing }
MonteCarloPiEstimator >> pi [

	"comment stating purpose of instance-side method"

	"scope: class-variables  &  instance-variables"

	^ pi
]

{ #category : #accessing }
MonteCarloPiEstimator >> pi: arg [

	pi := arg.
]

{ #category : #accessing }
MonteCarloPiEstimator >> rand [

	^rand
]

{ #category : #accessing }
MonteCarloPiEstimator >> rand: r [

	rand := r.
]

{ #category : #accessing }
MonteCarloPiEstimator >> shots [

	^ shots.
]

{ #category : #accessing }
MonteCarloPiEstimator >> shots: _shots [

	shots := _shots.
]
