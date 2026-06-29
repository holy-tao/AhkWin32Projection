#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct EXPR_TOKEN {
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
    static FC_EXPR_START => 0

    /**
     * @type {Integer (Int32)}
     */
    static FC_EXPR_ILLEGAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static FC_EXPR_CONST32 => 1

    /**
     * @type {Integer (Int32)}
     */
    static FC_EXPR_CONST64 => 2

    /**
     * @type {Integer (Int32)}
     */
    static FC_EXPR_VAR => 3

    /**
     * @type {Integer (Int32)}
     */
    static FC_EXPR_OPER => 4

    /**
     * @type {Integer (Int32)}
     */
    static FC_EXPR_NOOP => 5

    /**
     * @type {Integer (Int32)}
     */
    static FC_EXPR_END => 6
}
