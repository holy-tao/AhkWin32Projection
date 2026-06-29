#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_NODE_CONNECTION_INFORMATION_EX_V2_FLAGS.ahk" { USB_NODE_CONNECTION_INFORMATION_EX_V2_FLAGS }
#Import ".\USB_PROTOCOLS.ahk" { USB_PROTOCOLS }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_NODE_CONNECTION_INFORMATION_EX_V2 {
    #StructPack 4

    ConnectionIndex : UInt32

    Length : UInt32

    SupportedUsbProtocols : USB_PROTOCOLS

    Flags : USB_NODE_CONNECTION_INFORMATION_EX_V2_FLAGS

}
