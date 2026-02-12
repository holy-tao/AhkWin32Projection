#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Represents the return status of a WinRT GATT API related Async operation.
  * 
  * Indicates the status of the asynchronous operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcommunicationstatus
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattCommunicationStatus extends Win32Enum{

    /**
     * The operation completed successfully.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * No communication can be performed with the device, at this time.
     * @type {Integer (Int32)}
     */
    static Unreachable => 1

    /**
     * There was a GATT communication protocol error.
     * @type {Integer (Int32)}
     */
    static ProtocolError => 2

    /**
     * Access is denied.
     * @type {Integer (Int32)}
     */
    static AccessDenied => 3
}
