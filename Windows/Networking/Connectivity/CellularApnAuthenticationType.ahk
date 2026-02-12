#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines values that indicate the authentication type used for a APN. These values are referenced when providing APN details using a [CellularApnContext](cellularapncontext.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.cellularapnauthenticationtype
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class CellularApnAuthenticationType extends Win32Enum{

    /**
     * No authentication.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Password authentication.
     * @type {Integer (Int32)}
     */
    static Pap => 1

    /**
     * Challenge-Handshake authentication.
     * @type {Integer (Int32)}
     */
    static Chap => 2

    /**
     * Microsoft Challenge-Handshake authentication (v2)
     * @type {Integer (Int32)}
     */
    static Mschapv2 => 3
}
