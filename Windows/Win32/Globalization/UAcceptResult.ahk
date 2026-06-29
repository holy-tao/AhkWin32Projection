#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UAcceptResult {
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
    static ULOC_ACCEPT_FAILED => 0

    /**
     * @type {Integer (Int32)}
     */
    static ULOC_ACCEPT_VALID => 1

    /**
     * @type {Integer (Int32)}
     */
    static ULOC_ACCEPT_FALLBACK => 2
}
