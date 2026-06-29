#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_FS_SECTOR_SIZE_INFORMATION {
    #StructPack 4

    LogicalBytesPerSector : UInt32

    PhysicalBytesPerSectorForAtomicity : UInt32

    PhysicalBytesPerSectorForPerformance : UInt32

    FileSystemEffectivePhysicalBytesPerSectorForAtomicity : UInt32

    Flags : UInt32

    ByteOffsetForSectorAlignment : UInt32

    ByteOffsetForPartitionAlignment : UInt32

}
