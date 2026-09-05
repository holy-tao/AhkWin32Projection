#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlAdjacency extends Win32Enum {

    /**
     * Native name: htmlAdjacencyBeforeBegin
     * @type {Integer (Int32)}
     */
    static BeforeBegin => 1

    /**
     * Native name: htmlAdjacencyAfterBegin
     * @type {Integer (Int32)}
     */
    static AfterBegin => 2

    /**
     * Native name: htmlAdjacencyBeforeEnd
     * @type {Integer (Int32)}
     */
    static BeforeEnd => 3

    /**
     * Native name: htmlAdjacencyAfterEnd
     * @type {Integer (Int32)}
     */
    static AfterEnd => 4

    /**
     * Native name: htmlAdjacency_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
