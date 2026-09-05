#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The RAS_QUARANTINE_STATE enumerated type indicates the quarantine state of a client connection.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ne-mprapi-ras_quarantine_state
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
class RAS_QUARANTINE_STATE extends Win32Enum {

    /**
     * The connection state is normal.
     * Native name: RAS_QUAR_STATE_NORMAL
     * @type {Integer (Int32)}
     */
    static QUAR_STATE_NORMAL => 0

    /**
     * The connection is quarantined.
     * Native name: RAS_QUAR_STATE_QUARANTINE
     * @type {Integer (Int32)}
     */
    static QUAR_STATE_QUARANTINE => 1

    /**
     * The connection is in probation.
     * Native name: RAS_QUAR_STATE_PROBATION
     * @type {Integer (Int32)}
     */
    static QUAR_STATE_PROBATION => 2

    /**
     * The connection state is unknown.
     * Native name: RAS_QUAR_STATE_NOT_CAPABLE
     * @type {Integer (Int32)}
     */
    static QUAR_STATE_NOT_CAPABLE => 3
}
