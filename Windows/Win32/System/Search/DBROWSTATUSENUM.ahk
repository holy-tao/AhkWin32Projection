#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct DBROWSTATUSENUM {
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
    static DBROWSTATUS_S_OK => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBROWSTATUS_S_MULTIPLECHANGES => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBROWSTATUS_S_PENDINGCHANGES => 3

    /**
     * @type {Integer (Int32)}
     */
    static DBROWSTATUS_E_CANCELED => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBROWSTATUS_E_CANTRELEASE => 6

    /**
     * @type {Integer (Int32)}
     */
    static DBROWSTATUS_E_CONCURRENCYVIOLATION => 7

    /**
     * @type {Integer (Int32)}
     */
    static DBROWSTATUS_E_DELETED => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBROWSTATUS_E_PENDINGINSERT => 9

    /**
     * @type {Integer (Int32)}
     */
    static DBROWSTATUS_E_NEWLYINSERTED => 10

    /**
     * @type {Integer (Int32)}
     */
    static DBROWSTATUS_E_INTEGRITYVIOLATION => 11

    /**
     * @type {Integer (Int32)}
     */
    static DBROWSTATUS_E_INVALID => 12

    /**
     * @type {Integer (Int32)}
     */
    static DBROWSTATUS_E_MAXPENDCHANGESEXCEEDED => 13

    /**
     * @type {Integer (Int32)}
     */
    static DBROWSTATUS_E_OBJECTOPEN => 14

    /**
     * @type {Integer (Int32)}
     */
    static DBROWSTATUS_E_OUTOFMEMORY => 15

    /**
     * @type {Integer (Int32)}
     */
    static DBROWSTATUS_E_PERMISSIONDENIED => 16

    /**
     * @type {Integer (Int32)}
     */
    static DBROWSTATUS_E_LIMITREACHED => 17

    /**
     * @type {Integer (Int32)}
     */
    static DBROWSTATUS_E_SCHEMAVIOLATION => 18

    /**
     * @type {Integer (Int32)}
     */
    static DBROWSTATUS_E_FAIL => 19
}
