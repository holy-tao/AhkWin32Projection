#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Threading
 */
class CREATE_EVENT extends Win32BitflagEnum {

    /**
     * Native name: CREATE_EVENT_INITIAL_SET
     * @type {Integer (UInt32)}
     */
    static INITIAL_SET => 2

    /**
     * Native name: CREATE_EVENT_MANUAL_RESET
     * @type {Integer (UInt32)}
     */
    static MANUAL_RESET => 1
}
