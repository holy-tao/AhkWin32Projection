#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct DBINDEX_COL_ORDERENUM {
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
    static DBINDEX_COL_ORDER_ASC => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBINDEX_COL_ORDER_DESC => 1
}
