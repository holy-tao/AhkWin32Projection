#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants for configuration flags that can be set for a USB pipe that the host opens for a USB OUT endpoint.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbwriteoptions
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class UsbWriteOptions extends Win32BitflagEnum{

    /**
     * Clear all flags.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Automatically clears a stalled pipe without stopping the data flow.
     * @type {Integer (UInt32)}
     */
    static AutoClearStall => 1

    /**
     * Sends a zero length packet for a write request in which the buffer is a multiple of the maximum packet size supported by the endpoint.
     * @type {Integer (UInt32)}
     */
    static ShortPacketTerminate => 2
}
