#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_DEVICE_CAPABILITY_SUPERSPEED_USB_DESCRIPTOR {
    #StructPack 2

    bLength : Int8

    bDescriptorType : Int8

    bDevCapabilityType : Int8

    bmAttributes : Int8

    wSpeedsSupported : UInt16

    bFunctionalitySupport : Int8

    bU1DevExitLat : Int8

    wU2DevExitLat : UInt16

}
