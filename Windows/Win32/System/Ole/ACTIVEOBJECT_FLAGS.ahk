#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 */
class ACTIVEOBJECT_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: ACTIVEOBJECT_STRONG
     * @type {Integer (UInt32)}
     */
    static STRONG => 0

    /**
     * Native name: ACTIVEOBJECT_WEAK
     * @type {Integer (UInt32)}
     */
    static WEAK => 1
}
