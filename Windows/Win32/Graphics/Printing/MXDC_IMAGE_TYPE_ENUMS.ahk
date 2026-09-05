#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
class MXDC_IMAGE_TYPE_ENUMS extends Win32Enum {

    /**
     * Native name: MXDC_IMAGETYPE_JPEGHIGH_COMPRESSION
     * @type {Integer (Int32)}
     */
    static IMAGETYPE_JPEGHIGH_COMPRESSION => 1

    /**
     * Native name: MXDC_IMAGETYPE_JPEGMEDIUM_COMPRESSION
     * @type {Integer (Int32)}
     */
    static IMAGETYPE_JPEGMEDIUM_COMPRESSION => 2

    /**
     * Native name: MXDC_IMAGETYPE_JPEGLOW_COMPRESSION
     * @type {Integer (Int32)}
     */
    static IMAGETYPE_JPEGLOW_COMPRESSION => 3

    /**
     * Native name: MXDC_IMAGETYPE_PNG
     * @type {Integer (Int32)}
     */
    static IMAGETYPE_PNG => 4
}
