#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class NL_NETWORK_CATEGORY extends Win32Enum {

    /**
     * Native name: NetworkCategoryPublic
     * @type {Integer (Int32)}
     */
    static Public => 0

    /**
     * Native name: NetworkCategoryPrivate
     * @type {Integer (Int32)}
     */
    static Private => 1

    /**
     * Native name: NetworkCategoryDomainAuthenticated
     * @type {Integer (Int32)}
     */
    static DomainAuthenticated => 2

    /**
     * Native name: NetworkCategoryUnchanged
     * @type {Integer (Int32)}
     */
    static Unchanged => -1

    /**
     * Native name: NetworkCategoryUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => -1
}
