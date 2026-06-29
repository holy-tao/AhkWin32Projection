#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct DBCOLUMNFLAGSENUM {
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
    static DBCOLUMNFLAGS_ISBOOKMARK => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBCOLUMNFLAGS_MAYDEFER => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBCOLUMNFLAGS_WRITE => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBCOLUMNFLAGS_WRITEUNKNOWN => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBCOLUMNFLAGS_ISFIXEDLENGTH => 16

    /**
     * @type {Integer (Int32)}
     */
    static DBCOLUMNFLAGS_ISNULLABLE => 32

    /**
     * @type {Integer (Int32)}
     */
    static DBCOLUMNFLAGS_MAYBENULL => 64

    /**
     * @type {Integer (Int32)}
     */
    static DBCOLUMNFLAGS_ISLONG => 128

    /**
     * @type {Integer (Int32)}
     */
    static DBCOLUMNFLAGS_ISROWID => 256

    /**
     * @type {Integer (Int32)}
     */
    static DBCOLUMNFLAGS_ISROWVER => 512

    /**
     * @type {Integer (Int32)}
     */
    static DBCOLUMNFLAGS_CACHEDEFERRED => 4096
}
