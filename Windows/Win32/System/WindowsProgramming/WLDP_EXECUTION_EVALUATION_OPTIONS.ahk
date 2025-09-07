#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies execution options when querying for execution authorization with WldpCanExecuteBuffer, WldpCanExecuteFile, and WldpCanExecuteStream.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/wldp/ne-wldp-wldp_execution_evaluation_options
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class WLDP_EXECUTION_EVALUATION_OPTIONS{

    /**
     * No options.
     * @type {Integer (Int32)}
     */
    static WLDP_EXECUTION_EVALUATION_OPTION_NONE => 0

    /**
     * The execution is requested for an interactive session, such as using Powershell or cmd.
     * @type {Integer (Int32)}
     */
    static WLDP_EXECUTION_EVALUATION_OPTION_EXECUTE_IN_INTERACTIVE_SESSION => 1
}
