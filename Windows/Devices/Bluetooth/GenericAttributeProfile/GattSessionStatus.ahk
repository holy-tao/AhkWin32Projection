#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * This enumeration defines a GattSession status.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattsessionstatus
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattSessionStatus extends Win32Enum{

    /**
     * The GATT session is closed.
     * @type {Integer (Int32)}
     */
    static Closed => 0

    /**
     * The GATT session is active.
     * @type {Integer (Int32)}
     */
    static Active => 1
}
