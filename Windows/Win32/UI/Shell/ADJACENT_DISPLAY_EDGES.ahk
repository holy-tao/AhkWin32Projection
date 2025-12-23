#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ADJACENT_DISPLAY_EDGES extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static ADE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static ADE_LEFT => 1

    /**
     * @type {Integer (Int32)}
     */
    static ADE_RIGHT => 2
}
