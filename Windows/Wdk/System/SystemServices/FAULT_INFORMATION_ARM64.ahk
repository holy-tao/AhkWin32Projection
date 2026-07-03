#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import ".\FAULT_INFORMATION_ARM64_TYPE.ahk" { FAULT_INFORMATION_ARM64_TYPE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct FAULT_INFORMATION_ARM64 {
    #StructPack 8

    DomainHandle : IntPtr

    FaultAddress : IntPtr

    PhysicalDeviceObject : DEVICE_OBJECT.Ptr

    InputMappingId : UInt32

    Flags : IntPtr

    Type : FAULT_INFORMATION_ARM64_TYPE

    IommuBaseAddress : Int64

}
