#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
class OBJ_TYPE extends Win32Enum {

    /**
     * Native name: OBJ_PEN
     * @type {Integer (Int32)}
     */
    static PEN => 1

    /**
     * Native name: OBJ_BRUSH
     * @type {Integer (Int32)}
     */
    static BRUSH => 2

    /**
     * Native name: OBJ_DC
     * @type {Integer (Int32)}
     */
    static DC => 3

    /**
     * Native name: OBJ_METADC
     * @type {Integer (Int32)}
     */
    static METADC => 4

    /**
     * Native name: OBJ_PAL
     * @type {Integer (Int32)}
     */
    static PAL => 5

    /**
     * Native name: OBJ_FONT
     * @type {Integer (Int32)}
     */
    static FONT => 6

    /**
     * Native name: OBJ_BITMAP
     * @type {Integer (Int32)}
     */
    static BITMAP => 7

    /**
     * Native name: OBJ_REGION
     * @type {Integer (Int32)}
     */
    static REGION => 8

    /**
     * Native name: OBJ_METAFILE
     * @type {Integer (Int32)}
     */
    static METAFILE => 9

    /**
     * Native name: OBJ_MEMDC
     * @type {Integer (Int32)}
     */
    static MEMDC => 10

    /**
     * Native name: OBJ_EXTPEN
     * @type {Integer (Int32)}
     */
    static EXTPEN => 11

    /**
     * Native name: OBJ_ENHMETADC
     * @type {Integer (Int32)}
     */
    static ENHMETADC => 12

    /**
     * Native name: OBJ_ENHMETAFILE
     * @type {Integer (Int32)}
     */
    static ENHMETAFILE => 13

    /**
     * Native name: OBJ_COLORSPACE
     * @type {Integer (Int32)}
     */
    static COLORSPACE => 14
}
