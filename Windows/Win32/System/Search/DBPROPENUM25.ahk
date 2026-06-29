#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct DBPROPENUM25 {
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
    static DBPROP_COL_SEED => 282

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_COL_INCREMENT => 283

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_INIT_GENERALTIMEOUT => 284

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_COMSERVICES => 285
}
