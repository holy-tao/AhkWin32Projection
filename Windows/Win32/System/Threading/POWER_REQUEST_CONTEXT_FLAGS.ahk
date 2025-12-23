#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class POWER_REQUEST_CONTEXT_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_REQUEST_CONTEXT_DETAILED_STRING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_REQUEST_CONTEXT_SIMPLE_STRING => 1
}
