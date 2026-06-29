#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct DBPROPFLAGSENUM {
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
    static DBPROPFLAGS_NOTSUPPORTED => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPFLAGS_COLUMN => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPFLAGS_DATASOURCE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPFLAGS_DATASOURCECREATE => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPFLAGS_DATASOURCEINFO => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPFLAGS_DBINIT => 16

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPFLAGS_INDEX => 32

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPFLAGS_ROWSET => 64

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPFLAGS_TABLE => 128

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPFLAGS_COLUMNOK => 256

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPFLAGS_READ => 512

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPFLAGS_WRITE => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPFLAGS_REQUIRED => 2048

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPFLAGS_SESSION => 4096
}
