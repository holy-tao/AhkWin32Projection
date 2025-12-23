#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class CREATE_POLYGON_RGN_MODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ALTERNATE => 1

    /**
     * @type {Integer (Int32)}
     */
    static WINDING => 2
}
