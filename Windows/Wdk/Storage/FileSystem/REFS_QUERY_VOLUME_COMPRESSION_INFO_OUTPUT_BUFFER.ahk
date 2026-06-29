#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\REFS_COMPRESSION_FORMATS.ahk" { REFS_COMPRESSION_FORMATS }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct REFS_QUERY_VOLUME_COMPRESSION_INFO_OUTPUT_BUFFER {
    #StructPack 8

    DefaultCompressionFormat : REFS_COMPRESSION_FORMATS

    DefaultCompressionLevel : Int16

    DefaultCompressionChunkSizeBytes : UInt32

    VolumeClusterSizeBytes : UInt32

    TotalVolumeClusters : Int64

    TotalAllocatedClusters : Int64

    TotalCompressibleClustersAllocated : Int64

    TotalCompressibleClustersInUse : Int64

    TotalCompressedClusters : Int64

    Reserved : Int64[6]

}
