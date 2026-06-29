#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_ACPI_HEADER {
    #StructPack 8

    Signature : UInt32

    Length : UInt32

    Revision : Int8

    Checksum : Int8

    OemId : Int8[6]

    OemTableId : Int64

    OemRevision : UInt32

    CreatorId : UInt32

    CreatorRevision : UInt32

}
