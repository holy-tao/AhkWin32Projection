#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class DOCHOSTUITYPE extends Win32Enum {

    /**
     * Native name: DOCHOSTUITYPE_BROWSE
     * @type {Integer (Int32)}
     */
    static BROWSE => 0

    /**
     * Native name: DOCHOSTUITYPE_AUTHOR
     * @type {Integer (Int32)}
     */
    static AUTHOR => 1
}
