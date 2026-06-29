#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct VARFORMAT_GROUP {
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
    static VARFORMAT_GROUP_SYSTEMDEFAULT => -2

    /**
     * @type {Integer (Int32)}
     */
    static VARFORMAT_GROUP_THOUSANDS => -1

    /**
     * @type {Integer (Int32)}
     */
    static VARFORMAT_GROUP_NOTTHOUSANDS => 0
}
