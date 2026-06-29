#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct FILE_FS_METADATA_SIZE_INFORMATION {
    #StructPack 8

    TotalMetadataAllocationUnits : Int64

    SectorsPerAllocationUnit : UInt32

    BytesPerSector : UInt32

}
