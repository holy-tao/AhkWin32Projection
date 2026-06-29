#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct MEMCTX {
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
    static MEMCTX_TASK => 1

    /**
     * @type {Integer (Int32)}
     */
    static MEMCTX_SHARED => 2

    /**
     * @type {Integer (Int32)}
     */
    static MEMCTX_MACSYSTEM => 3

    /**
     * @type {Integer (Int32)}
     */
    static MEMCTX_UNKNOWN => -1

    /**
     * @type {Integer (Int32)}
     */
    static MEMCTX_SAME => -2
}
