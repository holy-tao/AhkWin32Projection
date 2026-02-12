#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The status of [GattDeviceService.OpenAsync](./gattdeviceservice_openasync_1373379244.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattopenstatus
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattOpenStatus extends Win32Enum{

    /**
     * Unspecified error.
     * @type {Integer (Int32)}
     */
    static Unspecified => 0

    /**
     * The GATT device service was successfully opened.
     * @type {Integer (Int32)}
     */
    static Success => 1

    /**
     * The GATT device service is already opened.
     * @type {Integer (Int32)}
     */
    static AlreadyOpened => 2

    /**
     * The GATT device service was not found.
     * @type {Integer (Int32)}
     */
    static NotFound => 3

    /**
     * There was a sharing violation.
     * @type {Integer (Int32)}
     */
    static SharingViolation => 4

    /**
     * Access is denied.
     * @type {Integer (Int32)}
     */
    static AccessDenied => 5
}
