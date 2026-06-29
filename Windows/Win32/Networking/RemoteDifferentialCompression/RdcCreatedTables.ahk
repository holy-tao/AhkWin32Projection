#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines values that describe the state of the similarity traits table, similarity file ID table, or both.
 * @see https://learn.microsoft.com/windows/win32/api/msrdc/ne-msrdc-rdccreatedtables
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 */
export default struct RdcCreatedTables {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
