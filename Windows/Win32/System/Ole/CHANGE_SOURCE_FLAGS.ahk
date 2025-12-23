#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class CHANGE_SOURCE_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static CSF_SHOWHELP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CSF_VALIDSOURCE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CSF_ONLYGETSOURCE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CSF_EXPLORER => 8
}
