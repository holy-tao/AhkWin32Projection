#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 */
class USBD_PIPE_TYPE extends Win32Enum {

    /**
     * Native name: UsbdPipeTypeControl
     * @type {Integer (Int32)}
     */
    static Control => 0

    /**
     * Native name: UsbdPipeTypeIsochronous
     * @type {Integer (Int32)}
     */
    static Isochronous => 1

    /**
     * Native name: UsbdPipeTypeBulk
     * @type {Integer (Int32)}
     */
    static Bulk => 2

    /**
     * Native name: UsbdPipeTypeInterrupt
     * @type {Integer (Int32)}
     */
    static Interrupt => 3
}
