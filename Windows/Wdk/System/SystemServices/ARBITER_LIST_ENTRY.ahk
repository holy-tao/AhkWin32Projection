#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ARBITER_REQUEST_SOURCE.ahk" { ARBITER_REQUEST_SOURCE }
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import ".\ARBITER_RESULT.ahk" { ARBITER_RESULT }
#Import ".\INTERFACE_TYPE.ahk" { INTERFACE_TYPE }
#Import ".\CM_PARTIAL_RESOURCE_DESCRIPTOR.ahk" { CM_PARTIAL_RESOURCE_DESCRIPTOR }
#Import ".\IO_RESOURCE_DESCRIPTOR.ahk" { IO_RESOURCE_DESCRIPTOR }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct ARBITER_LIST_ENTRY {
    #StructPack 8

    ListEntry : IntPtr

    AlternativeCount : UInt32

    Alternatives : IO_RESOURCE_DESCRIPTOR.Ptr

    PhysicalDeviceObject : DEVICE_OBJECT.Ptr

    RequestSource : ARBITER_REQUEST_SOURCE

    Flags : UInt32

    WorkSpace : IntPtr

    InterfaceType : INTERFACE_TYPE

    SlotNumber : UInt32

    BusNumber : UInt32

    Assignment : CM_PARTIAL_RESOURCE_DESCRIPTOR.Ptr

    SelectedAlternative : IO_RESOURCE_DESCRIPTOR.Ptr

    Result : ARBITER_RESULT

}
