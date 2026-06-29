#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct READ_AHEAD_PARAMETERS {
    #StructPack 4

    NodeByteSize : Int16

    Granularity : UInt32

    PipelinedRequestSize : UInt32

    ReadAheadGrowthPercentage : UInt32

}
