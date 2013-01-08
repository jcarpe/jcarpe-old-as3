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
	public class AbstractView extends Sprite implements IView
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
				throw new IllegalOperationError( 
					"AbstractView is an abstract class and cannot be directly instantiated" );
			}
		}
		
		// --------------------------------------------------------------------------------
		// PUBLIC API
		// --------------------------------------------------------------------------------
		/**
		 * Remove all the child display objects from the view. Returns a boolean based on
		 * the success of removing all the children on the view.
		 */
		public function destroy() : Boolean
		{
			while( this.numChildren > 0 )
			{
				this.removeChildAt( 0 );
			}
			
			if ( this.numChildren == 0 ) { return true; }
			else { return false; }
		}
		
		/**
		 * Update the view.
		 */
		public function update() : void
		{
			
		}
	}
}