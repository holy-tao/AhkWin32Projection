#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nldef/ne-nldef-nl_suffix_origin
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class NL_SUFFIX_ORIGIN extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NlsoOther => 0

    /**
     * @type {Integer (Int32)}
     */
    static NlsoManual => 1

    /**
     * @type {Integer (Int32)}
     */
    static NlsoWellKnown => 2

    /**
     * @type {Integer (Int32)}
     */
    static NlsoDhcp => 3

    /**
     * @type {Integer (Int32)}
     */
    static NlsoLinkLayerAddress => 4

    /**
     * @type {Integer (Int32)}
     */
    static NlsoRandom => 5

    /**
     * @type {Integer (Int32)}
     */
    static IpSuffixOriginOther => 0

    /**
     * @type {Integer (Int32)}
     */
    static IpSuffixOriginManual => 1

    /**
     * @type {Integer (Int32)}
     */
    static IpSuffixOriginWellKnown => 2

    /**
     * @type {Integer (Int32)}
     */
    static IpSuffixOriginDhcp => 3

    /**
     * @type {Integer (Int32)}
     */
    static IpSuffixOriginLinkLayerAddress => 4

    /**
     * @type {Integer (Int32)}
     */
    static IpSuffixOriginRandom => 5

    /**
     * @type {Integer (Int32)}
     */
    static IpSuffixOriginUnchanged => 16
}
