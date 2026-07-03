#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import ".\EVT_VHF_ASYNC_OPERATION.ahk" { EVT_VHF_ASYNC_OPERATION }
#Import ".\EVT_VHF_CLEANUP.ahk" { EVT_VHF_CLEANUP }
#Import ".\EVT_VHF_READY_FOR_NEXT_READ_REPORT.ahk" { EVT_VHF_READY_FOR_NEXT_READ_REPORT }
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Win32\Foundation\PWSTR.ahk" { PWSTR }

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

    EvtVhfReadyForNextReadReport : EVT_VHF_READY_FOR_NEXT_READ_REPORT

    EvtVhfAsyncOperationGetFeature : EVT_VHF_ASYNC_OPERATION

    EvtVhfAsyncOperationSetFeature : EVT_VHF_ASYNC_OPERATION

    EvtVhfAsyncOperationWriteReport : EVT_VHF_ASYNC_OPERATION

    EvtVhfAsyncOperationGetInputReport : EVT_VHF_ASYNC_OPERATION

    EvtVhfCleanup : EVT_VHF_CLEANUP

    HardwareIDsLength : UInt16

    HardwareIDs : PWSTR

}
