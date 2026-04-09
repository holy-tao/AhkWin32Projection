#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 */
class USBD_ENDPOINT_OFFLOAD_MODE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static UsbdEndpointOffloadModeNotSupported => 0

    /**
     * @type {Integer (Int32)}
     */
    static UsbdEndpointOffloadSoftwareAssisted => 1

    /**
     * @type {Integer (Int32)}
     */
    static UsbdEndpointOffloadHardwareAssisted => 2
}
