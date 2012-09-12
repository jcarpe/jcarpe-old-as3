package jcarpe.util
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.PixelSnapping;
	import flash.display.Stage;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;

	/**
	 * ImageManipulator
	 * 
	 * Utility for manipulations of images. All public methods in this class accept ONLY Bitmap 
	 * objects and all functions will automatically set PixelSnapping.ALWAYS and smoothing 
	 * to true for methods that return a Bitmap object.
	 * 
	 * @author Joe Carpenito
	 */
	public class ImageManipulator
	{
		/**
		 * Crops a bitmap and returns the cropped bitmap. If no bitmap is provided, a bitmap the dimensions of the crop area will be returned.
		 * 
		 * @param _x
		 * X value to begin crop
		 * 
		 * @param _y
		 * Y value to begin crop
		 * 
		 * @param _width
		 * Width value of the crop
		 * 
		 * @param _height
		 * Height value of the crop
		 * 
		 * @param _stage
		 * The stage that the DisplayObject to be cropped is on
		 * 
		 * @param bitmap
		 * The Bitmap to be cropped
		 * 
		 * @return croppedBitmap
		 * :the cropped bitmap instance
		 */
		public static function crop( _x:Number, _y:Number, _width:Number, _height:Number, _stage:Stage, bitmap:Bitmap = null ) : Bitmap
		{
			// rectangle that indicates the bounds of the crop
			var cropArea:Rectangle = new Rectangle( 0, 0, _width, _height );

			// the image to be cropped
			var croppedBitmap:Bitmap = new Bitmap( new BitmapData( _width, _height ), PixelSnapping.ALWAYS, true );
			croppedBitmap.bitmapData.draw( ( bitmap != null ) ? bitmap : _stage, new Matrix(1, 0, 0, 1, -_x, -_y) , null, null, cropArea, true );
			
			return croppedBitmap;
		}
		
		/**
		 * Reflects a bitmap and then zeros out it's x,y coordinates.
		 * 
		 * @param _bitmap
		 * The Bitmap to be reflected
		 * 
		 * @param direction
		 * Indicates a "horizontal" or "vertical" reflection
		 * 
		 * @return reflectedBitmap
		 * :the reflected bitmap instance
		 * 
		 * @throws ArgumentError
		 * :'direction' property is not 'horizontal' or 'verticle': jcarpe.util.ImageManipulator.reflect()
		 */
		public static function reflect( _bitmap:Bitmap, direction:String = "horizontal" ) : Bitmap
		{
			// check "direction" against possible directions
			if( direction != "horizontal" && direction != "vertical" )
			{
				throw new ArgumentError( "'direction' property is not 'horizontal' or 'verticle': jcarpe.util.ImageManipulator.reflect()" );
			}
			else
			{
				// create transform matrix based on type of reflection
				var transformMatrix:Matrix;
				switch( direction )
				{
					case "horizontal":
						transformMatrix = new Matrix( -1, 0, 0, 0, _bitmap.width, 0 );
						break;
					
					case "vertical":
						transformMatrix = new Matrix( 0, 0, 0, -1, 0, _bitmap.height );
						break;
				}
				
				// the reflected bitmap
				var reflectedBitmap:Bitmap = new Bitmap( new BitmapData( _bitmap.width, _bitmap.height ), PixelSnapping.ALWAYS, true );
				reflectedBitmap.bitmapData.draw( _bitmap, transformMatrix, null, null, null, true );
				
				return reflectedBitmap;
			}
		}
		
		/**
		 * Samples the color of a pixel in a provided bitmap at the x,y coordinate provided.
		 * The advantage to using this over just <code>BitmapData.getPixel32( x, y )</code> is
		 * that if you are out of the bounds of the bitmap, it will throw an error so you know
		 * what you've done wrong.
		 * 
		 * @param _x
		 * X position of desired pixel
		 * 
		 * @param _y
		 * Y position of desired pixel
		 * 
		 * @param _bitmap
		 * The bitmap to be sampled from
		 * 
		 * @return sampleColor
		 * :the uint value of the sampled color
		 * 
		 * @throws Error
		 * :the provided coordinates are outside the bounds of the provided bitmap
		 **/
		public static function samplePixelColor( _x:Number, _y:Number, _bitmap:Bitmap ) : uint
		{
			// check to see if the provided coordinates are within the bitmap bounds
			if( _x > _bitmap.width || _y > _bitmap.height || _x < 0 || _y < 0 )
			{
				throw new Error( "the provided coordinates are outside the bounds of the provided bitmap" );
			}
			else
			{
				// the bitmap to be sampled
				var sourceBitmapData:BitmapData = _bitmap.bitmapData;
				
				// the sampled color value
				var sampleColor:uint = sourceBitmapData.getPixel32( _x, _y );
				
				return sampleColor;
			}
		}
		
		/**
		 * Adjusts the saturation of an image on a scale of -255 to 255.
		 * 
		 * @param bitmap
		 * the bitmap to be altered
		 * 
		 * @param satValue
		 * value to alter the bitmap saturation
		 * 
		 * @return saturatedBitmap
		 * the saturated bitmap
		 * 
		 * @throws ArgumentError
		 * the saturation value is out of range 
		 **/
		public static function saturation( bitmap:Bitmap, satValue:Number = 0 ) : Bitmap
		{
			// augmented saturation value
			var saturation:Number;
			
			if( satValue > 255 || satValue < -255 )
			{
				new ArgumentError( "the saturation value is out of range" );
			} else {
				saturation = satValue/255;
			}
			
			// bitmap of altered saturation value
			var saturatedBitmap:Bitmap;
			
			bitmap.transform.colorTransform = new ColorTransform( 1, 1, 1, 1, satValue, satValue, satValue, 0 );
			saturatedBitmap = bitmap;
			
			return saturatedBitmap;
		}
		
	}
}