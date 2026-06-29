#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_NOTIFICATION_TYPE.ahk" { USB_NOTIFICATION_TYPE }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_BUS_NOTIFICATION {
    #StructPack 4

    NotificationType : USB_NOTIFICATION_TYPE

    TotalBandwidth : UInt32

    ConsumedBandwidth : UInt32

    ControllerNameLength : UInt32

}
