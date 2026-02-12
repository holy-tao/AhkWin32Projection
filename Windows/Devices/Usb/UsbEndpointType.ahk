#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that indicate the type of USB endpoint: control, bulk, isochronous, or interrupt.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbendpointtype
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class UsbEndpointType extends Win32Enum{

    /**
     * Indicates a USB control endpoint (Endpoint 0).
     * @type {Integer (Int32)}
     */
    static Control => 0

    /**
     * Indicates a USB isochronous endpoint.
     * @type {Integer (Int32)}
     */
    static Isochronous => 1

    /**
     * Indicates a USB bulk endpoint.
     * @type {Integer (Int32)}
     */
    static Bulk => 2

    /**
     * Indicates a USB interrupt endpoint.
     * @type {Integer (Int32)}
     */
    static Interrupt => 3
}
