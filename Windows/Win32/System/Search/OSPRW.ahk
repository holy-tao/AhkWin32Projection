#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct OSPRW {
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
    static OSPRW_DEFAULT => 1

    /**
     * @type {Integer (Int32)}
     */
    static OSPRW_READONLY => 0

    /**
     * @type {Integer (Int32)}
     */
    static OSPRW_READWRITE => 1

    /**
     * @type {Integer (Int32)}
     */
    static OSPRW_MIXED => 2
}
