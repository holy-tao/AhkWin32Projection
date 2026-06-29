#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_DEVICE_DESCRIPTOR {
    #StructPack 2

    bLength : Int8

    bDescriptorType : Int8

    bcdUSB : UInt16

    bDeviceClass : Int8

    bDeviceSubClass : Int8

    bDeviceProtocol : Int8

    bMaxPacketSize0 : Int8

    idVendor : UInt16

    idProduct : UInt16

    bcdDevice : UInt16

    iManufacturer : Int8

    iProduct : Int8

    iSerialNumber : Int8

    bNumConfigurations : Int8

}
