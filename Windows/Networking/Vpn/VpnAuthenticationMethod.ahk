#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the type of authentication methods allowed by the operating system native VPN protocols.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnauthenticationmethod
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnAuthenticationMethod extends Win32Enum{

    /**
     * Microsoft Challenge-Handshake Authentication Protocol v2
     * @type {Integer (Int32)}
     */
    static Mschapv2 => 0

    /**
     * Extensible Authentication Protocol
     * @type {Integer (Int32)}
     */
    static Eap => 1

    /**
     * Certificate
     * @type {Integer (Int32)}
     */
    static Certificate => 2

    /**
     * Preshared key
     * @type {Integer (Int32)}
     */
    static PresharedKey => 3
}
