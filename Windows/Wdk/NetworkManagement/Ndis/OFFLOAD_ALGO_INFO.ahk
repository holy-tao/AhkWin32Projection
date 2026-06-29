#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct OFFLOAD_ALGO_INFO {
    #StructPack 4

    algoIdentifier : UInt32

    algoKeylen : UInt32

    algoRounds : UInt32

}
