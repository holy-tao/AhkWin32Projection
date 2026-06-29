#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_DEVICE_CHARACTERISTICS {
    #StructPack 4

    Version : UInt32

    Reserved : UInt32[2]

    UsbDeviceCharacteristicsFlags : UInt32

    MaximumSendPathDelayInMilliSeconds : UInt32

    MaximumCompletionPathDelayInMilliSeconds : UInt32

}
