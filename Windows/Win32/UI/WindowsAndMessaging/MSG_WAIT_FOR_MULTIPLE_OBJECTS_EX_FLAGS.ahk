#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class MSG_WAIT_FOR_MULTIPLE_OBJECTS_EX_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static MWMO_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MWMO_ALERTABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MWMO_INPUTAVAILABLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MWMO_WAITALL => 1
}
