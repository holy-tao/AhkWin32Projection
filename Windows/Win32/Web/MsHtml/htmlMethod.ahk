#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlMethod extends Win32Enum {

    /**
     * Native name: htmlMethodNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: htmlMethodGet
     * @type {Integer (Int32)}
     */
    static Get => 1

    /**
     * Native name: htmlMethodPost
     * @type {Integer (Int32)}
     */
    static Post => 2

    /**
     * Native name: htmlMethod_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
