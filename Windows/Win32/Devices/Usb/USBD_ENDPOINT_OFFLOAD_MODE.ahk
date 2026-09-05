#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 */
class USBD_ENDPOINT_OFFLOAD_MODE extends Win32Enum {

    /**
     * Native name: UsbdEndpointOffloadModeNotSupported
     * @type {Integer (Int32)}
     */
    static NotSupported => 0

    /**
     * Native name: UsbdEndpointOffloadSoftwareAssisted
     * @type {Integer (Int32)}
     */
    static SoftwareAssisted => 1

    /**
     * Native name: UsbdEndpointOffloadHardwareAssisted
     * @type {Integer (Int32)}
     */
    static HardwareAssisted => 2
}
