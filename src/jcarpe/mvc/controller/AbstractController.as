package jcarpe.mvc.controller
{
	import flash.errors.IllegalOperationError;
	import flash.events.EventDispatcher;

	/**
	 * AbstractController
	 * 
	 * @author Joe Carpenito
	 * 
	 * @see flash.events.EventDispatcher
	 * @see jcarpe.mvc.controller.IController
	 * 
	 * A basic abstraction of a controller that is designed to be simple enough for
	 * extremely simple reuse. It has it's own stand alone event dispatcher as
	 * opposed to extending from an EventDispatcher. I have found this provides a
	 * little more flexibility if you want to have a global event dispatcher that
	 * is responisble for multiple event systems. For example having it responsible
	 * for the ApplicationController events as well as sub-controller events.
	 */
	public class AbstractController implements IController
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
			// force abstraction of the class
			if( Object(this).constructor === AbstractController )
			{
				throw new IllegalOperationError( 
					"AbstractController is an abstract class and cannot be directly instantiated" );
			}
		}
		
	}
}