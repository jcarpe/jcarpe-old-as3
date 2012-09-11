package jcarpe.events
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	import flash.ui.Multitouch;
	
	/**
	 * JInteractionEvent
	 * 
	 * This event class is intended to streamline testing when developing for a touch screen,
	 * but are working on a device with no touch screen. It works witht the <code>JInteractiveObject</code>
	 * in order to disatch a single type of event for both mouse and touch events.
	 * 
	 * @see jcarpe.ui.JInteractiveObject
	 * 
	 * @author Joe Carpenito
	 **/
	public class JInteractionEvent extends Event
	{
		// --------------------------------------------------------------------------------
		// CONSTANTS
		// --------------------------------------------------------------------------------
		public static const TAP					:String = "tap";
		public static const DOUBLE_TAP			:String = "doubleTap";
		public static const DOWN				:String = "down";
		public static const UP					:String = "up";
		public static const OVER				:String = "over";
		public static const OUT					:String = "out";
		public static const MOVE 				:String = "move";
		
		public static const PAN					:String = "pan";
		public static const ROTATE				:String = "rotate";
		public static const SWIPE				:String = "swipe";
		public static const ZOOM				:String = "zoom";
		
		// --------------------------------------------------------------------------------
		// PROPERTIES
		// --------------------------------------------------------------------------------
		private var _jTarget					:EventDispatcher;
		
		/**
		 * @returns jTarget
		 * :the original target of the interaction event
		 **/
		public function get jTarget() : EventDispatcher
		{
			return _jTarget;
		}
		
		// --------------------------------------------------------------------------------
		// CONSTRUCTOR
		// --------------------------------------------------------------------------------
		public function JInteractionEvent( type:String, bubbles:Boolean=false, cancelable:Boolean=false )
		{
			super( type, bubbles, cancelable );
			
			_jTarget							= EventDispatcher( target );
		}
		
		// --------------------------------------------------------------------------------
		// PUBLIC METHODS
		// --------------------------------------------------------------------------------
		public override function clone():Event
		{
			return new JInteractionEvent( type, bubbles, cancelable );
		}
		
		public override function toString():String
		{
			return formatToString( "JInteractionEvent", "type", "bubbles", "cancelable" );
		}
	}
}