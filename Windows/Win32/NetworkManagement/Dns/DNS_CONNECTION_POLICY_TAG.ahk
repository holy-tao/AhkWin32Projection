#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
class DNS_CONNECTION_POLICY_TAG extends Win32Enum {

    /**
     * Native name: TAG_DNS_CONNECTION_POLICY_TAG_DEFAULT
     * @type {Integer (Int32)}
     */
    static DNS_CONNECTION_POLICY_TAG_DEFAULT => 0

    /**
     * Native name: TAG_DNS_CONNECTION_POLICY_TAG_CONNECTION_MANAGER
     * @type {Integer (Int32)}
     */
    static DNS_CONNECTION_POLICY_TAG_CONNECTION_MANAGER => 1

    /**
     * Native name: TAG_DNS_CONNECTION_POLICY_TAG_WWWPT
     * @type {Integer (Int32)}
     */
    static DNS_CONNECTION_POLICY_TAG_WWWPT => 2
}
