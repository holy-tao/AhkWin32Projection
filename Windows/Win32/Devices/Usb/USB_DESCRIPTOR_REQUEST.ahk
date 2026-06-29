#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_DESCRIPTOR_REQUEST {
    #StructPack 4


    struct _SetupPacket {
        bmRequest : Int8

        bRequest : Int8

        wValue : UInt16

        wIndex : UInt16

        wLength : UInt16

    }

    ConnectionIndex : UInt32

    SetupPacket : USB_DESCRIPTOR_REQUEST._SetupPacket

    Data : Int8[1]

}
