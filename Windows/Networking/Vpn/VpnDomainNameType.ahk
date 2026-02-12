#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes whether a name is a domain name suffix or a fully qualified domain name.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpndomainnametype
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnDomainNameType extends Win32Enum{

    /**
     * Domain name suffix
     * @type {Integer (Int32)}
     */
    static Suffix => 0

    /**
     * Fully qualified domain name (FQDN)
     * @type {Integer (Int32)}
     */
    static FullyQualified => 1

    /**
     * Reserved
     * @type {Integer (Int32)}
     */
    static Reserved => 65535
}
