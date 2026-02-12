#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the type of AppId understood by the VPN platform.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnappidtype
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnAppIdType extends Win32Enum{

    /**
     * Package family name.
     * @type {Integer (Int32)}
     */
    static PackageFamilyName => 0

    /**
     * Fully qualified binary name (FQBN).
     * @type {Integer (Int32)}
     */
    static FullyQualifiedBinaryName => 1

    /**
     * File path.
     * @type {Integer (Int32)}
     */
    static FilePath => 2
}
