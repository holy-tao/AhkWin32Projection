#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class NL_NETWORK_CATEGORY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NetworkCategoryPublic => 0

    /**
     * @type {Integer (Int32)}
     */
    static NetworkCategoryPrivate => 1

    /**
     * @type {Integer (Int32)}
     */
    static NetworkCategoryDomainAuthenticated => 2

    /**
     * @type {Integer (Int32)}
     */
    static NetworkCategoryUnchanged => -1

    /**
     * @type {Integer (Int32)}
     */
    static NetworkCategoryUnknown => -1
}
