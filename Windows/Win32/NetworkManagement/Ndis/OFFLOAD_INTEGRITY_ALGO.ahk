#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
class OFFLOAD_INTEGRITY_ALGO extends Win32Enum {

    /**
     * Native name: OFFLOAD_IPSEC_INTEGRITY_NONE
     * @type {Integer (Int32)}
     */
    static IPSEC_INTEGRITY_NONE => 0

    /**
     * Native name: OFFLOAD_IPSEC_INTEGRITY_MD5
     * @type {Integer (Int32)}
     */
    static IPSEC_INTEGRITY_MD5 => 1

    /**
     * Native name: OFFLOAD_IPSEC_INTEGRITY_SHA
     * @type {Integer (Int32)}
     */
    static IPSEC_INTEGRITY_SHA => 2

    /**
     * Native name: OFFLOAD_IPSEC_INTEGRITY_MAX
     * @type {Integer (Int32)}
     */
    static IPSEC_INTEGRITY_MAX => 3
}
