#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines values that describe the state of the similarity traits table, similarity file ID table, or both.
 * @see https://learn.microsoft.com/windows/win32/api/msrdc/ne-msrdc-rdccreatedtables
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 * @version v4.0.30319
 */
class RdcCreatedTables{

    /**
     * The table contains data that is not valid.
     * @type {Integer (Int32)}
     */
    static RDCTABLE_InvalidOrUnknown => 0

    /**
     * The table is an existing table.
     * @type {Integer (Int32)}
     */
    static RDCTABLE_Existing => 1

    /**
     * The table is a new table.
     * @type {Integer (Int32)}
     */
    static RDCTABLE_New => 2
}
