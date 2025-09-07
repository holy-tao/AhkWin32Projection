#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBPENDINGSTATUSENUM{

    /**
     * @type {Integer (Int32)}
     */
    static DBPENDINGSTATUS_NEW => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPENDINGSTATUS_CHANGED => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPENDINGSTATUS_DELETED => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBPENDINGSTATUS_UNCHANGED => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBPENDINGSTATUS_INVALIDROW => 16
}
