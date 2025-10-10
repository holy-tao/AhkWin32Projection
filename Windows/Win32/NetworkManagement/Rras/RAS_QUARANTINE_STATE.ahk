#Requires AutoHotkey v2.0.0 64-bit

/**
 * The RAS_QUARANTINE_STATE enumerated type indicates the quarantine state of a client connection.
 * @see https://docs.microsoft.com/windows/win32/api//mprapi/ne-mprapi-ras_quarantine_state
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RAS_QUARANTINE_STATE{

    /**
     * The connection state is normal.
     * @type {Integer (Int32)}
     */
    static RAS_QUAR_STATE_NORMAL => 0

    /**
     * The connection is quarantined.
     * @type {Integer (Int32)}
     */
    static RAS_QUAR_STATE_QUARANTINE => 1

    /**
     * The connection is in probation.
     * @type {Integer (Int32)}
     */
    static RAS_QUAR_STATE_PROBATION => 2

    /**
     * The connection state is unknown.
     * @type {Integer (Int32)}
     */
    static RAS_QUAR_STATE_NOT_CAPABLE => 3
}
