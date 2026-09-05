#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class SELECTION_TYPE extends Win32Enum {

    /**
     * Native name: SELECTION_TYPE_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: SELECTION_TYPE_Caret
     * @type {Integer (Int32)}
     */
    static Caret => 1

    /**
     * Native name: SELECTION_TYPE_Text
     * @type {Integer (Int32)}
     */
    static Text => 2

    /**
     * Native name: SELECTION_TYPE_Control
     * @type {Integer (Int32)}
     */
    static Control => 3

    /**
     * Native name: SELECTION_TYPE_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
