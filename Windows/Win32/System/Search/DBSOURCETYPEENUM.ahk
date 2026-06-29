#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct DBSOURCETYPEENUM {
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
    static DBSOURCETYPE_DATASOURCE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBSOURCETYPE_ENUMERATOR => 2
}
