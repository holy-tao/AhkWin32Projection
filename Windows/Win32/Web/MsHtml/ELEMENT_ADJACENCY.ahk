#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class ELEMENT_ADJACENCY extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static ELEM_ADJ_BeforeBegin => 0

    /**
     * @type {Integer (Int32)}
     */
    static ELEM_ADJ_AfterBegin => 1

    /**
     * @type {Integer (Int32)}
     */
    static ELEM_ADJ_BeforeEnd => 2

    /**
     * @type {Integer (Int32)}
     */
    static ELEM_ADJ_AfterEnd => 3

    /**
     * Native name: ELEMENT_ADJACENCY_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
