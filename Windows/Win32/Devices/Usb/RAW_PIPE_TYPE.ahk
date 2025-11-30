#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class RAW_PIPE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static USBSCAN_PIPE_CONTROL => 0

    /**
     * @type {Integer (Int32)}
     */
    static USBSCAN_PIPE_ISOCHRONOUS => 1

    /**
     * @type {Integer (Int32)}
     */
    static USBSCAN_PIPE_BULK => 2

    /**
     * @type {Integer (Int32)}
     */
    static USBSCAN_PIPE_INTERRUPT => 3
}
