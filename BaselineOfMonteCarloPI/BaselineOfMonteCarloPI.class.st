Class {
	#name : #BaselineOfMonteCarloPI,
	#superclass : #BaselineOf,
	#category : #BaselineOfMonteCarloPI
}

{ #category : #baselines }
BaselineOfMonteCarloPI >> baseline: spec [

	<baseline>
	spec for: #pharo do: [ 
		spec package: 'MonteCarloPI-Base'.
		spec package: 'MonteCarloPI-Test' with: [ spec requires: #( 'MonteCarloPI-Base' ) ] ].
]
