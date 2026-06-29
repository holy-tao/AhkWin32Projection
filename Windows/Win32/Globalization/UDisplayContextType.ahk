#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UDisplayContextType {
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
    static UDISPCTX_TYPE_DIALECT_HANDLING => 0

    /**
     * @type {Integer (Int32)}
     */
    static UDISPCTX_TYPE_CAPITALIZATION => 1

    /**
     * @type {Integer (Int32)}
     */
    static UDISPCTX_TYPE_DISPLAY_LENGTH => 2

    /**
     * @type {Integer (Int32)}
     */
    static UDISPCTX_TYPE_SUBSTITUTE_HANDLING => 3
}
