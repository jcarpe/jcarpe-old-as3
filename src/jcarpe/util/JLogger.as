package jcarpe.util
{
	import flash.system.Capabilities;
	import flash.system.System;

	/**
	 * JLogger
	 * 
	 * Logger class to make simple trace statements for testing more informative
	 * and easier to execute.
	 * 
	 * @author Joe Carpenito
	 */
	public class JLogger
	{		
		/**
		 * Traces a message to the console from anywhere and includes the object calling the trace function.
		 * 
		 * @param instance
		 * :the object calling jTrace
		 * 
		 * @param message
		 * :the string value of the message to be traced
		 *
		 * @param displayDate
		 * :determines if the date will print ahead of the trace statement
		 **/
		public static function jTrace( instance:Object, message:String, displayDate:Boolean = false ) : void
		{
			trace( new Date() + " :: " + instance.toString() + ": " + message );
		}
		
		/**
		 * Traces out basic system information pertaining to the flash player.
		 */
		public static function jSystemCheck() : void
		{
			trace( "---------- jLogger System Check ----------" 	   		   + "\n" +
				   "------------------------------------------" 	   		   + "\n" +
				   "OS            : " + Capabilities.os				   		   + "\n" +
				   "FP Version    : " + Capabilities.version			   	   + "\n" +
				   "FP Type       : " + Capabilities.playerType				   + "\n" +
				   "CPU Type      : " + Capabilities.cpuArchitecture		   + "\n" +
				   "64Bit Support : " + Capabilities.supports64BitProcesses    + "\n" +
				   "------------------------------------------" 	   		   + "\n" +
				   "------------------------------------------");
		}
		
		/**
		 * Traces out the amount of memory used by the flash player.
		 */
		public static function traceUtilizedMem() : void
		{
			trace( new Date() + " :: " + System.privateMemory/1048576 + " MB of memory" );
		}
	}
}