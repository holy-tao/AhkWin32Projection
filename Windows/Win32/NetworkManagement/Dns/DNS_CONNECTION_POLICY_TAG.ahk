#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_CONNECTION_POLICY_TAG extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TAG_DNS_CONNECTION_POLICY_TAG_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static TAG_DNS_CONNECTION_POLICY_TAG_CONNECTION_MANAGER => 1

    /**
     * @type {Integer (Int32)}
     */
    static TAG_DNS_CONNECTION_POLICY_TAG_WWWPT => 2
}
