#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class FILE_OPERATION_FLAGS2 extends Win32BitflagEnum {

    /**
     * @type {Integer (Int32)}
     */
    static FOF2_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static FOF2_MERGEFOLDERSONCOLLISION => 1
}
