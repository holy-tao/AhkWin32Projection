#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct VARFORMAT_NAMED_FORMAT {
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
    static VARFORMAT_NAMED_FORMAT_GENERALDATE => 0

    /**
     * @type {Integer (Int32)}
     */
    static VARFORMAT_NAMED_FORMAT_LONGDATE => 1

    /**
     * @type {Integer (Int32)}
     */
    static VARFORMAT_NAMED_FORMAT_SHORTDATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static VARFORMAT_NAMED_FORMAT_LONGTIME => 3

    /**
     * @type {Integer (Int32)}
     */
    static VARFORMAT_NAMED_FORMAT_SHORTTIME => 4
}
