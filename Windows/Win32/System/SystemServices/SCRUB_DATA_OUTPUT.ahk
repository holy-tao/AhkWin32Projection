#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct SCRUB_DATA_OUTPUT {
    #StructPack 8

    Size : UInt32

    Flags : UInt32

    Status : UInt32

    ErrorFileOffset : Int64

    ErrorLength : Int64

    NumberOfBytesRepaired : Int64

    NumberOfBytesFailed : Int64

    InternalFileReference : Int64

    ResumeContextLength : UInt16

    ParityExtentDataOffset : UInt16

    NextStartingByteOffset : Int64

    ValidDataLength : Int64

    Reserved : UInt32[4]

    NumberOfMetadataBytesProcessed : Int64

    NumberOfDataBytesProcessed : Int64

    TotalNumberOfMetadataBytesInUse : Int64

    TotalNumberOfDataBytesInUse : Int64

    DataBytesSkippedDueToNoAllocation : Int64

    DataBytesSkippedDueToInvalidRun : Int64

    DataBytesSkippedDueToIntegrityStream : Int64

    DataBytesSkippedDueToRegionBeingClean : Int64

    DataBytesSkippedDueToLockConflict : Int64

    DataBytesSkippedDueToNoScrubDataFlag : Int64

    DataBytesSkippedDueToNoScrubNonIntegrityStreamFlag : Int64

    DataBytesScrubbed : Int64

    ResumeContext : Int8[1040]

}
