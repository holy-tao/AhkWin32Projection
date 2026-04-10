#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 */
class ACTIVEOBJECT_FLAGS extends Win32BitflagEnum {

    /**
     * @type {Integer (UInt32)}
     */
    static ACTIVEOBJECT_STRONG => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ACTIVEOBJECT_WEAK => 1
}
