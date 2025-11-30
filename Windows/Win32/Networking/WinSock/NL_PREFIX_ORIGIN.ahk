#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nldef/ne-nldef-nl_prefix_origin
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class NL_PREFIX_ORIGIN extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static IpPrefixOriginOther => 0

    /**
     * @type {Integer (Int32)}
     */
    static IpPrefixOriginManual => 1

    /**
     * @type {Integer (Int32)}
     */
    static IpPrefixOriginWellKnown => 2

    /**
     * @type {Integer (Int32)}
     */
    static IpPrefixOriginDhcp => 3

    /**
     * @type {Integer (Int32)}
     */
    static IpPrefixOriginRouterAdvertisement => 4

    /**
     * @type {Integer (Int32)}
     */
    static IpPrefixOriginUnchanged => 16
}
