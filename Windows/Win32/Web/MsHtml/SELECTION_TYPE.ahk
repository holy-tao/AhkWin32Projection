#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class SELECTION_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SELECTION_TYPE_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static SELECTION_TYPE_Caret => 1

    /**
     * @type {Integer (Int32)}
     */
    static SELECTION_TYPE_Text => 2

    /**
     * @type {Integer (Int32)}
     */
    static SELECTION_TYPE_Control => 3

    /**
     * @type {Integer (Int32)}
     */
    static SELECTION_TYPE_Max => 2147483647
}
