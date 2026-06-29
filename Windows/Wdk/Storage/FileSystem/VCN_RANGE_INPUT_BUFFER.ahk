#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct VCN_RANGE_INPUT_BUFFER {
    #StructPack 8

    StartingVcn : Int64

    ClusterCount : Int64

}
