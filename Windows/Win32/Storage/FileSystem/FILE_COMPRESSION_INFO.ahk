#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\COMPRESSION_FORMAT.ahk" { COMPRESSION_FORMAT }

/**
 * Receives file compression information.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_compression_info
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FILE_COMPRESSION_INFO {
    #StructPack 8

    /**
     * The file size of the compressed file.
     */
    CompressedFileSize : Int64

    /**
     * The compression format that is used to compress the file.
     */
    CompressionFormat : COMPRESSION_FORMAT

    /**
     * The factor that the compression uses.
     */
    CompressionUnitShift : Int8

    /**
     * The number of chunks that are shifted by compression.
     */
    ChunkShift : Int8

    /**
     * The number of clusters that are shifted by compression.
     */
    ClusterShift : Int8

    /**
     * Reserved.
     */
    Reserved : Int8[3]

}
