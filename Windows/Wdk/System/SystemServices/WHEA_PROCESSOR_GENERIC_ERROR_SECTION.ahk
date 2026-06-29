#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_PROCESSOR_GENERIC_ERROR_SECTION {
    #StructPack 8

    ValidBits : IntPtr

    ProcessorType : Int8

    InstructionSet : Int8

    ErrorType : Int8

    Operation : Int8

    Flags : Int8

    Level : Int8

    Reserved : UInt16

    CPUVersion : Int64

    CPUBrandString : Int8[128]

    ProcessorId : Int64

    TargetAddress : Int64

    RequesterId : Int64

    ResponderId : Int64

    InstructionPointer : Int64

}
