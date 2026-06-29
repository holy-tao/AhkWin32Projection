#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct DBCONVERTFLAGSENUM20 {
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
    static DBCONVERTFLAGS_ISLONG => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBCONVERTFLAGS_ISFIXEDLENGTH => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBCONVERTFLAGS_FROMVARIANT => 8
}
