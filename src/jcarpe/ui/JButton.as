package jcarpe.ui
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.errors.IllegalOperationError;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import jcarpe.util.JLogger;
	
	/**
	 * JButton
	 * 
	 * Abstract button class that pretty much just has basic button functionality
	 * already set up. Because it is abstract, it cannot not be instatiated itself.
	 * Consider implementing the IJButton interface before using this class. This
	 * class will automatically set the <code>buttonMode</code> to <code>true</code>.
	 * 
	 * @author Joe Carpenito
	 * 
	 * @see jcarpe.ui.IJButton
	 */
	public class JButton extends Sprite implements IJButton
	{
		// --------------------------------------------------------------------------------
		// PROPERTIES
		// --------------------------------------------------------------------------------
		private var _buttonGraphic:DisplayObject = null;
		/**
		 * A DisplayObject that is the graphic for the button.
		 */
		public function get buttonGraphic():DisplayObject
		{
			return _buttonGraphic;
		}

		public function set buttonGraphic(value:DisplayObject):void
		{
			_buttonGraphic = value;
		}

		// --------------------------------------------------------------------------------
		// CONSTRUCTOR
		// --------------------------------------------------------------------------------
		public function JButton()
		{
			addEventListener( Event.ADDED_TO_STAGE, init );
			
			super();
			
			if( Object(this).constructor === JButton )
			{
				throw new IllegalOperationError( 
					"JButton is an abstract class and cannot be directly instantiated" );
			}
		}
		
		// --------------------------------------------------------------------------------
		// PUBLIC METHODS
		// --------------------------------------------------------------------------------
		/**
		 * Dispose method that will destroy all children of the button and remove any
		 * active listeners.
		 */
		public function destroy() : void
		{
			// run through display list and get rid of all the children
			while( this.numChildren > 0 )
			{
				this.removeChildAt( 0 );
			}
			
			// remove all listeners
			this.deconfigMouseEvents();
		}
		
		/**
		 * Configures the mouse functionality of the button.
		 */
		public function configMouseEvents() : void
		{
			this.buttonMode = true;
			addEventListener( MouseEvent.MOUSE_OVER, mouseEventHandler );
		}
		
		/**
		 * De-configures the mouse functionality of the button.
		 */
		public function deconfigMouseEvents() : void
		{
			this.buttonMode = false;
			if( this.hasEventListener( MouseEvent.MOUSE_OVER ) )
			{
				removeEventListener( MouseEvent.MOUSE_OVER, mouseEventHandler );
			}
		}
		
		/**
		 * Called on <code>MouseEvent.MOUSE_OVER</code>. 
		 * Override function to create mouse over functionality.
		 */
		public function mouseOver() : void
		{
			JLogger.jTrace( this, "mouseOver() function is not overridden" );
		}
		
		/**
		 * Called on <code>MouseEvent.MOUSE_DOWN</code>. 
		 * Override function to create mouse down functionality.
		 */
		public function mouseDown() : void
		{
			JLogger.jTrace( this, "mouseDown() function is not overridden" );
		}
		
		/**
		 * Called on <code>MouseEvent.MOUSE_UP</code>. 
		 * Override function to create mouse up functionality.
		 */
		public function mouseUp() : void
		{
			JLogger.jTrace( this, "mouseUp() function is not overridden" );
		}
		
		/**
		 * Called on <code>MouseEvent.MOUSE_OUT</code>. 
		 * Override function to create mouse out functionality.
		 */
		public function mouseOut() : void
		{
			JLogger.jTrace( this, "mouseOut() function is not overridden" );
		}
		
		// --------------------------------------------------------------------------------
		// PRIVATE METHODS
		// --------------------------------------------------------------------------------
		/**
		 * @private
		 **/
		private function render() : void
		{
			// check to see if a button graphic has been set
			if( _buttonGraphic != null )
			{
				_buttonGraphic.x = _buttonGraphic.y = 0;
				_buttonGraphic.cacheAsBitmap = true;
				addChild( _buttonGraphic );
			}
		}
		
		// --------------------------------------------------------------------------------
		// HANDLERS
		// --------------------------------------------------------------------------------
		/**
		 * @private
		 **/
		private function init( event:Event ) : void
		{
			removeEventListener( Event.ADDED_TO_STAGE, init );
			
			render();
		}
		
		/**
		 * @private
		 **/
		private function mouseEventHandler(event:MouseEvent) : void
		{
			// switch statement for relevant possible mouse events
			switch( event.type )
			{
				case MouseEvent.MOUSE_OVER:
					addEventListener( MouseEvent.MOUSE_DOWN, mouseEventHandler );
					addEventListener( MouseEvent.MOUSE_OUT, mouseEventHandler );
					removeEventListener( MouseEvent.MOUSE_OVER, mouseEventHandler );
					this.mouseOver();					
					break;
				
				case MouseEvent.MOUSE_DOWN:
					addEventListener( MouseEvent.MOUSE_UP, mouseEventHandler );
					removeEventListener( MouseEvent.MOUSE_DOWN, mouseEventHandler );
					this.mouseDown();
					break;
				
				case MouseEvent.MOUSE_UP:
					addEventListener( MouseEvent.MOUSE_DOWN, mouseEventHandler );
					removeEventListener( MouseEvent.MOUSE_UP, mouseEventHandler );
					this.mouseUp();
					break;
				
				case MouseEvent.MOUSE_OUT:
					addEventListener( MouseEvent.MOUSE_OVER, mouseEventHandler );
					removeEventListener( MouseEvent.MOUSE_DOWN, mouseEventHandler );
					removeEventListener( MouseEvent.MOUSE_OUT, mouseEventHandler );
					this.mouseOut();
					break;
			}
		}
	}
}