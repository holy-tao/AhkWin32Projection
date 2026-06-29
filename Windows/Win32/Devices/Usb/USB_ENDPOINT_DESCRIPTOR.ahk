#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_ENDPOINT_DESCRIPTOR {
    #StructPack 2

    bLength : Int8

    bDescriptorType : Int8

    bEndpointAddress : Int8

    bmAttributes : Int8

    wMaxPacketSize : UInt16

    bInterval : Int8

}
