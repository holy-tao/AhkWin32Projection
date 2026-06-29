#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct GEN_GET_NETCARD_TIME {
    #StructPack 8

    ReadTime : Int64

}
