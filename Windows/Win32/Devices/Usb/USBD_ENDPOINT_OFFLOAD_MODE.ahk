#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USBD_ENDPOINT_OFFLOAD_MODE{

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
