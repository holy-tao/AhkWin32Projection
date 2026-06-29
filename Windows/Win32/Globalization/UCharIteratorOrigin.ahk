#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UCharIteratorOrigin {
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
    static UITER_START => 0

    /**
     * @type {Integer (Int32)}
     */
    static UITER_CURRENT => 1

    /**
     * @type {Integer (Int32)}
     */
    static UITER_LIMIT => 2

    /**
     * @type {Integer (Int32)}
     */
    static UITER_ZERO => 3

    /**
     * @type {Integer (Int32)}
     */
    static UITER_LENGTH => 4
}
