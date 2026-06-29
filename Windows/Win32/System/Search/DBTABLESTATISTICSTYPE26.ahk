#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct DBTABLESTATISTICSTYPE26 {
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
    static DBSTAT_HISTOGRAM => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBSTAT_COLUMN_CARDINALITY => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBSTAT_TUPLE_CARDINALITY => 4
}
