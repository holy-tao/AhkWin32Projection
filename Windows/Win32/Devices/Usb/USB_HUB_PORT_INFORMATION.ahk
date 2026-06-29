#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_DEVICE_STATE.ahk" { USB_DEVICE_STATE }
#Import ".\USB_CONNECTION_STATUS.ahk" { USB_CONNECTION_STATUS }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_HUB_PORT_INFORMATION {
    #StructPack 4

    DeviceState : USB_DEVICE_STATE

    PortNumber : UInt16

    DeviceAddress : UInt16

    ConnectionIndex : UInt32

    ConnectionStatus : USB_CONNECTION_STATUS

}
