#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class OFFLOAD_CONF_ALGO extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static OFFLOAD_IPSEC_CONF_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static OFFLOAD_IPSEC_CONF_DES => 1

    /**
     * @type {Integer (Int32)}
     */
    static OFFLOAD_IPSEC_CONF_RESERVED => 2

    /**
     * @type {Integer (Int32)}
     */
    static OFFLOAD_IPSEC_CONF_3_DES => 3

    /**
     * @type {Integer (Int32)}
     */
    static OFFLOAD_IPSEC_CONF_MAX => 4
}
