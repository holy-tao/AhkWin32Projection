#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class UDP_ENCAP_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static OFFLOAD_IPSEC_UDPESP_ENCAPTYPE_IKE => 0

    /**
     * @type {Integer (Int32)}
     */
    static OFFLOAD_IPSEC_UDPESP_ENCAPTYPE_OTHER => 1
}
