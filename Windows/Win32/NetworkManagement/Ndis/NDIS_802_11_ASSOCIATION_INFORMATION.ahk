#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_802_11_AI_REQFI.ahk" { NDIS_802_11_AI_REQFI }
#Import ".\NDIS_802_11_AI_RESFI.ahk" { NDIS_802_11_AI_RESFI }

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_802_11_ASSOCIATION_INFORMATION {
    #StructPack 4

    Length : UInt32

    AvailableRequestFixedIEs : UInt16

    RequestFixedIEs : NDIS_802_11_AI_REQFI

    RequestIELength : UInt32

    OffsetRequestIEs : UInt32

    AvailableResponseFixedIEs : UInt16

    ResponseFixedIEs : NDIS_802_11_AI_RESFI

    ResponseIELength : UInt32

    OffsetResponseIEs : UInt32

}
