#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class MSV1_0_AVID extends Win32Enum {

    /**
     * Native name: MsvAvEOL
     * @type {Integer (Int32)}
     */
    static AvEOL => 0

    /**
     * Native name: MsvAvNbComputerName
     * @type {Integer (Int32)}
     */
    static AvNbComputerName => 1

    /**
     * Native name: MsvAvNbDomainName
     * @type {Integer (Int32)}
     */
    static AvNbDomainName => 2

    /**
     * Native name: MsvAvDnsComputerName
     * @type {Integer (Int32)}
     */
    static AvDnsComputerName => 3

    /**
     * Native name: MsvAvDnsDomainName
     * @type {Integer (Int32)}
     */
    static AvDnsDomainName => 4

    /**
     * Native name: MsvAvDnsTreeName
     * @type {Integer (Int32)}
     */
    static AvDnsTreeName => 5

    /**
     * Native name: MsvAvFlags
     * @type {Integer (Int32)}
     */
    static AvFlags => 6

    /**
     * Native name: MsvAvTimestamp
     * @type {Integer (Int32)}
     */
    static AvTimestamp => 7

    /**
     * Native name: MsvAvRestrictions
     * @type {Integer (Int32)}
     */
    static AvRestrictions => 8

    /**
     * Native name: MsvAvTargetName
     * @type {Integer (Int32)}
     */
    static AvTargetName => 9

    /**
     * Native name: MsvAvChannelBindings
     * @type {Integer (Int32)}
     */
    static AvChannelBindings => 10
}
