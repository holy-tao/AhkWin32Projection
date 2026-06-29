#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_BOS_DESCRIPTOR {
    #StructPack 2

    bLength : Int8

    bDescriptorType : Int8

    wTotalLength : UInt16

    bNumDeviceCaps : Int8

}
