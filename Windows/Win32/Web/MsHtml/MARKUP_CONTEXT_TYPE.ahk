#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class MARKUP_CONTEXT_TYPE extends Win32Enum {

    /**
     * Native name: CONTEXT_TYPE_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: CONTEXT_TYPE_Text
     * @type {Integer (Int32)}
     */
    static Text => 1

    /**
     * Native name: CONTEXT_TYPE_EnterScope
     * @type {Integer (Int32)}
     */
    static EnterScope => 2

    /**
     * Native name: CONTEXT_TYPE_ExitScope
     * @type {Integer (Int32)}
     */
    static ExitScope => 3

    /**
     * Native name: CONTEXT_TYPE_NoScope
     * @type {Integer (Int32)}
     */
    static NoScope => 4

    /**
     * Native name: MARKUP_CONTEXT_TYPE_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
