#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the routing policy type.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnroutingpolicytype
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnRoutingPolicyType extends Win32Enum{

    /**
     * Apps are split tunneled and allowed to talk through other interfaces.
     * @type {Integer (Int32)}
     */
    static SplitRouting => 0

    /**
     * Apps are force tunneled through the VPN interface.
     * @type {Integer (Int32)}
     */
    static ForceAllTrafficOverVpn => 1
}
