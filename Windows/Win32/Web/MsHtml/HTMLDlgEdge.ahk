#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class HTMLDlgEdge extends Win32Enum {

    /**
     * Native name: HTMLDlgEdgeSunken
     * @type {Integer (Int32)}
     */
    static Sunken => 0

    /**
     * Native name: HTMLDlgEdgeRaised
     * @type {Integer (Int32)}
     */
    static Raised => 16

    /**
     * Native name: HTMLDlgEdge_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
