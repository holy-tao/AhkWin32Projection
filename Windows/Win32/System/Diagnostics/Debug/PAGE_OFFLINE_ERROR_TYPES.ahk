#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct PAGE_OFFLINE_ERROR_TYPES {
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
    static BitErrorDdr4 => 0

    /**
     * @type {Integer (Int32)}
     */
    static RowErrorDdr4 => 1

    /**
     * @type {Integer (Int32)}
     */
    static BitErrorDdr5 => 2

    /**
     * @type {Integer (Int32)}
     */
    static RowErrorDdr5 => 3
}
