#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class BI_COMPRESSION extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static BI_RGB => 0

    /**
     * @type {Integer (UInt32)}
     */
    static BI_RLE8 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BI_RLE4 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BI_BITFIELDS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static BI_JPEG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BI_PNG => 5
}
