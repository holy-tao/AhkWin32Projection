#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_802_11_NETWORK_TYPE.ahk" { NDIS_802_11_NETWORK_TYPE }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_802_11_NETWORK_TYPE_LIST {
    #StructPack 4

    NumberOfItems : UInt32

    NetworkType : NDIS_802_11_NETWORK_TYPE[1]

}
