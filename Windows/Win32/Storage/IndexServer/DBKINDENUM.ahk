#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DBKINDENUM enumerated type specifies the combination of GUID, property number, or property name to use to identify a database object.
 * @see https://docs.microsoft.com/windows/win32/api//oledbguid/ne-oledbguid-dbkindenum
 * @namespace Windows.Win32.Storage.IndexServer
 * @version v4.0.30319
 */
class DBKINDENUM{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DBKIND_GUID_NAME => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DBKIND_GUID_PROPID => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DBKIND_NAME => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DBKIND_PGUID_NAME => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DBKIND_PGUID_PROPID => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DBKIND_PROPID => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DBKIND_GUID => 6
}
