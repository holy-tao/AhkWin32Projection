#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USBD_ISO_PACKET_DESCRIPTOR {
    #StructPack 4

    Offset : UInt32

    Length : UInt32

    Status : Int32

}
