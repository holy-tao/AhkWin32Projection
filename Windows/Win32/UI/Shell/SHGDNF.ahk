#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SHGDNF {
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
    static SHGDN_NORMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SHGDN_INFOLDER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SHGDN_FOREDITING => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static SHGDN_FORADDRESSBAR => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static SHGDN_FORPARSING => 32768
}
