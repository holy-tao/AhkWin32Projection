#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UDisplayContext {
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
    static UDISPCTX_STANDARD_NAMES => 0

    /**
     * @type {Integer (Int32)}
     */
    static UDISPCTX_DIALECT_NAMES => 1

    /**
     * @type {Integer (Int32)}
     */
    static UDISPCTX_CAPITALIZATION_NONE => 256

    /**
     * @type {Integer (Int32)}
     */
    static UDISPCTX_CAPITALIZATION_FOR_MIDDLE_OF_SENTENCE => 257

    /**
     * @type {Integer (Int32)}
     */
    static UDISPCTX_CAPITALIZATION_FOR_BEGINNING_OF_SENTENCE => 258

    /**
     * @type {Integer (Int32)}
     */
    static UDISPCTX_CAPITALIZATION_FOR_UI_LIST_OR_MENU => 259

    /**
     * @type {Integer (Int32)}
     */
    static UDISPCTX_CAPITALIZATION_FOR_STANDALONE => 260

    /**
     * @type {Integer (Int32)}
     */
    static UDISPCTX_LENGTH_FULL => 512

    /**
     * @type {Integer (Int32)}
     */
    static UDISPCTX_LENGTH_SHORT => 513

    /**
     * @type {Integer (Int32)}
     */
    static UDISPCTX_SUBSTITUTE => 768

    /**
     * @type {Integer (Int32)}
     */
    static UDISPCTX_NO_SUBSTITUTE => 769
}
