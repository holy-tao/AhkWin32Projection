#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class OBJ_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static OBJ_PEN => 1

    /**
     * @type {Integer (Int32)}
     */
    static OBJ_BRUSH => 2

    /**
     * @type {Integer (Int32)}
     */
    static OBJ_DC => 3

    /**
     * @type {Integer (Int32)}
     */
    static OBJ_METADC => 4

    /**
     * @type {Integer (Int32)}
     */
    static OBJ_PAL => 5

    /**
     * @type {Integer (Int32)}
     */
    static OBJ_FONT => 6

    /**
     * @type {Integer (Int32)}
     */
    static OBJ_BITMAP => 7

    /**
     * @type {Integer (Int32)}
     */
    static OBJ_REGION => 8

    /**
     * @type {Integer (Int32)}
     */
    static OBJ_METAFILE => 9

    /**
     * @type {Integer (Int32)}
     */
    static OBJ_MEMDC => 10

    /**
     * @type {Integer (Int32)}
     */
    static OBJ_EXTPEN => 11

    /**
     * @type {Integer (Int32)}
     */
    static OBJ_ENHMETADC => 12

    /**
     * @type {Integer (Int32)}
     */
    static OBJ_ENHMETAFILE => 13

    /**
     * @type {Integer (Int32)}
     */
    static OBJ_COLORSPACE => 14
}
