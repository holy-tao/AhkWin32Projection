#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the values defining whether a requested credential is a retry case, or should be used for single sign on.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannelrequestcredentialsoptions
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnChannelRequestCredentialsOptions extends Win32BitflagEnum{

    /**
     * None.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Retrying.
     * @type {Integer (UInt32)}
     */
    static Retrying => 1

    /**
     * Use for single sign on.
     * @type {Integer (UInt32)}
     */
    static UseForSingleSignIn => 2
}
