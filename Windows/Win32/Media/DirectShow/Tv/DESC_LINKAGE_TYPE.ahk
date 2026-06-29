#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct DESC_LINKAGE_TYPE {
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
    static DESC_LINKAGE_RESERVED0 => 0

    /**
     * @type {Integer (Int32)}
     */
    static DESC_LINKAGE_INFORMATION => 1

    /**
     * @type {Integer (Int32)}
     */
    static DESC_LINKAGE_EPG => 2

    /**
     * @type {Integer (Int32)}
     */
    static DESC_LINKAGE_CA_REPLACEMENT => 3

    /**
     * @type {Integer (Int32)}
     */
    static DESC_LINKAGE_COMPLETE_NET_BOUQUET_SI => 4

    /**
     * @type {Integer (Int32)}
     */
    static DESC_LINKAGE_REPLACEMENT => 5

    /**
     * @type {Integer (Int32)}
     */
    static DESC_LINKAGE_DATA => 6

    /**
     * @type {Integer (Int32)}
     */
    static DESC_LINKAGE_RESERVED1 => 7

    /**
     * @type {Integer (Int32)}
     */
    static DESC_LINKAGE_USER => 8

    /**
     * @type {Integer (Int32)}
     */
    static DESC_LINKAGE_RESERVED2 => 255
}
