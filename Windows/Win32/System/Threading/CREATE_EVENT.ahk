#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class CREATE_EVENT extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_EVENT_INITIAL_SET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_EVENT_MANUAL_RESET => 1
}
