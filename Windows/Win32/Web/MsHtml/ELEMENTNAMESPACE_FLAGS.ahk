#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ELEMENTNAMESPACE_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ELEMENTNAMESPACEFLAGS_ALLOWANYTAG => 1

    /**
     * @type {Integer (Int32)}
     */
    static ELEMENTNAMESPACEFLAGS_QUERYFORUNKNOWNTAGS => 2

    /**
     * @type {Integer (Int32)}
     */
    static ELEMENTNAMESPACE_FLAGS_Max => 2147483647
}
