#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct CM_EISA_SLOT_INFORMATION {
    #StructPack 4

    ReturnCode : Int8

    ReturnFlags : Int8

    MajorRevision : Int8

    MinorRevision : Int8

    Checksum : UInt16

    NumberFunctions : Int8

    FunctionInformation : Int8

    CompressedId : UInt32

}
