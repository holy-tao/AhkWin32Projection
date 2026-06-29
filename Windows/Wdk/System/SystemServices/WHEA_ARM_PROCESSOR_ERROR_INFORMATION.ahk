#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_ARM_PROCESSOR_ERROR_INFORMATION {
    #StructPack 8

    Version : Int8

    Length : Int8

    ValidationBit : IntPtr

    Type : Int8

    MultipleError : UInt16

    Flags : Int8

    ErrorInformation : Int64

    VirtualFaultAddress : Int64

    PhysicalFaultAddress : Int64

}
