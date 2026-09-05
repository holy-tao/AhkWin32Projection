#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Threading
 */
class POWER_REQUEST_CONTEXT_FLAGS extends Win32Enum {

    /**
     * Native name: POWER_REQUEST_CONTEXT_DETAILED_STRING
     * @type {Integer (UInt32)}
     */
    static DETAILED_STRING => 2

    /**
     * Native name: POWER_REQUEST_CONTEXT_SIMPLE_STRING
     * @type {Integer (UInt32)}
     */
    static SIMPLE_STRING => 1
}
