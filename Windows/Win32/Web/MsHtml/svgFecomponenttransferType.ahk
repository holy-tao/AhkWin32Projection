#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class svgFecomponenttransferType extends Win32Enum {

    /**
     * Native name: SVG_FECOMPONENTTRANSFER_TYPE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: SVG_FECOMPONENTTRANSFER_TYPE_IDENTITY
     * @type {Integer (Int32)}
     */
    static IDENTITY => 1

    /**
     * Native name: SVG_FECOMPONENTTRANSFER_TYPE_TABLE
     * @type {Integer (Int32)}
     */
    static TABLE => 2

    /**
     * Native name: SVG_FECOMPONENTTRANSFER_TYPE_DISCRETE
     * @type {Integer (Int32)}
     */
    static DISCRETE => 3

    /**
     * Native name: SVG_FECOMPONENTTRANSFER_TYPE_LINEAR
     * @type {Integer (Int32)}
     */
    static LINEAR => 4

    /**
     * Native name: SVG_FECOMPONENTTRANSFER_TYPE_GAMMA
     * @type {Integer (Int32)}
     */
    static GAMMA => 5

    /**
     * Native name: svgFecomponenttransferType_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
