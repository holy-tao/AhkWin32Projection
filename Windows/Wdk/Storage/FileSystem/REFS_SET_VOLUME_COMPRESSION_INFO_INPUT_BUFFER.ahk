#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\REFS_SET_VOLUME_COMPRESSION_INFO_FLAGS.ahk" { REFS_SET_VOLUME_COMPRESSION_INFO_FLAGS }
#Import ".\REFS_COMPRESSION_FORMATS.ahk" { REFS_COMPRESSION_FORMATS }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct REFS_SET_VOLUME_COMPRESSION_INFO_INPUT_BUFFER {
    #StructPack 8

    CompressionFormat : REFS_COMPRESSION_FORMATS

    CompressionLevel : Int16

    CompressionChunkSizeBytes : UInt32

    Flags : REFS_SET_VOLUME_COMPRESSION_INFO_FLAGS

    Reserved : Int64[8]

}
