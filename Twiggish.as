﻿package  {		import flash.display.Sprite;	import flash.utils.Timer;    import flash.events.TimerEvent;		// minimum seconds until new twig generated	const MIN_TWIG_DELAY = 5		const MIN_NODE_DELAY = 1		// edges available to grow new twigs	const GROWING_EDGES = ['TOP', 'LEFT'] //, 'BOTTOM', 'RIGHT']		// how Twiggy we want it; i.e., percentage chance of generating a new Twig	const TWIG_LIKELIHOOD = 0.5		// how much branching we want (node makes branches vs. just section)	const BRANCHING_LIKELIHOOD = 0.25		// how many Twigs total we'll allow.  Old Twigs will then have to die to 	// allow new ones to be created	const MAX_TWIGS = 12		// how many nodes Twigs will allow	const MIN_TWIG_NODES = 5	const MAX_TWIG_NODES = 25		// eventually, scroll the Stage right to left to reveal more	//const SCROLL_RATE = 			public function randomRange(min:int, max:int) : int {		// generate a random integer between min and max		var minMaxDiff:int  = max - min;		return Math.round(Math.random()*minMaxDiff) + min;	};		public class Forest extends Sprite {		// Document class		// A Forest generates Twigs.  				private var _forestTimer:Timer;		private var _twigsArray:Array;				public function Forest() {			// create a new Array to store Twigs we'll create			_twigsArray = new Array();						// create a Timer to handle adding Twigs			_configureForestTimer();			_forestTimer.start();					}				private function _configureForestTimer(): void {			// every x seconds, see if we want to create a new Twig			_forestTimer = new Timer(MIN_TWIG_DELAY * 1000);			_forestTimer.addEventListener(TimerEvent.TIMER, _twigCreatorTest);		}				private function _twigCreatorTest(e:TimerEvent): void {			// randomly determine whether or not to create a new Twig			if (_twigsArray.length() < MAX_TWIGS && Math.random() >= TWIG_LIKELIHOOD) {				twig = new Twig(); 				_twigsArray.push(twig);				addChild(twig);			}		}	}	}