#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class OFFLOAD_INTEGRITY_ALGO extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static OFFLOAD_IPSEC_INTEGRITY_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static OFFLOAD_IPSEC_INTEGRITY_MD5 => 1

    /**
     * @type {Integer (Int32)}
     */
    static OFFLOAD_IPSEC_INTEGRITY_SHA => 2

    /**
     * @type {Integer (Int32)}
     */
    static OFFLOAD_IPSEC_INTEGRITY_MAX => 3
}
