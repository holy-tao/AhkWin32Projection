#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import ".\ARBITER_CONFLICT_INFO.ahk" { ARBITER_CONFLICT_INFO }
#Import ".\IO_RESOURCE_DESCRIPTOR.ahk" { IO_RESOURCE_DESCRIPTOR }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct ARBITER_QUERY_CONFLICT_PARAMETERS {
    #StructPack 8

    PhysicalDeviceObject : DEVICE_OBJECT.Ptr

    ConflictingResource : IO_RESOURCE_DESCRIPTOR.Ptr

    ConflictCount : IntPtr

    Conflicts : IntPtr

}
