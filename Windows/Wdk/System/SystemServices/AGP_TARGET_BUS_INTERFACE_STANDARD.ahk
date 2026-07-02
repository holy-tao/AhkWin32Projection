#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PGET_SET_DEVICE_DATA.ahk" { PGET_SET_DEVICE_DATA }
#Import ".\PINTERFACE_DEREFERENCE.ahk" { PINTERFACE_DEREFERENCE }
#Import ".\PINTERFACE_REFERENCE.ahk" { PINTERFACE_REFERENCE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct AGP_TARGET_BUS_INTERFACE_STANDARD {
    #StructPack 8

    Size : UInt16

    Version : UInt16

    Context : IntPtr

    InterfaceReference : PINTERFACE_REFERENCE

    InterfaceDereference : PINTERFACE_DEREFERENCE

    SetBusData : PGET_SET_DEVICE_DATA

    GetBusData : PGET_SET_DEVICE_DATA

    CapabilityID : Int8

}
