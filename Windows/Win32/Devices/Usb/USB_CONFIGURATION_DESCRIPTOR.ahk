#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_CONFIGURATION_DESCRIPTOR {
    #StructPack 2

    bLength : Int8

    bDescriptorType : Int8

    wTotalLength : UInt16

    bNumInterfaces : Int8

    bConfigurationValue : Int8

    iConfiguration : Int8

    bmAttributes : Int8

    MaxPower : Int8

}
