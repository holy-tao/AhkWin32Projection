#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class SXH_PROXY_SETTING extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SXH_PROXY_SET_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static SXH_PROXY_SET_PRECONFIG => 0

    /**
     * @type {Integer (Int32)}
     */
    static SXH_PROXY_SET_DIRECT => 1

    /**
     * @type {Integer (Int32)}
     */
    static SXH_PROXY_SET_PROXY => 2
}
