package jcarpe.loading
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.ProgressEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import jcarpe.events.JDataEvent;
	
	/**
	 * XMLLoader
	 * 
	 * An XML loader and parser.
	 * 
	 * @author Joe Carpenito
	 */
	public class XMLLoader extends EventDispatcher
	{
		// --------------------------------------------------------------------------------
		// VARIABLES
		// --------------------------------------------------------------------------------
		private var _xmlLoader:URLLoader;
		
		// --------------------------------------------------------------------------------
		// PROPERTIES
		// --------------------------------------------------------------------------------
		private var _data:XML;

		public function get data():XML
		{
			return _data;
		}
		
		private var _progress:Number = 0;

		public function get progress():Number
		{
			return _progress;
		}

		public function set progress(value:Number):void
		{
			_progress = value;
		}

		// --------------------------------------------------------------------------------
		// CONSTRUCTOR
		// --------------------------------------------------------------------------------
		public function XMLLoader()
		{
			
		}
		
		// --------------------------------------------------------------------------------
		// PUBLIC METHODS
		// --------------------------------------------------------------------------------
		/**
		 * Method to load a specified XML file into the XML loader.
		 * 
		 * @param xmlURL
		 * :URL path as a String of the XML document
		 * 
		 * @dispatch JDataEvent
		 * :JDataEvent.LOADING_STARTED
		 */		
		public function loadXML( xmlURL:String ) : void
		{
			_xmlLoader = new URLLoader();
			_xmlLoader.addEventListener( Event.COMPLETE, loaderComplete );
			_xmlLoader.addEventListener( ProgressEvent.PROGRESS, loaderProgress );
			_xmlLoader.load( new URLRequest( xmlURL ) );
			
			this.dispatchEvent( new JDataEvent( JDataEvent.LOADING_STARTED ) );
		}
		
		// --------------------------------------------------------------------------------
		// LOAD HANDLERS
		// --------------------------------------------------------------------------------
		/**
		 * @private
		 **/
		private function loaderProgress( event:ProgressEvent ) : void
		{
			var percent:Number = Math.round( (event.bytesLoaded/event.bytesTotal) * 100 );
			progress = percent;
			this.dispatchEvent( new ProgressEvent( ProgressEvent.PROGRESS, false, false, event.bytesLoaded, event.bytesTotal ) );
		}
		
		/**
		 * @private
		 **/
		private function loaderComplete( event:Event ) : void
		{
			_data = XML( event.target.data );
			this.dispatchEvent( new JDataEvent( JDataEvent.COMPLETE, false, false, _data ) );
		}
		
	}
}