#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USBD_PIPE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UsbdPipeTypeControl => 0

    /**
     * @type {Integer (Int32)}
     */
    static UsbdPipeTypeIsochronous => 1

    /**
     * @type {Integer (Int32)}
     */
    static UsbdPipeTypeBulk => 2

    /**
     * @type {Integer (Int32)}
     */
    static UsbdPipeTypeInterrupt => 3
}
