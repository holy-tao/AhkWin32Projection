#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
class BI_COMPRESSION extends Win32Enum {

    /**
     * Native name: BI_RGB
     * @type {Integer (UInt32)}
     */
    static RGB => 0

    /**
     * Native name: BI_RLE8
     * @type {Integer (UInt32)}
     */
    static RLE8 => 1

    /**
     * Native name: BI_RLE4
     * @type {Integer (UInt32)}
     */
    static RLE4 => 2

    /**
     * Native name: BI_BITFIELDS
     * @type {Integer (UInt32)}
     */
    static BITFIELDS => 3

    /**
     * Native name: BI_JPEG
     * @type {Integer (UInt32)}
     */
    static JPEG => 4

    /**
     * Native name: BI_PNG
     * @type {Integer (UInt32)}
     */
    static PNG => 5
}
