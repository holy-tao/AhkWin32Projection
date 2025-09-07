#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class NETSETUP_JOIN_STATUS{

    /**
     * @type {Integer (Int32)}
     */
    static NetSetupUnknownStatus => 0

    /**
     * @type {Integer (Int32)}
     */
    static NetSetupUnjoined => 1

    /**
     * @type {Integer (Int32)}
     */
    static NetSetupWorkgroupName => 2

    /**
     * @type {Integer (Int32)}
     */
    static NetSetupDomainName => 3
}
