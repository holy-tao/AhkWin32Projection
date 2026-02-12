#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Values used to report the current status of a VPN profile.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnmanagementconnectionstatus
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnManagementConnectionStatus extends Win32Enum{

    /**
     * The profile is disconnected.
     * @type {Integer (Int32)}
     */
    static Disconnected => 0

    /**
     * The profile is in the process of disconnecting.
     * @type {Integer (Int32)}
     */
    static Disconnecting => 1

    /**
     * The profile is connected.
     * @type {Integer (Int32)}
     */
    static Connected => 2

    /**
     * The profile is in the process of connecting.
     * @type {Integer (Int32)}
     */
    static Connecting => 3
}
