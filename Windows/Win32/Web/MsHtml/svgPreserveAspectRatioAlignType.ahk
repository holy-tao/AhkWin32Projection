#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class svgPreserveAspectRatioAlignType extends Win32Enum {

    /**
     * Native name: SVG_PRESERVEASPECTRATIO_UNKNOWN
     * @type {Integer (Int32)}
     */
    static PRESERVEASPECTRATIO_UNKNOWN => 0

    /**
     * Native name: SVG_PRESERVEASPECTRATIO_NONE
     * @type {Integer (Int32)}
     */
    static PRESERVEASPECTRATIO_NONE => 1

    /**
     * Native name: SVG_PRESERVEASPECTRATIO_XMINYMIN
     * @type {Integer (Int32)}
     */
    static PRESERVEASPECTRATIO_XMINYMIN => 2

    /**
     * Native name: SVG_PRESERVEASPECTRATIO_XMIDYMIN
     * @type {Integer (Int32)}
     */
    static PRESERVEASPECTRATIO_XMIDYMIN => 3

    /**
     * Native name: SVG_PRESERVEASPECTRATIO_XMAXYMIN
     * @type {Integer (Int32)}
     */
    static PRESERVEASPECTRATIO_XMAXYMIN => 4

    /**
     * Native name: SVG_PRESERVEASPECTRATIO_XMINYMID
     * @type {Integer (Int32)}
     */
    static PRESERVEASPECTRATIO_XMINYMID => 5

    /**
     * Native name: SVG_PRESERVEASPECTRATIO_XMIDYMID
     * @type {Integer (Int32)}
     */
    static PRESERVEASPECTRATIO_XMIDYMID => 6

    /**
     * Native name: SVG_PRESERVEASPECTRATIO_XMAXYMID
     * @type {Integer (Int32)}
     */
    static PRESERVEASPECTRATIO_XMAXYMID => 7

    /**
     * Native name: SVG_PRESERVEASPECTRATIO_XMINYMAX
     * @type {Integer (Int32)}
     */
    static PRESERVEASPECTRATIO_XMINYMAX => 8

    /**
     * Native name: SVG_PRESERVEASPECTRATIO_XMIDYMAX
     * @type {Integer (Int32)}
     */
    static PRESERVEASPECTRATIO_XMIDYMAX => 9

    /**
     * Native name: SVG_PRESERVEASPECTRATIO_XMAXYMAX
     * @type {Integer (Int32)}
     */
    static PRESERVEASPECTRATIO_XMAXYMAX => 10

    /**
     * Native name: svgPreserveAspectRatioAlignType_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
