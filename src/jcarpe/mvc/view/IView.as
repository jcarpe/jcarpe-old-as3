package jcarpe.mvc.view
{
	/**
	 * IView
	 * 
	 * @author Joe Carpenito
	 * 
	 * The view interface.
	 */
	public interface IView
	{
		function destroy() : Boolean;
		function update() : void;
	}
}