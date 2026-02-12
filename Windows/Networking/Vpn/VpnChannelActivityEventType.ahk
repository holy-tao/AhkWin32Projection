#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the type of activity events.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannelactivityeventtype
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnChannelActivityEventType extends Win32Enum{

    /**
     * Mode in which no traffic is being sent over the VPN channel.
     * @type {Integer (Int32)}
     */
    static Idle => 0

    /**
     * Mode in which traffic is currently being sent over the VPN channel.
     * @type {Integer (Int32)}
     */
    static Active => 1
}
