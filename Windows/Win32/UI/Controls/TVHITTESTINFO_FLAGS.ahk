#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TVHITTESTINFO_FLAGS {
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
    static TVHT_ABOVE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static TVHT_BELOW => 512

    /**
     * @type {Integer (UInt32)}
     */
    static TVHT_NOWHERE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TVHT_ONITEM => 70

    /**
     * @type {Integer (UInt32)}
     */
    static TVHT_ONITEMBUTTON => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TVHT_ONITEMICON => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TVHT_ONITEMINDENT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TVHT_ONITEMLABEL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TVHT_ONITEMRIGHT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TVHT_ONITEMSTATEICON => 64

    /**
     * @type {Integer (UInt32)}
     */
    static TVHT_TOLEFT => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static TVHT_TORIGHT => 1024
}
