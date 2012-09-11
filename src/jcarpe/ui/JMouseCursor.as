package jcarpe.ui
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	import jcarpe.util.JLogger;
	
	/**
	 * MouseCursor
	 * 
	 * A mouse cursor replacement class that will replace the default system mouse
	 * cursor with a provided graphic asset. It will also kill the default cursor
	 * graphic. The JMouseCursor must be added to an application's stage and not 
	 * to a child display object.
	 * 
	 * @author Joe Carpenito
	 */
	public class JMouseCursor extends Sprite
	{
		// --------------------------------------------------------------------------------
		// PROPERTIES
		// --------------------------------------------------------------------------------
		private var _cursorGraphic:DisplayObject = null;
		/**
		 * A DisplayObject that is the graphic for the cursor.
		 */
		public function get cursorGraphic():DisplayObject
		{
			return _cursorGraphic;
		}

		public function set cursorGraphic(value:DisplayObject):void
		{
			_cursorGraphic = value;
		}
		
		// --------------------------------------------------------------------------------
		// CONSTRUCTOR
		// --------------------------------------------------------------------------------
		public function JMouseCursor()
		{
			addEventListener( Event.ADDED_TO_STAGE, init );
			
			super();
		}
		
		// --------------------------------------------------------------------------------
		// PUBLIC METHODS
		// --------------------------------------------------------------------------------
		/**
		 * Method that will send the cursor object to the top of the stage's display
		 * stack.
		 */
		public function capDisplayStack() : void
		{
			if( stage.contains( this ) == true )
			{
				stage.setChildIndex( this, stage.numChildren-1 );
			}
		}
		
		// --------------------------------------------------------------------------------
		// PRIVATE METHODS
		// --------------------------------------------------------------------------------
		/**
		 * @private
		 **/
		private function render() : void
		{
			// check to see if a cursor graphic has been set
			if( _cursorGraphic != null )
			{
				_cursorGraphic.x = _cursorGraphic.y = 0;
				_cursorGraphic.cacheAsBitmap = true;
				addChild( _cursorGraphic );
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
			
			if( this.parent === stage )
			{
				this.x 				= stage.mouseX;
				this.y 				= stage.mouseY;
				this.mouseChildren 	= false;
				this.mouseEnabled 	= false;
				
				Mouse.hide();
				
				render();
				
				stage.addEventListener( MouseEvent.MOUSE_MOVE, updateCursor );
				stage.addEventListener( Event.MOUSE_LEAVE, hideCursor );
			} else {
				throw new Error( "jcarpe.ui.JMouseCursor must be added to the stage" );	
			}			
		}
		
		/**
		 * @private
		 **/
		private function updateCursor( event:MouseEvent ) : void
		{
			this.visible 		= true;
			this.x 				= event.stageX;
			this.y 				= event.stageY;
		}
		
		/**
		 * @private
		 **/
		private function hideCursor( event:Event ) : void
		{
			this.visible 		= false;
		}
	}
}