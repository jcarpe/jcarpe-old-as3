package jcarpe.ui
{
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * IJButton
	 * 
	 * Interface for the JButton class and can be utilized by classes extended
	 * from the JButton class.
	 * 
	 * @author Joe Carpenito
	 */
	public interface IJButton
	{
		function destroy() : void;
		function configMouseEvents() : void;
		function deconfigMouseEvents() : void;
		function mouseOver() : void;
		function mouseDown() : void;
		function mouseUp() : void;
		function mouseOut() : void;
	}
}