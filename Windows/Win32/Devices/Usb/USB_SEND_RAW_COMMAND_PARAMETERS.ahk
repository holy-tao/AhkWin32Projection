#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_SEND_RAW_COMMAND_PARAMETERS {
    #StructPack 4

    Usb_bmRequest : Int8

    Usb_bRequest : Int8

    Usb_wVlaue : UInt16

    Usb_wIndex : UInt16

    Usb_wLength : UInt16

    DeviceAddress : UInt16

    MaximumPacketSize : UInt16

    Timeout : UInt32

    DataLength : UInt32

    UsbdStatusCode : Int32

    Data : Int8[4]

}
