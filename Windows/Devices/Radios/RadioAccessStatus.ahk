#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the application's permission level for controlling radio devices, returned by both access requests and state change operations.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.radios.radioaccessstatus
 * @namespace Windows.Devices.Radios
 * @version WindowsRuntime 1.4
 */
class RadioAccessStatus extends Win32Enum{

    /**
     * Access state is unspecified.
     * @type {Integer (Int32)}
     */
    static Unspecified => 0

    /**
     * Access is allowed.
     * @type {Integer (Int32)}
     */
    static Allowed => 1

    /**
     * Access was denied because of user action, usually through denying an operation through the radio privacy settings page.
     * @type {Integer (Int32)}
     */
    static DeniedByUser => 2

    /**
     * Access was denied by the system. One common reason is that the user does not have sufficient permission to manipulate the radio.
     * @type {Integer (Int32)}
     */
    static DeniedBySystem => 3
}
