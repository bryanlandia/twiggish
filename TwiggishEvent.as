﻿package  {		import flash.events.Event		internal final class TwiggishEvent extends Event {				public static const NODE_DISC_REMOVED:String = "Node disc removed";		public function TwiggishEvent(type:String, bubbles:Boolean = true, cancelable:Boolean = false){            super(type, bubbles,cancelable);        }	}	}