#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * The domain type of the [HostName](hostname.md) object when the [HostNameType](hostnametype.md) is a domain name.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.domainnametype
 * @namespace Windows.Networking
 * @version WindowsRuntime 1.4
 */
class DomainNameType extends Win32Enum{

    /**
     * The suffix of a domain name.
     * @type {Integer (Int32)}
     */
    static Suffix => 0

    /**
     * A fully-qualified domain name.
     * @type {Integer (Int32)}
     */
    static FullyQualified => 1
}
