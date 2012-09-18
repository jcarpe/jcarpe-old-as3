package jcarpe.mvc.model
{
	import flash.errors.IllegalOperationError;
	import flash.events.EventDispatcher;
	
	import jcarpe.mvc.controller.AbstractController;

	/**
	 * AbstractModel
	 * 
	 * A basic abstraction of a model that is designed to be simple enough for
	 * extremely simple reuse. This model has a stand alone dispatcher as
	 * opposed to extending from the EventDispatcher class.
	 * 
	 * @author Joe Carpenito
	 */
	public class AbstractModel
	{
		// --------------------------------------------------------------------------------
		// PROPERTIES
		// --------------------------------------------------------------------------------
		protected var _dispatcher:EventDispatcher;
		/**
		 * The event dispatcher just for this model.
		 */
		public function get dispatcher():EventDispatcher
		{
			if( _dispatcher == null ) { _dispatcher = new EventDispatcher(); }
			return _dispatcher;
		}
		
		// --------------------------------------------------------------------------------
		// CONSTRUCTOR
		// --------------------------------------------------------------------------------
		public function AbstractModel()
		{
			// force abstraction of the class
			if( Object(this).constructor === AbstractModel )
			{
				throw new IllegalOperationError( "AbstractController is an abstract class and cannot be directly instantiated" );
			}
		}
	}
}