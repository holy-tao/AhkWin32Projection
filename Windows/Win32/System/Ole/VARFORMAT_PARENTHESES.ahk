#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct VARFORMAT_PARENTHESES {
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
    static VARFORMAT_PARENTHESES_SYSTEMDEFAULT => -2

    /**
     * @type {Integer (Int32)}
     */
    static VARFORMAT_PARENTHESES_USED => -1

    /**
     * @type {Integer (Int32)}
     */
    static VARFORMAT_PARENTHESES_NOTUSED => 0
}
