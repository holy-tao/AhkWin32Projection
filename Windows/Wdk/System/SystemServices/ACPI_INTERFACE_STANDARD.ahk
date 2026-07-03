#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PGPE_CLEAR_STATUS.ahk" { PGPE_CLEAR_STATUS }
#Import ".\PGPE_CONNECT_VECTOR.ahk" { PGPE_CONNECT_VECTOR }
#Import ".\PGPE_DISABLE_EVENT.ahk" { PGPE_DISABLE_EVENT }
#Import ".\PGPE_DISCONNECT_VECTOR.ahk" { PGPE_DISCONNECT_VECTOR }
#Import ".\PGPE_ENABLE_EVENT.ahk" { PGPE_ENABLE_EVENT }
#Import ".\PINTERFACE_DEREFERENCE.ahk" { PINTERFACE_DEREFERENCE }
#Import ".\PINTERFACE_REFERENCE.ahk" { PINTERFACE_REFERENCE }
#Import ".\PREGISTER_FOR_DEVICE_NOTIFICATIONS.ahk" { PREGISTER_FOR_DEVICE_NOTIFICATIONS }
#Import ".\PUNREGISTER_FOR_DEVICE_NOTIFICATIONS.ahk" { PUNREGISTER_FOR_DEVICE_NOTIFICATIONS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct ACPI_INTERFACE_STANDARD {
    #StructPack 8

    Size : UInt16

    Version : UInt16

    Context : IntPtr

    InterfaceReference : PINTERFACE_REFERENCE

    InterfaceDereference : PINTERFACE_DEREFERENCE

    GpeConnectVector : PGPE_CONNECT_VECTOR

    GpeDisconnectVector : PGPE_DISCONNECT_VECTOR

    GpeEnableEvent : PGPE_ENABLE_EVENT

    GpeDisableEvent : PGPE_DISABLE_EVENT

    GpeClearStatus : PGPE_CLEAR_STATUS

    RegisterForDeviceNotifications : PREGISTER_FOR_DEVICE_NOTIFICATIONS

    UnregisterForDeviceNotifications : PUNREGISTER_FOR_DEVICE_NOTIFICATIONS

}
