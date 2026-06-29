#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPRESULTTYPE {
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
    static SPRT_CFG => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPRT_SLM => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPRT_PROPRIETARY => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPRT_FALSE_RECOGNITION => 4

    /**
     * @type {Integer (Int32)}
     */
    static SPRT_TYPE_MASK => 3

    /**
     * @type {Integer (Int32)}
     */
    static SPRT_EMULATED => 8

    /**
     * @type {Integer (Int32)}
     */
    static SPRT_EXTENDABLE_PARSE => 16
}
