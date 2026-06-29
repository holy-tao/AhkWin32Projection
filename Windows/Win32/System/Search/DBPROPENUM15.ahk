#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct DBPROPENUM15 {
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
    static DBPROP_FILTERCOMPAREOPS => 209

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_FINDCOMPAREOPS => 210

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IChapteredRowset => 202

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IDBAsynchStatus => 203

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IRowsetFind => 204

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IRowsetView => 212

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IViewChapter => 213

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IViewFilter => 214

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IViewRowset => 215

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IViewSort => 216

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_INIT_ASYNCH => 200

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_MAXOPENCHAPTERS => 199

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_MAXORSINFILTER => 205

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_MAXSORTCOLUMNS => 206

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_ROWSET_ASYNCH => 201

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_SORTONINDEX => 207
}
