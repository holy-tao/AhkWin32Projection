#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * This enumeration represents the GATT sharing mode.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattsharingmode
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattSharingMode extends Win32Enum{

    /**
     * The sharing mode is unspecified.
     * @type {Integer (Int32)}
     */
    static Unspecified => 0

    /**
     * The sharing mode is exclusive.
     * @type {Integer (Int32)}
     */
    static Exclusive => 1

    /**
     * The sharing mode is read only.
     * @type {Integer (Int32)}
     */
    static SharedReadOnly => 2

    /**
     * The sharing mode is read and write.
     * @type {Integer (Int32)}
     */
    static SharedReadAndWrite => 3
}
