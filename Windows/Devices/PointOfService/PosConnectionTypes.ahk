#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Connection types that can be used to access a point of service device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posconnectiontypes
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class PosConnectionTypes extends Win32BitflagEnum{

    /**
     * Locally connected devices, such as USB.
     * @type {Integer (UInt32)}
     */
    static Local => 1

    /**
     * Devices with an IP address, including both Wired Ethernet and Wi-Fi.
     * @type {Integer (UInt32)}
     */
    static IP => 2

    /**
     * Devices with a Bluetooth radio.
     * @type {Integer (UInt32)}
     */
    static Bluetooth => 4

    /**
     * All connection types.
     * @type {Integer (UInt32)}
     */
    static All => 4294967295
}
