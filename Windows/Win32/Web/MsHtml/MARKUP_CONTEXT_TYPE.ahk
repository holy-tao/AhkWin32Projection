#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class MARKUP_CONTEXT_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CONTEXT_TYPE_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static CONTEXT_TYPE_Text => 1

    /**
     * @type {Integer (Int32)}
     */
    static CONTEXT_TYPE_EnterScope => 2

    /**
     * @type {Integer (Int32)}
     */
    static CONTEXT_TYPE_ExitScope => 3

    /**
     * @type {Integer (Int32)}
     */
    static CONTEXT_TYPE_NoScope => 4

    /**
     * @type {Integer (Int32)}
     */
    static MARKUP_CONTEXT_TYPE_Max => 2147483647
}
