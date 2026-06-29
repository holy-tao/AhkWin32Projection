#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_MEMORY_ERROR_SECTION {
    #StructPack 8

    ValidBits : IntPtr

    ErrorStatus : IntPtr

    PhysicalAddress : Int64

    PhysicalAddressMask : Int64

    Node : UInt16

    Card : UInt16

    Module : UInt16

    Bank : UInt16

    Device : UInt16

    Row : UInt16

    Column : UInt16

    BitPosition : UInt16

    RequesterId : Int64

    ResponderId : Int64

    TargetId : Int64

    ErrorType : Int8

    Extended : Int8

    RankNumber : UInt16

    CardHandle : UInt16

    ModuleHandle : UInt16

}
