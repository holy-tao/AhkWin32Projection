#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_PAINT_ATTRIBUTES extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_PAINT_ATTRIBUTES_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_PAINT_ATTRIBUTES_USES_PALETTE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_PAINT_ATTRIBUTES_USES_TEXT_COLOR => 2
}
