#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class DEVMODE_COLOR extends Win32Enum{

    /**
     * @type {Integer (Int16)}
     */
    static DMCOLOR_MONOCHROME => 1

    /**
     * @type {Integer (Int16)}
     */
    static DMCOLOR_COLOR => 2
}
