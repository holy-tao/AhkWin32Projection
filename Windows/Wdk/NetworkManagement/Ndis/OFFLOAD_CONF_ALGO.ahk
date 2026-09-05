#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
class OFFLOAD_CONF_ALGO extends Win32Enum {

    /**
     * Native name: OFFLOAD_IPSEC_CONF_NONE
     * @type {Integer (Int32)}
     */
    static IPSEC_CONF_NONE => 0

    /**
     * Native name: OFFLOAD_IPSEC_CONF_DES
     * @type {Integer (Int32)}
     */
    static IPSEC_CONF_DES => 1

    /**
     * Native name: OFFLOAD_IPSEC_CONF_RESERVED
     * @type {Integer (Int32)}
     */
    static IPSEC_CONF_RESERVED => 2

    /**
     * Native name: OFFLOAD_IPSEC_CONF_3_DES
     * @type {Integer (Int32)}
     */
    static IPSEC_CONF_3_DES => 3

    /**
     * Native name: OFFLOAD_IPSEC_CONF_MAX
     * @type {Integer (Int32)}
     */
    static IPSEC_CONF_MAX => 4
}
