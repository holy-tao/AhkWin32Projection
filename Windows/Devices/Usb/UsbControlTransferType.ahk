#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that indicate the type of USB control transfer: standard, class, or vendor.
 * @remarks
 * For conceptual information about USB control transfers, see "Microsoft-defined methods for sending control transfer requests" in [How to send a USB control transfer](/windows-hardware/drivers/ddi/content/index).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbcontroltransfertype
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class UsbControlTransferType extends Win32Enum{

    /**
     * Indicates a standard USB control request that the app can send to obtain information about the device, its configurations, interfaces, and endpoints. The standard requests are described in section 9.4 of the Universal Serial Bus (USB) specification (www.usb.org).
     * @type {Integer (Int32)}
     */
    static Standard => 0

    /**
     * Indicates a class-specific USB control request described by a specific device class specification.
     * @type {Integer (Int32)}
     */
    static Class => 1

    /**
     * Indicates a vendor-specified USB control request and depends on the requests supported by the device.
     * @type {Integer (Int32)}
     */
    static Vendor => 2
}
