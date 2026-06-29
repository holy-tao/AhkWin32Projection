#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct FILE_FS_FULL_SIZE_INFORMATION_EX {
    #StructPack 8

    ActualTotalAllocationUnits : Int64

    ActualAvailableAllocationUnits : Int64

    ActualPoolUnavailableAllocationUnits : Int64

    CallerTotalAllocationUnits : Int64

    CallerAvailableAllocationUnits : Int64

    CallerPoolUnavailableAllocationUnits : Int64

    UsedAllocationUnits : Int64

    TotalReservedAllocationUnits : Int64

    VolumeStorageReserveAllocationUnits : Int64

    AvailableCommittedAllocationUnits : Int64

    PoolAvailableAllocationUnits : Int64

    SectorsPerAllocationUnit : UInt32

    BytesPerSector : UInt32

}
