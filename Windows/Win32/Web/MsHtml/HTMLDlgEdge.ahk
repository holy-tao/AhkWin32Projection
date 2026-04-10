#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class HTMLDlgEdge extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static HTMLDlgEdgeSunken => 0

    /**
     * @type {Integer (Int32)}
     */
    static HTMLDlgEdgeRaised => 16

    /**
     * @type {Integer (Int32)}
     */
    static HTMLDlgEdge_Max => 2147483647
}
