#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Win32\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Wdk.Devices.HumanInterfaceDevice
 */
export default struct VHF_CONFIG {
    #StructPack 8

    Size : UInt32

    VhfClientContext : IntPtr

    OperationContextSize : UInt32

    FileHandle : HANDLE

    VendorID : UInt16

    ProductID : UInt16

    VersionNumber : UInt16

    ContainerID : Guid

    InstanceIDLength : UInt16

    InstanceID : PWSTR

    ReportDescriptorLength : UInt16

    ReportDescriptor : IntPtr

    EvtVhfReadyForNextReadReport : IntPtr

    EvtVhfAsyncOperationGetFeature : IntPtr

    EvtVhfAsyncOperationSetFeature : IntPtr

    EvtVhfAsyncOperationWriteReport : IntPtr

    EvtVhfAsyncOperationGetInputReport : IntPtr

    EvtVhfCleanup : IntPtr

    HardwareIDsLength : UInt16

    HardwareIDs : PWSTR

}
