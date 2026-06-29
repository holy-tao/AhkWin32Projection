#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct WSB_PROP {
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
    static WSB_PROP_CXHSCROLL => 2

    /**
     * @type {Integer (Int32)}
     */
    static WSB_PROP_CXHTHUMB => 16

    /**
     * @type {Integer (Int32)}
     */
    static WSB_PROP_CXVSCROLL => 8

    /**
     * @type {Integer (Int32)}
     */
    static WSB_PROP_CYHSCROLL => 4

    /**
     * @type {Integer (Int32)}
     */
    static WSB_PROP_CYVSCROLL => 1

    /**
     * @type {Integer (Int32)}
     */
    static WSB_PROP_CYVTHUMB => 32

    /**
     * @type {Integer (Int32)}
     */
    static WSB_PROP_HBKGCOLOR => 128

    /**
     * @type {Integer (Int32)}
     */
    static WSB_PROP_HSTYLE => 512

    /**
     * @type {Integer (Int32)}
     */
    static WSB_PROP_PALETTE => 2048

    /**
     * @type {Integer (Int32)}
     */
    static WSB_PROP_VBKGCOLOR => 64

    /**
     * @type {Integer (Int32)}
     */
    static WSB_PROP_VSTYLE => 256

    /**
     * @type {Integer (Int32)}
     */
    static WSB_PROP_WINSTYLE => 1024
}
