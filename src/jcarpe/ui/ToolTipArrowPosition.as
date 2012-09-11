package jcarpe.ui
{
	/**
	 * ToolTipArrowPosition
	 * 
	 * Describes the possible position constants of the arror on a Tool Tip object.
	 * 
	 * @author Joe Carpenito 
	 */
	public class ToolTipArrowPosition
	{
		public static const TOP_LEFT		:String = "top_left";
		public static const TOP_CENTER		:String = "top_center";
		public static const TOP_RIGHT		:String = "top_right";
		
		public static const BOTTOM_LEFT		:String = "bottom_left";
		public static const BOTTOM_CENTER	:String = "bottom_center";
		public static const BOTTOM_RIGHT	:String = "bottom_right";
		
		public static const LEFT_TOP		:String = "left_top";
		public static const LEFT_CENTER		:String = "left_center";
		public static const LEFT_BOTTOM		:String = "left_bottom";
		
		public static const RIGHT_TOP		:String = "right_top";
		public static const RIGHT_CENTER	:String = "right_center";
		public static const RIGHT_BOTTOM	:String = "right_bottom";
		
		private static var _positionArray:Array = new Array( TOP_CENTER, TOP_LEFT, TOP_RIGHT, BOTTOM_CENTER, BOTTOM_LEFT, BOTTOM_RIGHT, LEFT_BOTTOM, LEFT_CENTER, LEFT_TOP, RIGHT_BOTTOM, RIGHT_CENTER, RIGHT_TOP );

		/**
		 * Return an array of all of the arrow position constants.
		 * 
		 * @returns _positionArray
		 * :array of the position constants
		 */
		public static function get positionArray():Array
		{
			return _positionArray;
		}
	}
}