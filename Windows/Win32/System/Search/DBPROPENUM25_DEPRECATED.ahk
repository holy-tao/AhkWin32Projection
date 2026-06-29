#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct DBPROPENUM25_DEPRECATED {
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
    static DBPROP_ICommandCost => 141

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_ICommandTree => 142

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_ICommandValidate => 143

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IDBSchemaCommand => 144

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IProvideMoniker => 125

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IQuery => 146

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IReadData => 147

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IRowsetAsynch => 148

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IRowsetCopyRows => 149

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IRowsetKeys => 151

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IRowsetNewRowAfter => 152

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IRowsetNextRowset => 153

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IRowsetWatchAll => 155

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IRowsetWatchNotify => 156

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IRowsetWatchRegion => 157

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IRowsetWithParameters => 158
}
