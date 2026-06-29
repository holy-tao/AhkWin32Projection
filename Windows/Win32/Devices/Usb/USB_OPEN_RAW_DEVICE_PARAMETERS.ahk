#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_OPEN_RAW_DEVICE_PARAMETERS {
    #StructPack 2

    PortStatus : UInt16

    MaxPacketEp0 : UInt16

}
