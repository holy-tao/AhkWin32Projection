#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct MFT_ENUM_DATA {
    #StructPack 8

    StartFileReferenceNumber : Int64

    LowUsn : Int64

    HighUsn : Int64

    MinMajorVersion : UInt16

    MaxMajorVersion : UInt16

}
