package jcarpe.ui
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.CapsStyle;
	import flash.display.JointStyle;
	import flash.display.PixelSnapping;
	import flash.display.Sprite;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.DropShadowFilter;
	import flash.geom.ColorTransform;
	import flash.text.AntiAliasType;
	import flash.text.Font;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.utils.HAlign;
	
	/**
	 * ToolTip
	 * 
	 * A flexible tool tip class that will zero out at the arrow point, no matter the 
	 * orientation of the arrow along the toop tip bubble.
	 * 
	 * @author Joe Carpenito
	 */
	public class ToolTipStarling extends starling.display.Sprite
	{
		// --------------------------------------------------------------------------------
		// VARIABLES
		// --------------------------------------------------------------------------------
		private var _textField:TextField;
		private var _bubbleGFX:flash.display.Sprite	= new flash.display.Sprite();
		
		// --------------------------------------------------------------------------------
		// PROPERTIES
		// --------------------------------------------------------------------------------
		private var _text:String;
		/**
		 * A string value that represents the text of tool tip;
		 */
		public function get text():String
		{
			return _text;
		}
		
		public function set text(value:String):void
		{
			_text = value;
		}
		
		private var _textColor:uint;
		/**
		 * The color value for the text of the tool tip.
		 */
		public function get textColor():uint
		{
			return _textColor;
		}
		
		public function set textColor(value:uint):void
		{
			_textColor = value;
		}
		
		private var _textSize:Number;
		/**
		 * The size of the text of the tool tip.
		 */
		public function get textSize():Number
		{
			return _textSize;
		}
		
		public function set textSize(value:Number):void
		{
			_textSize = value;
		}
		
		private var _textFont:Font;
		/**
		 * A font object for the tool tip text.
		 */
		public function get textFont():Font
		{
			return _textFont;
		}
		
		public function set textFont(value:Font):void
		{
			_textFont = value;
		}
		
		private var _textFieldHeight:uint;
		/**
		 * The height of the starling text field.
		 */
		public function get textFieldHeight():uint
		{
			return _textFieldHeight;
		}

		public function set textFieldHeight(value:uint):void
		{
			_textFieldHeight = value;
		}

		
		private var _bgColor:uint;
		/**
		 * Background color for the tool tip bubble graphic.
		 */
		public function get bgColor():uint
		{
			return _bgColor;
		}
		
		public function set bgColor(value:uint):void
		{
			_bgColor = value;
		}
		
		private var _outlineColor:uint;
		/**
		 * Outline color for the tool tip bubble graphic.
		 */
		public function get outlineColor():uint
		{
			return _outlineColor;
		}
		
		public function set outlineColor(value:uint):void
		{
			_outlineColor = value;
		}
		
		private var _outlineThickness:Number;
		/**
		 * Thickness of the outline for the tool tip bubble graphic. If the value is zero
		 * then the line style is not set.
		 */
		public function get outlineThickness():Number
		{
			return _outlineThickness;
		}
		
		public function set outlineThickness(value:Number):void
		{
			_outlineThickness = value;
		}
		
		private var _cornerBevel:Number;
		/**
		 * Size of the corner bevel for the tool tip graphic. A value of null is read as
		 * zero.
		 */
		public function get cornerBevel():Number
		{
			return _cornerBevel;
		}
		
		public function set cornerBevel(value:Number):void
		{
			_cornerBevel = value;
		}
		
		private var _arrowHeight:Number;
		/**
		 * Height of the arrow of the tool tip.
		 */
		public function get arrowHeight():Number
		{
			return _arrowHeight;
		}
		
		public function set arrowHeight(value:Number):void
		{
			_arrowHeight = value;
		}
		
		private var _arrowWidth:Number;
		/**
		 * Width of the arrow of the tool tip.
		 */
		public function get arrowWidth():Number
		{
			return _arrowWidth;
		}
		
		public function set arrowWidth(value:Number):void
		{
			_arrowWidth = value;
		}
		
		private var _arrowPosition:String;
		/**
		 * The position of the arrow on the tool tip. The value must be a member of the
		 * jcarpe.ui.ToolTipArrowPosition class.
		 */
		public function get arrowPosition():String
		{
			return _arrowPosition;
		}
		
		public function set arrowPosition(value:String):void
		{
			var crossCheck:Boolean = false;
			
			// make sure the value is a member of ToolTipArowPosition
			for( var i:Number = 0; i < ToolTipArrowPosition.positionArray.length; i++ )
			{
				if( value == ToolTipArrowPosition.positionArray[i] ) 
				{ 
					crossCheck = true;
					break;
				}
			}
			
			if( crossCheck == true ) { _arrowPosition = value; }
			else { throw new ArgumentError( value + " is not a member of jcarpe.ui.ToolTipArrowPosition" ); }
		}
		
		private var _padding:Number;
		/**
		 * Padding around the content of the tool tip. This value will affect the component
		 * width and height.
		 */
		public function get padding():Number
		{
			return _padding;
		}
		
		public function set padding(value:Number):void
		{
			_padding = value;
		}
		
		private var _maxWidth:Number;
		/**
		 * The maximum allowable width of the text box of the tool tip.
		 */
		public function get maxWidth():Number
		{
			return _maxWidth;
		}
		
		public function set maxWidth(value:Number):void
		{
			_maxWidth = value;
		}
		
		private var _hasShadow:Boolean;
		/**
		 * Determines whether or not to render a drop shadow.
		 */
		public function get hasShadow():Boolean
		{
			return _hasShadow;
		}
		
		public function set hasShadow(value:Boolean):void
		{
			_hasShadow = value;
		}
		
		private var _shadowDistance:Number;
		/**
		 * Determines the distance of the drop shadow.
		 */
		public function get shadowDistance():Number
		{
			return _shadowDistance;
		}
		
		public function set shadowDistance(value:Number):void
		{
			_shadowDistance = value;
		}
		
		private var _shadowBlur:Number;
		/**
		 * Determines the how strong the blur of the drop shadow is.
		 */
		public function get shadowBlur():Number
		{
			return _shadowBlur;
		}
		
		public function set shadowBlur(value:Number):void
		{
			_shadowBlur = value;
		}
		
		private var _shadowStrength:Number;
		/**
		 * Opacity (strength) of the drop shadow.
		 */
		public function get shadowStrength():Number
		{
			return _shadowStrength;
		}
		
		public function set shadowStrength(value:Number):void
		{
			_shadowStrength = value;
		}
		
		
		// --------------------------------------------------------------------------------
		// CONSTRUCTOR
		// --------------------------------------------------------------------------------
		public function ToolTipStarling( _text:String = "", _textColor:uint = 0x000000, _textSize:Number = 12, _textFont:Font = null, _textFieldHeight:uint = 18, _bgColor:uint = 0xFFFFFF, _outlineColor:uint = 0x000000, _outlineThickness:Number = 1, _cornerBevel:Number = 0, _arrowPosition:String = ToolTipArrowPosition.BOTTOM_CENTER, _arrowHeight:Number = 15, _arrowWidth:Number = 12, _padding:Number = 5, _maxWidth:Number = 200 )
		{
			text 							= _text;
			textColor 						= _textColor;
			textSize 						= _textSize;
			textFont 						= _textFont;
			textFieldHeight 				= _textFieldHeight;
			bgColor 						= _bgColor;
			outlineColor 					= _outlineColor;
			outlineThickness 				= _outlineThickness;
			cornerBevel 					= _cornerBevel;
			arrowHeight 					= _arrowHeight;
			arrowWidth						= _arrowWidth;
			arrowPosition 					= _arrowPosition;
			padding							= _padding;
			maxWidth 						= _maxWidth;
			hasShadow						= false;
			shadowDistance					= 0;
			shadowBlur 						= 0;
			shadowStrength					= 0.5;
			
			super();
			
			addEventListener( Event.ADDED_TO_STAGE, init );
		}
		
		// --------------------------------------------------------------------------------
		// PUBLIC METHODS
		// --------------------------------------------------------------------------------
		/**
		 * Dispose method that will destroy all children of the tool tip.
		 */
		public function destroy() : void
		{
			// run through display list and get rid of all the children
			while( this.numChildren > 0 )
			{
				this.removeChildAt( 0 );
			}
		}
		
		// --------------------------------------------------------------------------------
		// PRIVATE METHODS
		// --------------------------------------------------------------------------------
		/**
		 * @private
		 **/
		private function renderTip() : void
		{			
			// starling text field creation
			_textField 							= new TextField( maxWidth, textFieldHeight, text );
			_textField.color					= textColor;
			_textField.hAlign 					= HAlign.LEFT;
			_textField.fontSize					= textSize;
			if( textFont != null ) { _textField.fontName = textFont.fontName; }
			_textField.width 					= maxWidth;
			
			// determined dimensions and make sure they are even numbers (for better rendering)
			var drawCommands:Vector.<int> 		= new Vector.<int>();
			var drawCoordinates:Vector.<Number> = new Vector.<Number>();
			var componentWidth:Number 			= _textField.width + padding*2;
			if( componentWidth % 2 == 1 ) { componentWidth++; }
			var componentHeight:Number 			= _textField.height + padding*2;
			if( componentHeight % 2 == 1 ) { componentHeight++; }
			
			// variables to store the offset in order to zero the tool tip at the point of the arrow
			var offSetX:Number 					= 0;
			var offSetY:Number 					= 0;
			
			// find the requested arrow position and then determine if there is a bevel
			// determined drawing commands for the graphics drawing API
			// line breaks in coordinates are per drawing command
			_bubbleGFX.graphics.clear();
			_bubbleGFX.graphics.beginFill( bgColor, 1 );
			if( outlineThickness >= 1 ) { _bubbleGFX.graphics.lineStyle( outlineThickness, outlineColor, 1, true, "none", CapsStyle.ROUND, JointStyle.ROUND, 3 ); }
			
			switch( arrowPosition )
			{
				case ToolTipArrowPosition.BOTTOM_CENTER:
					if( cornerBevel == 0 )
					{
						drawCommands.push( 1, 2, 2, 2, 2, 2, 2, 2 );
						drawCoordinates.push( 0,0, 
							componentWidth,0, 
							componentWidth,componentHeight, 
							(componentWidth/2+arrowWidth/2),componentHeight, 
							(componentWidth/2),(componentHeight+arrowHeight), 
							(componentWidth/2-arrowWidth/2),componentHeight, 
							0,componentHeight, 
							0,0 );
						
						offSetX = (componentWidth/2);
						offSetY = (componentHeight+arrowHeight);
					} else {
						drawCommands.push( 1, 2, 3, 2, 3, 2, 2, 2, 2, 3, 2, 3 );
						drawCoordinates.push( cornerBevel,0, 
							(componentWidth-cornerBevel),0, 
							componentWidth,0, componentWidth,cornerBevel, 
							componentWidth,(componentHeight-cornerBevel), 
							componentWidth,componentHeight, (componentWidth-cornerBevel),componentHeight, 
							(componentWidth/2+arrowWidth/2),componentHeight,
							(componentWidth/2),(componentHeight+arrowHeight),
							(componentWidth/2-arrowWidth/2),(componentHeight),
							cornerBevel,componentHeight,
							0,componentHeight, 0,componentHeight-cornerBevel,
							0,cornerBevel,
							0,0, cornerBevel,0 );
						
						offSetX = (componentWidth/2);
						offSetY = (componentHeight+arrowHeight);
					}
					break;
				
				case ToolTipArrowPosition.BOTTOM_LEFT:
					if( cornerBevel == 0 )
					{
						drawCommands.push( 1, 2, 2, 2, 2, 2, 2 );
						drawCoordinates.push( 0,0, 
							componentWidth,0, 
							componentWidth,componentHeight, 
							arrowWidth,componentHeight, 
							(arrowWidth/2),(componentHeight+arrowHeight), 
							0,componentHeight, 
							0,0 );
						
						offSetX = (arrowWidth/2);
						offSetY = (componentHeight+arrowHeight);
					} else {
						drawCommands.push( 1, 2, 3, 2, 3, 2, 2, 2, 3, 2, 3 );
						drawCoordinates.push( cornerBevel,0, 
							(componentWidth-cornerBevel),0, 
							componentWidth,0, componentWidth,cornerBevel, 
							componentWidth,(componentHeight-cornerBevel), 
							componentWidth,componentHeight, (componentWidth-cornerBevel),componentHeight, 
							(cornerBevel+arrowWidth),componentHeight,
							(cornerBevel+arrowWidth/2),(componentHeight+arrowHeight),
							cornerBevel,componentHeight,
							0,componentHeight, 0,componentHeight-cornerBevel,
							0,cornerBevel,
							0,0, cornerBevel,0 );
						
						offSetX = (cornerBevel+arrowWidth/2);
						offSetY = (componentHeight+arrowHeight);
					}
					break;
				
				case ToolTipArrowPosition.BOTTOM_RIGHT:
					if( cornerBevel == 0 )
					{
						drawCommands.push( 1, 2, 2, 2, 2, 2, 2 );
						drawCoordinates.push( 0,0, 
							componentWidth,0, 
							componentWidth,componentHeight, 
							(componentWidth-arrowWidth/2),(componentHeight+arrowHeight), 
							(componentWidth-arrowWidth),componentHeight, 
							0,componentHeight, 
							0,0 );
						
						offSetX = (componentWidth-arrowWidth/2);
						offSetY = (componentHeight+arrowHeight);
					} else {
						drawCommands.push( 1, 2, 3, 2, 3, 2, 2, 2, 3, 2, 3 );
						drawCoordinates.push( cornerBevel,0, 
							(componentWidth-cornerBevel),0, 
							componentWidth,0, componentWidth,cornerBevel, 
							componentWidth,(componentHeight-cornerBevel), 
							componentWidth,componentHeight, (componentWidth-cornerBevel),componentHeight, 
							(componentWidth-cornerBevel-arrowWidth/2),(componentHeight+arrowHeight),
							(componentWidth-cornerBevel-arrowWidth),componentHeight,
							cornerBevel,componentHeight,
							0,componentHeight, 0,componentHeight-cornerBevel,
							0,cornerBevel,
							0,0, cornerBevel,0 );
						
						offSetX = (componentWidth-cornerBevel-arrowWidth/2);
						offSetY = (componentHeight+arrowHeight);
					}
					break;
				
				case ToolTipArrowPosition.TOP_CENTER:
					if( cornerBevel == 0 )
					{
						drawCommands.push( 1, 2, 2, 2, 2, 2, 2, 2 );
						drawCoordinates.push( 0,0, 
							(componentWidth/2-arrowWidth/2),0, 
							(componentWidth/2),-arrowHeight, 
							(componentWidth/2 + arrowWidth/2),0, 
							componentWidth,0, 
							componentWidth,componentHeight, 
							0,componentHeight, 
							0,0 );
						
						offSetX = (componentWidth/2);
						offSetY = -arrowHeight;
					} else {
						drawCommands.push( 1, 2, 2, 2, 2, 3, 2, 3, 2, 3, 2, 3 );
						drawCoordinates.push( cornerBevel,0, 
							(componentWidth/2-arrowWidth/2),0, 
							(componentWidth/2),-arrowHeight, 
							(componentWidth/2 + arrowWidth/2),0, 
							(componentWidth-cornerBevel),0, 
							componentWidth,0, componentWidth,cornerBevel,  
							componentWidth,(componentHeight-cornerBevel),
							componentWidth,componentHeight, (componentWidth-cornerBevel),componentHeight, 
							cornerBevel,componentHeight,
							0,componentHeight, 0,(componentHeight-cornerBevel), 
							0,cornerBevel,
							0,0, cornerBevel,0 );
						
						offSetX = (componentWidth/2);
						offSetY = -arrowHeight;
					}
					break;
				
				case ToolTipArrowPosition.TOP_LEFT:
					if( cornerBevel == 0 )
					{
						drawCommands.push( 1, 2, 2, 2, 2, 2, 2 );
						drawCoordinates.push( 0,0, 
							(arrowWidth/2),-arrowHeight, 
							arrowWidth,0, 
							componentWidth,0, 
							componentWidth,componentHeight, 
							0,componentHeight, 
							0,0 );
						
						offSetX = (arrowWidth/2);
						offSetY = -arrowHeight;
					} else {
						drawCommands.push( 1, 2, 2, 2, 3, 2, 3, 2, 3, 2, 3 );
						drawCoordinates.push( cornerBevel,0, 
							(arrowWidth/2+cornerBevel),-arrowHeight, 
							(arrowWidth+cornerBevel),0, 
							(componentWidth-cornerBevel),0, 
							componentWidth,0, componentWidth,cornerBevel,  
							componentWidth,(componentHeight-cornerBevel),
							componentWidth,componentHeight, (componentWidth-cornerBevel),componentHeight, 
							cornerBevel,componentHeight,
							0,componentHeight, 0,(componentHeight-cornerBevel), 
							0,cornerBevel,
							0,0, cornerBevel,0 );
						
						offSetX = (arrowWidth/2+cornerBevel);
						offSetY = -arrowHeight;
					}
					break;
				
				case ToolTipArrowPosition.TOP_RIGHT:
					if( cornerBevel == 0 )
					{
						drawCommands.push( 1, 2, 2, 2, 2, 2, 2 );
						drawCoordinates.push( 0,0, 
							(componentWidth-arrowWidth),0, 
							(componentWidth-arrowWidth/2),-arrowHeight, 
							componentWidth,0, 
							componentWidth,componentHeight, 
							0,componentHeight, 
							0,0 );
						
						offSetX = (componentWidth-arrowWidth/2);
						offSetY = -arrowHeight;
					} else {
						drawCommands.push( 1, 2, 2, 2, 3, 2, 3, 2, 3, 2, 3 );
						drawCoordinates.push( cornerBevel,0, 
							(componentWidth-arrowWidth-cornerBevel),0, 
							(componentWidth-arrowWidth/2-cornerBevel),-arrowHeight, 
							(componentWidth-cornerBevel),0, 
							componentWidth,0, componentWidth,cornerBevel,  
							componentWidth,(componentHeight-cornerBevel),
							componentWidth,componentHeight, (componentWidth-cornerBevel),componentHeight, 
							cornerBevel,componentHeight,
							0,componentHeight, 0,(componentHeight-cornerBevel), 
							0,cornerBevel,
							0,0, cornerBevel,0 );
						
						offSetX = (componentWidth-arrowWidth/2-cornerBevel);
						offSetY = -arrowHeight;
					}
					break;
				
				case ToolTipArrowPosition.LEFT_BOTTOM:
					if( cornerBevel == 0 )
					{
						drawCommands.push( 1, 2, 2, 2, 2, 2, 2 );
						drawCoordinates.push( 0,0, 
							componentWidth,0, 
							componentWidth,componentHeight, 
							0,componentHeight, 
							-arrowHeight,(componentHeight-arrowWidth/2), 
							0,(componentHeight-arrowWidth), 
							0,0 );
						
						offSetX = -arrowHeight;
						offSetY = (componentHeight-arrowWidth/2);
					} else {
						drawCommands.push( 1, 2, 3, 2, 3, 2, 3, 2, 2, 2, 3 );
						drawCoordinates.push( cornerBevel,0, 
							(componentWidth-cornerBevel),0, 
							componentWidth,0, componentWidth,cornerBevel,
							componentWidth,(componentHeight-cornerBevel), 
							componentWidth,componentHeight, (componentWidth-cornerBevel),componentHeight,
							cornerBevel,componentHeight, 
							0,componentHeight, 0,(componentHeight-cornerBevel),
							-arrowHeight,(componentHeight-cornerBevel-arrowWidth/2),
							0,(componentHeight-cornerBevel-arrowWidth),
							0,cornerBevel,
							0,0, cornerBevel,0 );
						
						offSetX = -arrowHeight;
						offSetY = (componentHeight-cornerBevel-arrowWidth/2);
					}
					break;
				
				case ToolTipArrowPosition.LEFT_CENTER:
					if( cornerBevel == 0 )
					{
						drawCommands.push( 1, 2, 2, 2, 2, 2, 2, 2 );
						drawCoordinates.push( 0,0, 
							componentWidth,0, 
							componentWidth,componentHeight, 
							0,componentHeight, 
							0,(componentHeight/2+arrowWidth/2), 
							-arrowHeight,(componentHeight/2), 
							0,(componentHeight/2-arrowWidth/2), 
							0,0 );
						
						offSetX = -arrowHeight;
						offSetY = (componentHeight/2);
					} else {
						drawCommands.push( 1, 2, 3, 2, 3, 2, 3, 2, 2, 2, 2, 3 );
						drawCoordinates.push( cornerBevel,0, 
							(componentWidth-cornerBevel),0, 
							componentWidth,0, componentWidth,cornerBevel,
							componentWidth,(componentHeight-cornerBevel), 
							componentWidth,componentHeight, (componentWidth-cornerBevel),componentHeight,
							cornerBevel,componentHeight, 
							0,componentHeight, 0,(componentHeight-cornerBevel),
							0,(componentHeight/2+arrowWidth/2),
							-arrowHeight,(componentHeight/2),
							0,(componentHeight/2-arrowWidth/2),
							0,cornerBevel,
							0,0, cornerBevel,0 );
						
						offSetX = -arrowHeight;
						offSetY = (componentHeight/2);
					}
					break;
				
				case ToolTipArrowPosition.LEFT_TOP:
					if( cornerBevel == 0 )
					{
						drawCommands.push( 1, 2, 2, 2, 2, 2, 2 );
						drawCoordinates.push( 0,0, 
							componentWidth,0, 
							componentWidth,componentHeight, 
							0,componentHeight, 
							0,arrowWidth, 
							-arrowHeight,(arrowWidth/2), 
							0,0 );
						
						offSetX = -arrowHeight;
						offSetY = (arrowWidth/2);
					} else {
						drawCommands.push( 1, 2, 3, 2, 3, 2, 3, 2, 2, 2, 3 );
						drawCoordinates.push( cornerBevel,0, 
							(componentWidth-cornerBevel),0, 
							componentWidth,0, componentWidth,cornerBevel,
							componentWidth,(componentHeight-cornerBevel), 
							componentWidth,componentHeight, (componentWidth-cornerBevel),componentHeight,
							cornerBevel,componentHeight, 
							0,componentHeight, 0,(componentHeight-cornerBevel),
							0,(cornerBevel+arrowWidth),
							-arrowHeight,(cornerBevel+arrowWidth/2),
							0,cornerBevel,
							0,0, cornerBevel,0 );
						
						offSetX = -arrowHeight;
						offSetY = (cornerBevel+arrowWidth/2);
					}
					break;
				
				case ToolTipArrowPosition.RIGHT_BOTTOM:
					if( cornerBevel == 0 )
					{
						drawCommands.push( 1, 2, 2, 2, 2, 2, 2 );
						drawCoordinates.push( 0,0, 
							componentWidth,0, 
							componentWidth,(componentHeight-arrowWidth), 
							(componentWidth+arrowHeight),(componentHeight-arrowWidth/2), 
							componentWidth,componentHeight, 
							0,componentHeight, 
							0,0 );
						
						offSetX = (componentWidth+arrowHeight);
						offSetY = (componentHeight-arrowWidth/2);
					} else {
						
					}
					break;
				
				case ToolTipArrowPosition.RIGHT_CENTER:
					if( cornerBevel == 0 )
					{
						drawCommands.push( 1, 2, 2, 2, 2, 2, 2, 2 );
						drawCoordinates.push( 0,0, 
							componentWidth,0, 
							componentWidth,(componentHeight/2-arrowWidth/2), 
							(componentWidth+arrowHeight),(componentHeight/2), 
							componentWidth,(componentHeight/2+arrowWidth/2), 
							componentWidth,componentHeight, 
							0,componentHeight, 
							0,0 );
						
						offSetX = (componentWidth+arrowHeight);
						offSetY = (componentHeight/2);
					} else {
						
					}
					break;
				
				case ToolTipArrowPosition.RIGHT_TOP:
					if( cornerBevel == 0 )
					{
						drawCommands.push( 1, 2, 2, 2, 2, 2, 2 );
						drawCoordinates.push( 0,0, 
							componentWidth,0, 
							(componentWidth+arrowHeight),(arrowWidth/2), 
							componentWidth,arrowWidth, 
							componentWidth,componentHeight, 
							0,componentHeight, 
							0,0 );
						
						offSetX = (componentWidth+arrowHeight);
						offSetY = (arrowWidth/2);
					} else {
						
					}
					break;
			}
			
			// draw bubble
			_bubbleGFX.graphics.drawPath( drawCommands, drawCoordinates );
			_bubbleGFX.cacheAsBitmap = true;
			
			// add drop shadow
			if( hasShadow == true )
			{
//				_dropShadow.distance 			= shadowDistance;
//				_dropShadow.strength 			= shadowStrength;
//				_dropShadow.blurX 				= shadowBlur;
//				_dropShadow.blurY 				= shadowBlur;
//				_dropShadow.quality 			= BitmapFilterQuality.HIGH;
//				
//				_bubbleGFX.filters = [ _dropShadow ];
			}
			
			// once we have a bubble we need to make it a bitmap and then make it a texture
			// on a Starling object to add it to the tool tip
			var tempBubbleData:BitmapData = new BitmapData( _bubbleGFX.width, _bubbleGFX.height, true );
				tempBubbleData.draw( _bubbleGFX, null, null, null, null, true );
			var tempBubbleBitmap:Bitmap = new Bitmap( tempBubbleData, PixelSnapping.ALWAYS, true );
			var bubbleImage:Image = Image.fromBitmap( tempBubbleBitmap );
			
			// set text field
			_textField.x = _textField.y = padding;
			
			// draw the tool tip
			addChild( bubbleImage );
			addChild( _textField );
			
			// zero out the tool tip
			this.x -= offSetX;
			this.y -= offSetY;
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
			
			renderTip();
		}
		
	}
}