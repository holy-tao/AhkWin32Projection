#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class FILLTYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static FT_SOLID => 0

    /**
     * @type {Integer (Int32)}
     */
    static FT_VERTGRADIENT => 1

    /**
     * @type {Integer (Int32)}
     */
    static FT_HORZGRADIENT => 2

    /**
     * @type {Integer (Int32)}
     */
    static FT_RADIALGRADIENT => 3

    /**
     * @type {Integer (Int32)}
     */
    static FT_TILEIMAGE => 4
}
