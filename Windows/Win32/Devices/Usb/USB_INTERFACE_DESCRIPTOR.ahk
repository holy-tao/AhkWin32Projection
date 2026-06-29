#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_INTERFACE_DESCRIPTOR {
    #StructPack 1

    bLength : Int8

    bDescriptorType : Int8

    bInterfaceNumber : Int8

    bAlternateSetting : Int8

    bNumEndpoints : Int8

    bInterfaceClass : Int8

    bInterfaceSubClass : Int8

    bInterfaceProtocol : Int8

    iInterface : Int8

}
