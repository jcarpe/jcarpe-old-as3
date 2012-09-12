package jcarpe.mvc.controller
{
	import flash.events.EventDispatcher;

	/**
	 * AbstractController
	 * 
	 * A basic abstraction of a controller that is designed to be simple enough for
	 * extremely simple reuse.
	 * 
	 * @author Joe Carpenito
	 */
	public class AbstractController
	{
		// --------------------------------------------------------------------------------
		// PROPERTIES
		// --------------------------------------------------------------------------------
		protected var _dispatcher:EventDispatcher;
		/**
		 * The event dispatcher just for this controller.
		 */
		public function get dispatcher():EventDispatcher
		{
			if( _dispatcher == null ) { _dispatcher = new EventDispatcher(); }
			return _dispatcher;
		}
		
		// --------------------------------------------------------------------------------
		// CONSTRUCTOR
		// --------------------------------------------------------------------------------
		public function AbstractController()
		{
			
		}
	}
}