Class {
	#name : #TestEstimate,
	#superclass : #TestCase,
	#category : #'MonteCarloPI-Test'
}

{ #category : #tests }
TestEstimate >> testInitializationIsOk [

	| inst |
	inst := MonteCarloPiEstimator new.
	self assert: inst ~= nil.
	self assert: inst pi equals: 0.0.
	self assert: inst hits equals: 0.0.
	self assert: inst shots equals: 0.0.
	self assert: inst epsilon equals: Float infinity
]

{ #category : #tests }
TestEstimate >> testWorking [

	"Estimate PI by the so called 'darts' algorithm using a RNG to generate random 'darts' throws."

	| inst pi_estimate err |
	inst := MonteCarloPiEstimator new.
	pi_estimate := inst estimate: 0.000000001 min_iterations: 1000.
	err := inst pi - Float pi.
	err < 0 ifTrue: [ err := -1.0 * err ].
	Transcript
		show: 'PI (estimated): ';
		show: pi_estimate;
		cr;
		show: '#Shots: ';
		show: inst shots;
		cr;
		show: '#Hits: ';
		show: inst hits;
		cr;
		show: 'Epsilon: ';
		show: inst epsilon;
		cr;
		show: 'Error: ';
		show: err;
		cr;
		cr.
	self assert: err <= 0.0001
]
