#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct DBPARAMFLAGSENUM {
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
    static DBPARAMFLAGS_ISINPUT => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPARAMFLAGS_ISOUTPUT => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPARAMFLAGS_ISSIGNED => 16

    /**
     * @type {Integer (Int32)}
     */
    static DBPARAMFLAGS_ISNULLABLE => 64

    /**
     * @type {Integer (Int32)}
     */
    static DBPARAMFLAGS_ISLONG => 128
}
