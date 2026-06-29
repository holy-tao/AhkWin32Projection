#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_802_11_AI_REQFI {
    #StructPack 2

    Capabilities : UInt16

    ListenInterval : UInt16

    CurrentAPAddress : Int8[6]

}
