#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UNumberRangeIdentityFallback {
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
    static UNUM_IDENTITY_FALLBACK_SINGLE_VALUE => 0

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_IDENTITY_FALLBACK_APPROXIMATELY_OR_SINGLE_VALUE => 1

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_IDENTITY_FALLBACK_APPROXIMATELY => 2

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_IDENTITY_FALLBACK_RANGE => 3
}
