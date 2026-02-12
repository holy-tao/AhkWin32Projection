#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * This enumeration defines the advertisement status of a [GattServiceProvider](gattserviceprovider.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceprovideradvertisementstatus
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattServiceProviderAdvertisementStatus extends Win32Enum{

    /**
     * The GATT service was created.
     * @type {Integer (Int32)}
     */
    static Created => 0

    /**
     * The GATT service is not advertising.
     * @type {Integer (Int32)}
     */
    static Stopped => 1

    /**
     * The GATT service advertising has started.
     * @type {Integer (Int32)}
     */
    static Started => 2

    /**
     * The GATT service was aborted.
     * @type {Integer (Int32)}
     */
    static Aborted => 3

    /**
     * Indicates that the system was successfully able to issue the advertisement request, but not all of the requested data could be included in the advertisement.
     * @type {Integer (Int32)}
     */
    static StartedWithoutAllAdvertisementData => 4
}
