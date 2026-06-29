#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct DBRESOURCEKINDENUM {
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
    static DBRESOURCE_INVALID => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBRESOURCE_TOTAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBRESOURCE_CPU => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBRESOURCE_MEMORY => 3

    /**
     * @type {Integer (Int32)}
     */
    static DBRESOURCE_DISK => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBRESOURCE_NETWORK => 5

    /**
     * @type {Integer (Int32)}
     */
    static DBRESOURCE_RESPONSE => 6

    /**
     * @type {Integer (Int32)}
     */
    static DBRESOURCE_ROWS => 7

    /**
     * @type {Integer (Int32)}
     */
    static DBRESOURCE_OTHER => 8
}
