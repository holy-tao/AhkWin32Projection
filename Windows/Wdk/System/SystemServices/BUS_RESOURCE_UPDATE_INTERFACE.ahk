#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PGET_UPDATED_BUS_RESOURCE.ahk" { PGET_UPDATED_BUS_RESOURCE }
#Import ".\PINTERFACE_DEREFERENCE.ahk" { PINTERFACE_DEREFERENCE }
#Import ".\PINTERFACE_REFERENCE.ahk" { PINTERFACE_REFERENCE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct BUS_RESOURCE_UPDATE_INTERFACE {
    #StructPack 8

    Size : UInt16

    Version : UInt16

    Context : IntPtr

    InterfaceReference : PINTERFACE_REFERENCE

    InterfaceDereference : PINTERFACE_DEREFERENCE

    GetUpdatedBusResource : PGET_UPDATED_BUS_RESOURCE

}
