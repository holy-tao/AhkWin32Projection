#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DMA_TRANSFER_INFO_V1 {
    #StructPack 4

    MapRegisterCount : UInt32

    ScatterGatherElementCount : UInt32

    ScatterGatherListSize : UInt32

}
