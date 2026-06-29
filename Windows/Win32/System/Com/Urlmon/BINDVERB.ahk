#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct BINDVERB {
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
    static BINDVERB_GET => 0

    /**
     * @type {Integer (Int32)}
     */
    static BINDVERB_POST => 1

    /**
     * @type {Integer (Int32)}
     */
    static BINDVERB_PUT => 2

    /**
     * @type {Integer (Int32)}
     */
    static BINDVERB_CUSTOM => 3

    /**
     * @type {Integer (Int32)}
     */
    static BINDVERB_RESERVED1 => 4
}
