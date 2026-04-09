#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlAdjacency extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static htmlAdjacencyBeforeBegin => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlAdjacencyAfterBegin => 2

    /**
     * @type {Integer (Int32)}
     */
    static htmlAdjacencyBeforeEnd => 3

    /**
     * @type {Integer (Int32)}
     */
    static htmlAdjacencyAfterEnd => 4

    /**
     * @type {Integer (Int32)}
     */
    static htmlAdjacency_Max => 2147483647
}
