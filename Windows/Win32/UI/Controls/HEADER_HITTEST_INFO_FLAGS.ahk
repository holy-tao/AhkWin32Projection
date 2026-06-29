#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct HEADER_HITTEST_INFO_FLAGS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static HHT_NOWHERE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HHT_ONHEADER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HHT_ONDIVIDER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static HHT_ONDIVOPEN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static HHT_ONFILTER => 16

    /**
     * @type {Integer (UInt32)}
     */
    static HHT_ONFILTERBUTTON => 32

    /**
     * @type {Integer (UInt32)}
     */
    static HHT_ABOVE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static HHT_BELOW => 512

    /**
     * @type {Integer (UInt32)}
     */
    static HHT_TORIGHT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static HHT_TOLEFT => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static HHT_ONITEMSTATEICON => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static HHT_ONDROPDOWN => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static HHT_ONOVERFLOW => 16384
}
