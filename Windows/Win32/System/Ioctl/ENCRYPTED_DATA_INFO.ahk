#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct ENCRYPTED_DATA_INFO {
    #StructPack 8

    StartingFileOffset : Int64

    OutputBufferOffset : UInt32

    BytesWithinFileSize : UInt32

    BytesWithinValidDataLength : UInt32

    CompressionFormat : UInt16

    DataUnitShift : Int8

    ChunkShift : Int8

    ClusterShift : Int8

    EncryptionFormat : Int8

    NumberOfDataBlocks : UInt16

    DataBlockSize : UInt32[1]

}
