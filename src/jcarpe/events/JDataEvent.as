package jcarpe.events
{
	import flash.events.Event;
	
	/**
	 * JDataEvent
	 * 
	 * It is just a data event, but the data can be passed as any object instead of just a string.
	 * 
	 * @author Joe Carpenito
	 */
	public class JDataEvent extends Event
	{
		// --------------------------------------------------------------------------------
		// CONSTANTS
		// --------------------------------------------------------------------------------
		public static const COMPLETE		:String = "complete";
		public static const LOADING_STARTED	:String = "loadingStarted";
		
		// --------------------------------------------------------------------------------
		// PROPERTIES
		// --------------------------------------------------------------------------------
		private var _data:Object;
		
		/**
		 * @returns data
		 * :the data value passed with the JDataEvent
		 * 
		 * @throws error
		 * :the data object in com.events.JDataEvent is null. A different event class should be used.
		 */
		public function get data():Object
		{
			if( data != null )
			{
				return _data;
			}
			else
			{
				throw new Error( "The data object in com.events.JDataEvent is null. A different event class should be used." );
				return null;
			}
		}
		
		// --------------------------------------------------------------------------------
		// CONSTRUCTOR
		// --------------------------------------------------------------------------------
		public function JDataEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false, data:Object = null)
		{
			super(type, bubbles, cancelable );
			
			_data = data;
		}

		// --------------------------------------------------------------------------------
		// PUBLIC METHODS
		// --------------------------------------------------------------------------------
		public override function clone():Event
		{
			return new JDataEvent(type, bubbles, cancelable, data);
		}
		
		public override function toString():String
		{
			return formatToString("JDataEvent", "type", "bubbles", "cancelable", "data");
		}

	}
}