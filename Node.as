﻿package {		import flash.display.Sprite		internal final class Node extends Sprite {				public var nodeDisc:NodeDisc;		public var nodeBranchesArray:Array;		public var section:TwigSection;		private var _xPos:Number;		private var _yPos:Number;				public function Node(startX:Number, startY:Number) {			_xPos = startX;			_yPos = startY;			section = _drawSection();		}				private function _drawSection(): TwigSection {			// draw a NodeSection			section = new TwigSection(_xPos, _yPos);			addChild(section);			return section			}	}}