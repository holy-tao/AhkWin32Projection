#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class MSV1_0_AVID extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MsvAvEOL => 0

    /**
     * @type {Integer (Int32)}
     */
    static MsvAvNbComputerName => 1

    /**
     * @type {Integer (Int32)}
     */
    static MsvAvNbDomainName => 2

    /**
     * @type {Integer (Int32)}
     */
    static MsvAvDnsComputerName => 3

    /**
     * @type {Integer (Int32)}
     */
    static MsvAvDnsDomainName => 4

    /**
     * @type {Integer (Int32)}
     */
    static MsvAvDnsTreeName => 5

    /**
     * @type {Integer (Int32)}
     */
    static MsvAvFlags => 6

    /**
     * @type {Integer (Int32)}
     */
    static MsvAvTimestamp => 7

    /**
     * @type {Integer (Int32)}
     */
    static MsvAvRestrictions => 8

    /**
     * @type {Integer (Int32)}
     */
    static MsvAvTargetName => 9

    /**
     * @type {Integer (Int32)}
     */
    static MsvAvChannelBindings => 10
}
