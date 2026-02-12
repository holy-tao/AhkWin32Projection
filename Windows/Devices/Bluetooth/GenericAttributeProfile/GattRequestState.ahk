#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * This enumeration defines a GATT request state.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattrequeststate
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattRequestState extends Win32Enum{

    /**
     * The request is pending.
     * @type {Integer (Int32)}
     */
    static Pending => 0

    /**
     * The request if completed.
     * @type {Integer (Int32)}
     */
    static Completed => 1

    /**
     * The request is canceled.
     * @type {Integer (Int32)}
     */
    static Canceled => 2
}
