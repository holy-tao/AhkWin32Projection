#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class NL_INTERFACE_NETWORK_CATEGORY_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NlincCategoryUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static NlincPublic => 1

    /**
     * @type {Integer (Int32)}
     */
    static NlincPrivate => 2

    /**
     * @type {Integer (Int32)}
     */
    static NlincDomainAuthenticated => 3

    /**
     * @type {Integer (Int32)}
     */
    static NlincCategoryStateMax => 4
}
