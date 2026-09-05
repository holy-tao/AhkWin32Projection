#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
class SXH_PROXY_SETTING extends Win32Enum {

    /**
     * Native name: SXH_PROXY_SET_DEFAULT
     * @type {Integer (Int32)}
     */
    static SET_DEFAULT => 0

    /**
     * Native name: SXH_PROXY_SET_PRECONFIG
     * @type {Integer (Int32)}
     */
    static SET_PRECONFIG => 0

    /**
     * Native name: SXH_PROXY_SET_DIRECT
     * @type {Integer (Int32)}
     */
    static SET_DIRECT => 1

    /**
     * Native name: SXH_PROXY_SET_PROXY
     * @type {Integer (Int32)}
     */
    static SET_PROXY => 2
}
