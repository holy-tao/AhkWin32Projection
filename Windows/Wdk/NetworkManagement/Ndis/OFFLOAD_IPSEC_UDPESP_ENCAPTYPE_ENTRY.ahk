#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\UDP_ENCAP_TYPE.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
class OFFLOAD_IPSEC_UDPESP_ENCAPTYPE_ENTRY extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {UDP_ENCAP_TYPE}
     */
    UdpEncapType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    DstEncapPort {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }
}
