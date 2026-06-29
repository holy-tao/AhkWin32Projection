#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHV_VPCI_DEVICE_NOTIFICATION_TYPE.ahk" { WHV_VPCI_DEVICE_NOTIFICATION_TYPE }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_VPCI_DEVICE_NOTIFICATION {
    #StructPack 8

    NotificationType : WHV_VPCI_DEVICE_NOTIFICATION_TYPE

    Reserved1 : UInt32

    Reserved2 : Int64

}
