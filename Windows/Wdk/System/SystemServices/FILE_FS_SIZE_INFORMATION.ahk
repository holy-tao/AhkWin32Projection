#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct FILE_FS_SIZE_INFORMATION {
    #StructPack 8

    TotalAllocationUnits : Int64

    AvailableAllocationUnits : Int64

    SectorsPerAllocationUnit : UInt32

    BytesPerSector : UInt32

}
