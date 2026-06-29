#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct READ_USN_JOURNAL_DATA {
    #StructPack 8

    StartUsn : Int64

    ReasonMask : UInt32

    ReturnOnlyOnClose : UInt32

    Timeout : Int64

    BytesToWaitFor : Int64

    UsnJournalID : Int64

    MinMajorVersion : UInt16

    MaxMajorVersion : UInt16

}
