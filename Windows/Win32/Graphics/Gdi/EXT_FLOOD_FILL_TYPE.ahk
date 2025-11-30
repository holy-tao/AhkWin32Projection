#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EXT_FLOOD_FILL_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static FLOODFILLBORDER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FLOODFILLSURFACE => 1
}
