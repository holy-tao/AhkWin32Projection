#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class FONT_RESOURCE_CHARACTERISTICS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static FR_PRIVATE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FR_NOT_ENUM => 32
}
