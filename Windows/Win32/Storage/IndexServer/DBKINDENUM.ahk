#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DBKINDENUM enumerated type specifies the combination of GUID, property number, or property name to use to identify a database object.
 * @see https://learn.microsoft.com/windows/win32/api/oledbguid/ne-oledbguid-dbkindenum
 * @namespace Windows.Win32.Storage.IndexServer
 */
export default struct DBKINDENUM {
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
    static DBKIND_GUID_NAME => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBKIND_GUID_PROPID => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBKIND_NAME => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBKIND_PGUID_NAME => 3

    /**
     * @type {Integer (Int32)}
     */
    static DBKIND_PGUID_PROPID => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBKIND_PROPID => 5

    /**
     * @type {Integer (Int32)}
     */
    static DBKIND_GUID => 6
}
