package jcarpe.mvc.view
{
	import flash.display.Sprite;
	import flash.errors.IllegalOperationError;
	
	/**
	 * AbstractView
	 * 
	 * A basic abstraction of a view that is designed to be simple enough for
	 * extremely easy reuse.
	 * 
	 * @author Joe Carpenito
	 */
	public class AbstractView extends Sprite
	{
		// --------------------------------------------------------------------------------
		// CONSTRUCTOR
		// --------------------------------------------------------------------------------
		public function AbstractView()
		{
			super();
			
			// force abstraction of the class
			if( Object(this).constructor === AbstractView )
			{
				throw new IllegalOperationError( "AbstractController is an abstract class and cannot be directly instantiated" );
			}
		}
		
		// --------------------------------------------------------------------------------
		// PUBLIC API
		// --------------------------------------------------------------------------------
		/**
		 * Remove all the child display objects from the view.
		 * 
		 * @public
		 */
		public function destroy() : void
		{
			while( this.numChildren > 0 )
			{
				this.removeChildAt( 0 );
			}
		}
	}
}