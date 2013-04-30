﻿package {		import flash.display.Sprite;	import flash.events.Event;	import woollyyyy.utils.*;			internal final class Twig extends Sprite {				// Twig is an object made of branches strung together, separated by 		// Nodes				public var branchesArray:Array; // store branches (at least one)		public var startEdge:String;		public var startX:uint; // starting X position (where it enters from edge)		public var startY:uint; // starting Y position		public var zOrder:uint; // store z-order		public var nodesMax:uint; // max number of nodes for this Twig		public var hueRange:Array; // a min and max multiplier for hues		public var initialBranch:Branch;		public function Twig() {			// generate new Twig at a point along one of the available edges			// wait until it is placed on the stage to set its starting x,y based on 			// stage width						if (this.stage) _init();    		else this.addEventListener(Event.ADDED_TO_STAGE, _init);					}				private function _init(e:Event = null): void {						startEdge = Forest.GROWING_EDGES[randomRange(0, Forest.GROWING_EDGES.length-1)];						switch (startEdge) {				case 'TOP':					//trace('placing Twig at TOP edge');					startY = 0;					startX = randomRange(0, this.stage.stageWidth-300);// give it room to grow						break;								case 'LEFT':					//trace('placing Twig at LEFT edge');					startY = randomRange(0, this.stage.stageHeight-300);					startX = 0;					break;								// handle more cases later....			}									// give it a Z-Order			// zOrder = randomRange(1, MAX_TWIGS); not using yet						// tell it how many nodes it can have			nodesMax = randomRange(Forest.MIN_TWIG_NODES, Forest.MAX_TWIG_NODES);						// give it a hue range			//hueRange = []; .... TODO 									branchesArray = new Array();												// add an initial branch			initialBranch = _addBranchToTwig(startX, startY);					}				private function _addBranchToTwig(startX:Number, startY:Number): Branch {			trace('in _addBranchToTwig');			var branch = new Branch(startX, startY);			branchesArray.push(initialBranch);			trace('branch has '+branch.numChildren+' children');			addChild(branch);			return branch;		}			}		}