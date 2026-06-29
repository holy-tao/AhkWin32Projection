#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct DBSTATUSENUM {
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
    static DBSTATUS_S_OK => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBSTATUS_E_BADACCESSOR => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBSTATUS_E_CANTCONVERTVALUE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBSTATUS_S_ISNULL => 3

    /**
     * @type {Integer (Int32)}
     */
    static DBSTATUS_S_TRUNCATED => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBSTATUS_E_SIGNMISMATCH => 5

    /**
     * @type {Integer (Int32)}
     */
    static DBSTATUS_E_DATAOVERFLOW => 6

    /**
     * @type {Integer (Int32)}
     */
    static DBSTATUS_E_CANTCREATE => 7

    /**
     * @type {Integer (Int32)}
     */
    static DBSTATUS_E_UNAVAILABLE => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBSTATUS_E_PERMISSIONDENIED => 9

    /**
     * @type {Integer (Int32)}
     */
    static DBSTATUS_E_INTEGRITYVIOLATION => 10

    /**
     * @type {Integer (Int32)}
     */
    static DBSTATUS_E_SCHEMAVIOLATION => 11

    /**
     * @type {Integer (Int32)}
     */
    static DBSTATUS_E_BADSTATUS => 12

    /**
     * @type {Integer (Int32)}
     */
    static DBSTATUS_S_DEFAULT => 13
}
