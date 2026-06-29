#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_DEVICE_CAPABILITY_DESCRIPTOR {
    #StructPack 1

    bLength : Int8

    bDescriptorType : Int8

    bDevCapabilityType : Int8

}
