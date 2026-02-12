#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the native protocol types.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnnativeprotocoltype
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnNativeProtocolType extends Win32Enum{

    /**
     * Point-to-Point Tunneling Protocol (PPTP)
     * @type {Integer (Int32)}
     */
    static Pptp => 0

    /**
     * Layer 2 Tunneling Protocol (L2TP)
     * @type {Integer (Int32)}
     */
    static L2tp => 1

    /**
     * Internet Protocol Security Internet Key Exchange v2 (IPsec IKEv2)
     * @type {Integer (Int32)}
     */
    static IpsecIkev2 => 2
}
