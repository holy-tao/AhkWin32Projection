#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Defines the desired state of the connection profile for which usage data is returned by the method [GetNetworkUsageAsync](connectionprofile_getnetworkusageasync_665790436.md).
 * @remarks
 * The Shared NetworkUsageState corresponds to when a network connection is made available to provide internet access for other devices.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networkusagestates
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class NetworkUsageStates extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Defines the desired roaming state of the network connection.
     * @type {Integer}
     */
    Roaming {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Defines the desired sharing state of the network connection.
     * @type {Integer}
     */
    Shared {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
