#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class DEVMODE_DISPLAY_FIXED_OUTPUT extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static DMDFO_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DMDFO_STRETCH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DMDFO_CENTER => 2
}
