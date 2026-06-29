#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_CONNECTION_STATUS.ahk" { USB_CONNECTION_STATUS }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_NODE_CONNECTION_ATTRIBUTES {
    #StructPack 4

    ConnectionIndex : UInt32

    ConnectionStatus : USB_CONNECTION_STATUS

    PortAttributes : UInt32

}
