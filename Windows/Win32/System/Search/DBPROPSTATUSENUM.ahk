#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct DBPROPSTATUSENUM {
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
    static DBPROPSTATUS_OK => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPSTATUS_NOTSUPPORTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPSTATUS_BADVALUE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPSTATUS_BADOPTION => 3

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPSTATUS_BADCOLUMN => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPSTATUS_NOTALLSETTABLE => 5

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPSTATUS_NOTSETTABLE => 6

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPSTATUS_NOTSET => 7

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPSTATUS_CONFLICTING => 8
}
