#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct DBPROPENUM26 {
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
    static DBPROP_OUTPUTSTREAM => 286

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_OUTPUTENCODING => 287

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_TABLESTATISTICS => 288

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_SKIPROWCOUNTRESULTS => 291

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IRowsetBookmark => 292

    /**
     * @type {Integer (Int32)}
     */
    static MDPROP_VISUALMODE => 293
}
