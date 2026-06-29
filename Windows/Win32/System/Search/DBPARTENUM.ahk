#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct DBPARTENUM {
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
    static DBPART_INVALID => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBPART_VALUE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPART_LENGTH => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPART_STATUS => 4
}
