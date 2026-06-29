#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct REFS_VOLUME_DATA_BUFFER {
    #StructPack 8

    ByteCount : UInt32

    MajorVersion : UInt32

    MinorVersion : UInt32

    BytesPerPhysicalSector : UInt32

    VolumeSerialNumber : Int64

    NumberSectors : Int64

    TotalClusters : Int64

    FreeClusters : Int64

    TotalReserved : Int64

    BytesPerSector : UInt32

    BytesPerCluster : UInt32

    MaximumSizeOfResidentFile : Int64

    FastTierDataFillRatio : UInt16

    SlowTierDataFillRatio : UInt16

    DestagesFastTierToSlowTierRate : UInt32

    MetadataChecksumType : UInt16

    Reserved0 : Int8[6]

    DriverMajorVersion : UInt32

    DriverMinorVersion : UInt32

    Reserved : Int64[7]

}
