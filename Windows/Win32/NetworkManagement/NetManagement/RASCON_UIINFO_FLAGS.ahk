#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class RASCON_UIINFO_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RCUIF_VPN => 1

    /**
     * @type {Integer (Int32)}
     */
    static RCUIF_DEMAND_DIAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static RCUIF_NOT_ADMIN => 4

    /**
     * @type {Integer (Int32)}
     */
    static RCUIF_USE_IPv4_STATICADDRESS => 8

    /**
     * @type {Integer (Int32)}
     */
    static RCUIF_USE_IPv4_NAME_SERVERS => 16

    /**
     * @type {Integer (Int32)}
     */
    static RCUIF_USE_IPv4_REMOTE_GATEWAY => 32

    /**
     * @type {Integer (Int32)}
     */
    static RCUIF_USE_IPv4_EXPLICIT_METRIC => 64

    /**
     * @type {Integer (Int32)}
     */
    static RCUIF_USE_HEADER_COMPRESSION => 128

    /**
     * @type {Integer (Int32)}
     */
    static RCUIF_USE_DISABLE_REGISTER_DNS => 256

    /**
     * @type {Integer (Int32)}
     */
    static RCUIF_USE_PRIVATE_DNS_SUFFIX => 512

    /**
     * @type {Integer (Int32)}
     */
    static RCUIF_ENABLE_NBT => 1024

    /**
     * @type {Integer (Int32)}
     */
    static RCUIF_USE_IPv6_STATICADDRESS => 2048

    /**
     * @type {Integer (Int32)}
     */
    static RCUIF_USE_IPv6_NAME_SERVERS => 4096

    /**
     * @type {Integer (Int32)}
     */
    static RCUIF_USE_IPv6_REMOTE_GATEWAY => 8192

    /**
     * @type {Integer (Int32)}
     */
    static RCUIF_USE_IPv6_EXPLICIT_METRIC => 16384

    /**
     * @type {Integer (Int32)}
     */
    static RCUIF_DISABLE_CLASS_BASED_ROUTE => 32768
}
