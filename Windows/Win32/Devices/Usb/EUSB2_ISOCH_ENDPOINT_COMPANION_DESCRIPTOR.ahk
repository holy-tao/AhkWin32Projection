#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct EUSB2_ISOCH_ENDPOINT_COMPANION_DESCRIPTOR {
    #StructPack 4

    bLength : Int8

    bDescriptorType : Int8

    wMaxPacketSize : UInt16

    dwBytesPerInterval : UInt32

}
