package jcarpe.ui
{
	import flash.events.Event;
	import flash.events.MouseEvent;

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