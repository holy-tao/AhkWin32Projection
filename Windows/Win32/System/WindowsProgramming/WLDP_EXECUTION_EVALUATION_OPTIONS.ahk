#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/wldp/ne-wldp-wldp_execution_evaluation_options
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class WLDP_EXECUTION_EVALUATION_OPTIONS extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static WLDP_EXECUTION_EVALUATION_OPTION_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static WLDP_EXECUTION_EVALUATION_OPTION_EXECUTE_IN_INTERACTIVE_SESSION => 1
}
