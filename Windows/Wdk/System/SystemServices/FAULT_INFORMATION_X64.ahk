#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FAULT_INFORMATION_ARM64_TYPE.ahk" { FAULT_INFORMATION_ARM64_TYPE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct FAULT_INFORMATION_X64 {
    #StructPack 8

    DomainHandle : IntPtr

    FaultAddress : IntPtr

    Flags : IntPtr

    Type : FAULT_INFORMATION_ARM64_TYPE

    IommuBaseAddress : Int64

    PciSegment : UInt32

}
