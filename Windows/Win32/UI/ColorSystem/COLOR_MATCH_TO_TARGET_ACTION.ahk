#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.ColorSystem
 * @version v4.0.30319
 */
class COLOR_MATCH_TO_TARGET_ACTION extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static CS_ENABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CS_DISABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CS_DELETE_TRANSFORM => 3
}
