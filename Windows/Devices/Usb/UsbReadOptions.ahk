#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants for configuration flags that can be set for a USB pipe that the host opens for a USB bulk IN endpoint.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbreadoptions
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class UsbReadOptions extends Win32BitflagEnum{

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
     * Bypasses queuing and error handling to boost performance for multiple read requests. Read operations must be done in multiples of [MaxPacketSize](usbbulkinendpointdescriptor_maxpacketsize.md).
     * @type {Integer (UInt32)}
     */
    static OverrideAutomaticBufferManagement => 2

    /**
     * The host does not complete a read request when a short packet is received. The read request is completed only when an error occurs, the request is canceled, or all requested bytes have been read.
     * @type {Integer (UInt32)}
     */
    static IgnoreShortPacket => 4

    /**
     * Allows read requests from a device that returns more data than requested by the caller.
     * @type {Integer (UInt32)}
     */
    static AllowPartialReads => 8
}
