#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PDEVICE_BUS_SPECIFIC_RESET_HANDLER.ahk" { PDEVICE_BUS_SPECIFIC_RESET_HANDLER }
#Import ".\PDEVICE_QUERY_BUS_SPECIFIC_RESET_HANDLER.ahk" { PDEVICE_QUERY_BUS_SPECIFIC_RESET_HANDLER }
#Import ".\PDEVICE_RESET_HANDLER.ahk" { PDEVICE_RESET_HANDLER }
#Import ".\PGET_DEVICE_RESET_STATUS.ahk" { PGET_DEVICE_RESET_STATUS }
#Import ".\PINTERFACE_DEREFERENCE.ahk" { PINTERFACE_DEREFERENCE }
#Import ".\PINTERFACE_REFERENCE.ahk" { PINTERFACE_REFERENCE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DEVICE_RESET_INTERFACE_STANDARD {
    #StructPack 8

    Size : UInt16

    Version : UInt16

    Context : IntPtr

    InterfaceReference : PINTERFACE_REFERENCE

    InterfaceDereference : PINTERFACE_DEREFERENCE

    DeviceReset : PDEVICE_RESET_HANDLER

    SupportedResetTypes : UInt32

    Reserved : IntPtr

    QueryBusSpecificResetInfo : PDEVICE_QUERY_BUS_SPECIFIC_RESET_HANDLER

    DeviceBusSpecificReset : PDEVICE_BUS_SPECIFIC_RESET_HANDLER

    GetDeviceResetStatus : PGET_DEVICE_RESET_STATUS

}
