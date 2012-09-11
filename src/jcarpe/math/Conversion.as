package jcarpe.math
{
	/**
	 * Conversion
	 * 
	 * Utility conversion class for various unit types.
	 * 
	 * @author Joe Carpenito
	 */
	public class Conversion
	{
		/**
		 * Method to convert a degree value to radians
		 * 
		 * @param degrees
		 * :value in degrees to be converted to radians
		 * 
		 * @return radians
		 */		
		public static function Deg2Rad(degrees:Number) : Number
		{
			var radians:Number = 0.0;
			
			radians = degrees*(Math.PI/180);
			
			return radians;
		}
		
		/**
		 * Method to convert a radian value to degrees
		 * 
		 * @param radians
		 * :value in radians to be converted to degrees
		 * 
		 * @return degrees
		 */		
		public static function Rad2Deg(radians:Number) : Number
		{
			var degrees:Number = 0.0;
			
			degrees = radians*(180/Math.PI);
			
			return degrees;
		}
	}
}