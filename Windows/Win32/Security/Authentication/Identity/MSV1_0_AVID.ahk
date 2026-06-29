#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct MSV1_0_AVID {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
