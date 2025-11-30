#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class FONT_FAMILY extends Win32Enum{

    /**
     * @type {Integer (Byte)}
     */
    static FF_DECORATIVE => 0x50

    /**
     * @type {Integer (Byte)}
     */
    static FF_DONTCARE => 0x00

    /**
     * @type {Integer (Byte)}
     */
    static FF_MODERN => 0x30

    /**
     * @type {Integer (Byte)}
     */
    static FF_ROMAN => 0x10

    /**
     * @type {Integer (Byte)}
     */
    static FF_SCRIPT => 0x40

    /**
     * @type {Integer (Byte)}
     */
    static FF_SWISS => 0x20
}
