package jcarpe.ui
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	import flash.events.TransformGestureEvent;
	import flash.ui.Multitouch;
	
	import jcarpe.events.JInteractionEvent;
	
	/**
	 * JInteractiveObject
	 * 
	 * This is to replace a MovieClip just in order to catch MouseEvent(s) 
	 * and TouchEvent(s) in order for it to dispatch <code>JInteractionEvent</code>. 
	 * We'll see how that goes. 
	 * 
	 * The use of this object is intended only for development of
	 * software to be deployed on hardware that supports touch input.
	 * 
	 * @see jcarpe.events.JInteractionEvent
	 * 
	 * @author Joe Carpenito
	 **/
	public class JInteractiveObject extends Sprite
	{
		// --------------------------------------------------------------------------------
		// CONSTRUCTOR
		// --------------------------------------------------------------------------------
		public function JInteractiveObject()
		{
			super();
			
			this.addEventListener( Event.ADDED_TO_STAGE, onAddedHandle );
			this.addEventListener( Event.REMOVED_FROM_STAGE, onRemoveHandle );
		}
		
		/**
		 * @private
		 **/
		private function onAddedHandle( event:Event ) : void
		{
			this.removeEventListener( Event.ADDED_TO_STAGE, onAddedHandle );
			configEvents();
		}
		
		/**
		 * @private
		 **/
		private function onRemoveHandle( event:Event ) : void
		{
			this.removeEventListener( Event.REMOVED_FROM_STAGE, onRemoveHandle );
			deconfigEvents();
		}
		
		// --------------------------------------------------------------------------------
		// PRIVATE METHODS
		// --------------------------------------------------------------------------------
		/**
		 * @private
		 **/
		private function configEvents() : void
		{
			// mouse event catches
			addEventListener( MouseEvent.CLICK, mouseHandle );
			addEventListener( MouseEvent.DOUBLE_CLICK, mouseHandle );
			addEventListener( MouseEvent.MOUSE_DOWN, mouseHandle );
			addEventListener( MouseEvent.MOUSE_MOVE, mouseHandle );
			addEventListener( MouseEvent.MOUSE_OUT, mouseHandle );
			addEventListener( MouseEvent.MOUSE_OVER, mouseHandle );
			addEventListener( MouseEvent.MOUSE_UP, mouseHandle );
			
			// touch event catches if, they are supported
			if( Multitouch.supportsTouchEvents )
			{
				addEventListener( TouchEvent.TOUCH_BEGIN, touchHandle );
				addEventListener( TouchEvent.TOUCH_END, touchHandle );
				addEventListener( TouchEvent.TOUCH_MOVE, touchHandle );
				addEventListener( TouchEvent.TOUCH_OUT, touchHandle );
				addEventListener( TouchEvent.TOUCH_OVER, touchHandle );
				addEventListener( TouchEvent.TOUCH_ROLL_OUT, touchHandle );
				addEventListener( TouchEvent.TOUCH_ROLL_OVER, touchHandle );
				addEventListener( TouchEvent.TOUCH_TAP, touchHandle );
			}
			
			// gesture event catches, if they are supported
			if( Multitouch.supportsGestureEvents )
			{
				addEventListener( TransformGestureEvent.GESTURE_PAN, gestureHandle );
				addEventListener( TransformGestureEvent.GESTURE_ROTATE, gestureHandle );
				addEventListener( TransformGestureEvent.GESTURE_SWIPE, gestureHandle );
				addEventListener( TransformGestureEvent.GESTURE_ZOOM, gestureHandle );
			}
		}
		
		/**
		 * @private
		 **/
		private function deconfigEvents() : void
		{
			// mouse event catches
			removeEventListener( MouseEvent.CLICK, mouseHandle );
			removeEventListener( MouseEvent.DOUBLE_CLICK, mouseHandle );
			removeEventListener( MouseEvent.MOUSE_DOWN, mouseHandle );
			removeEventListener( MouseEvent.MOUSE_MOVE, mouseHandle );
			removeEventListener( MouseEvent.MOUSE_OUT, mouseHandle );
			removeEventListener( MouseEvent.MOUSE_OVER, mouseHandle );
			removeEventListener( MouseEvent.MOUSE_UP, mouseHandle );
			
			// touch event catches if, they are supported
			if( Multitouch.supportsTouchEvents )
			{
				removeEventListener( TouchEvent.TOUCH_BEGIN, touchHandle );
				removeEventListener( TouchEvent.TOUCH_END, touchHandle );
				removeEventListener( TouchEvent.TOUCH_MOVE, touchHandle );
				removeEventListener( TouchEvent.TOUCH_OUT, touchHandle );
				removeEventListener( TouchEvent.TOUCH_OVER, touchHandle );
				removeEventListener( TouchEvent.TOUCH_ROLL_OUT, touchHandle );
				removeEventListener( TouchEvent.TOUCH_ROLL_OVER, touchHandle );
				removeEventListener( TouchEvent.TOUCH_TAP, touchHandle );
			}
			
			// gesture event catches, if they are supported
			if( Multitouch.supportsGestureEvents )
			{
				removeEventListener( TransformGestureEvent.GESTURE_PAN, gestureHandle );
				removeEventListener( TransformGestureEvent.GESTURE_ROTATE, gestureHandle );
				removeEventListener( TransformGestureEvent.GESTURE_SWIPE, gestureHandle );
				removeEventListener( TransformGestureEvent.GESTURE_ZOOM, gestureHandle );
			}
		}
		
		// --------------------------------------------------------------------------------
		// INTERACTION HANDLERS
		// --------------------------------------------------------------------------------
		/**
		 * @private
		 **/
		private function mouseHandle( event:MouseEvent ) : void
		{
			switch( event.type )
			{
				case MouseEvent.CLICK:
					dispatchEvent( new JInteractionEvent( JInteractionEvent.TAP ) );
					break;
				
				case MouseEvent.DOUBLE_CLICK:
					dispatchEvent( new JInteractionEvent( JInteractionEvent.DOUBLE_TAP ) );
					break;
				
				case MouseEvent.MOUSE_DOWN:
					dispatchEvent( new JInteractionEvent( JInteractionEvent.DOWN ) );
					break;
				
				case MouseEvent.MOUSE_MOVE:
					dispatchEvent( new JInteractionEvent( JInteractionEvent.MOVE ) );
					break;
				
				case MouseEvent.MOUSE_OUT:
					dispatchEvent( new JInteractionEvent( JInteractionEvent.OUT ) );
					break;
				
				case MouseEvent.MOUSE_OVER:
					dispatchEvent( new JInteractionEvent( JInteractionEvent.OVER ) );
					break;
				
				case MouseEvent.MOUSE_UP:
					dispatchEvent( new JInteractionEvent( JInteractionEvent.UP ) );
					break;
				
				default:
					// default case
					break;
			}
		}
		
		/**
		 * @private
		 **/
		private function touchHandle( event:MouseEvent ) : void
		{
			switch( event.type )
			{
				case TouchEvent.TOUCH_TAP:
					dispatchEvent( new JInteractionEvent( JInteractionEvent.TAP ) );
					break;
				
				case TouchEvent.TOUCH_BEGIN:
					dispatchEvent( new JInteractionEvent( JInteractionEvent.DOWN ) );
					break;
				
				case TouchEvent.TOUCH_END:
					dispatchEvent( new JInteractionEvent( JInteractionEvent.UP ) );
					break;
				
				case TouchEvent.TOUCH_MOVE:
					dispatchEvent( new JInteractionEvent( JInteractionEvent.MOVE ) );
					break;
				
				case TouchEvent.TOUCH_OUT:
					dispatchEvent( new JInteractionEvent( JInteractionEvent.OUT ) );
					break;
				
				case TouchEvent.TOUCH_OVER:
					dispatchEvent( new JInteractionEvent( JInteractionEvent.OVER ) );
					break;
				
				default:
					// default case
					break;
			}
		}
		
		/**
		 * @private
		 **/
		private function gestureHandle( event:TransformGestureEvent ) : void
		{
			switch( event.type )
			{
				case TransformGestureEvent.GESTURE_PAN:
					dispatchEvent( new JInteractionEvent( JInteractionEvent.PAN ) );
					break;
				
				case TransformGestureEvent.GESTURE_ROTATE:
					dispatchEvent( new JInteractionEvent( JInteractionEvent.ROTATE ) );
					break;
				
				case TransformGestureEvent.GESTURE_SWIPE:
					dispatchEvent( new JInteractionEvent( JInteractionEvent.SWIPE ) );
					break;
				
				case TransformGestureEvent.GESTURE_ZOOM:
					dispatchEvent( new JInteractionEvent( JInteractionEvent.ZOOM ) );
					break;
				
				default:
					// default case
					break;
			}
		}
		
	}
}