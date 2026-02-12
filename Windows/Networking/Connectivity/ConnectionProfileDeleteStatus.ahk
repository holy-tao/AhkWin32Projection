#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines values that indicate the result of an attempt to delete a connection profile.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionprofiledeletestatus
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class ConnectionProfileDeleteStatus extends Win32Enum{

    /**
     * The deletion succeeded.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The deletion failed because it was denied by the user, through the user interface (UI).
     * @type {Integer (Int32)}
     */
    static DeniedByUser => 1

    /**
     * The deletion failed because it was denied by the system.
     * @type {Integer (Int32)}
     */
    static DeniedBySystem => 2

    /**
     * The deletion failed due to an unknown error.
     * @type {Integer (Int32)}
     */
    static UnknownError => 3
}
