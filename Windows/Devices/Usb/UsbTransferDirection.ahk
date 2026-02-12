#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that indicate the direction of USB transfer: IN or OUT transfers.
 * @remarks
 * The direction of a USB transfer is determined from the host side and not the target USB device. In an IN transfer, data moves from the device to the host. In an OUT transfer, data moves from the host to the device.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbtransferdirection
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class UsbTransferDirection extends Win32Enum{

    /**
     * Indicates an OUT transfer from the host to the device.
     * @type {Integer (Int32)}
     */
    static Out => 0

    /**
     * Indicates an IN transfer from the device to the host.
     * @type {Integer (Int32)}
     */
    static In => 1
}
