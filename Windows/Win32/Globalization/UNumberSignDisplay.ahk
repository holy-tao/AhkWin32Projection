#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UNumberSignDisplay {
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
    static UNUM_SIGN_AUTO => 0

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_SIGN_ALWAYS => 1

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_SIGN_NEVER => 2

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_SIGN_ACCOUNTING => 3

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_SIGN_ACCOUNTING_ALWAYS => 4

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_SIGN_EXCEPT_ZERO => 5

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_SIGN_ACCOUNTING_EXCEPT_ZERO => 6

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_SIGN_NEGATIVE => 7

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_SIGN_ACCOUNTING_NEGATIVE => 8

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_SIGN_COUNT => 9
}
