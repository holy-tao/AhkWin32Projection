#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct CM_EISA_FUNCTION_INFORMATION {
    #StructPack 8

    CompressedId : UInt32

    IdSlotFlags1 : Int8

    IdSlotFlags2 : Int8

    MinorRevision : Int8

    MajorRevision : Int8

    Selections : Int8[26]

    FunctionFlags : Int8

    TypeString : Int8[80]

    EisaMemory : IntPtr[9]

    EisaIrq : IntPtr[7]

    EisaDma : IntPtr[4]

    EisaPort : IntPtr[20]

    InitializationData : Int8[60]

}
