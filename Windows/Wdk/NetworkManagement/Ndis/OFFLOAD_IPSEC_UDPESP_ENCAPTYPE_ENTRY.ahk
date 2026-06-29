#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\UDP_ENCAP_TYPE.ahk" { UDP_ENCAP_TYPE }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct OFFLOAD_IPSEC_UDPESP_ENCAPTYPE_ENTRY {
    #StructPack 4

    UdpEncapType : UDP_ENCAP_TYPE

    DstEncapPort : UInt16

}
