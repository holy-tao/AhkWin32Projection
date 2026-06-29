#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct _URB_HEADER {
    #StructPack 8

    Length : UInt16

    Function : UInt16

    Status : Int32

    UsbdDeviceHandle : IntPtr

    UsbdFlags : UInt32

}
