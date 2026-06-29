#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_802_11_STATUS_TYPE.ahk" { NDIS_802_11_STATUS_TYPE }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_802_11_STATUS_INDICATION {
    #StructPack 4

    StatusType : NDIS_802_11_STATUS_TYPE

}
