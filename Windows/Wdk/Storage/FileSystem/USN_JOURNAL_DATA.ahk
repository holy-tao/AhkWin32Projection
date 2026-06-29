#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct USN_JOURNAL_DATA {
    #StructPack 8

    UsnJournalID : Int64

    FirstUsn : Int64

    NextUsn : Int64

    LowestValidUsn : Int64

    MaxUsn : Int64

    MaximumSize : Int64

    AllocationDelta : Int64

    MinSupportedMajorVersion : UInt16

    MaxSupportedMajorVersion : UInt16

}
