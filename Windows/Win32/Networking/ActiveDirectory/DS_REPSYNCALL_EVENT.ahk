#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DS_REPSYNCALL_EVENT enumeration is used with the DS_REPSYNCALL_UPDATE structure to define which event the DS_REPSYNCALL_UPDATE structure represents.
 * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/ne-ntdsapi-ds_repsyncall_event
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DS_REPSYNCALL_EVENT{

    /**
     * An error occurred. Error data is stored in the <b>pErrInfo</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_repsyncall_updatea">DS_REPSYNCALL_UPDATE</a> structure.
     * @type {Integer (Int32)}
     */
    static DS_REPSYNCALL_EVENT_ERROR => 0

    /**
     * Synchronization of two servers has started. Both the <b>pErrInfo</b> and <b>pSync</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_repsyncall_updatea">DS_REPSYNCALL_UPDATE</a> structure are <b>NULL</b>.
     * @type {Integer (Int32)}
     */
    static DS_REPSYNCALL_EVENT_SYNC_STARTED => 1

    /**
     * Synchronization of two servers has just finished. The servers involved in the synchronization are identified by the <b>pSync</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_repsyncall_updatea">DS_REPSYNCALL_UPDATE</a> structure. The <b>pErrInfo</b> member of the <b>DS_REPSYNCALL_UPDATE</b> structure is <b>NULL</b>.
     * @type {Integer (Int32)}
     */
    static DS_REPSYNCALL_EVENT_SYNC_COMPLETED => 2

    /**
     * Execution of <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicasyncalla">DsReplicaSyncAll</a> is complete. Both the <b>pErrInfo</b> and <b>pSync</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_repsyncall_updatea">DS_REPSYNCALL_UPDATE</a> structure are <b>NULL</b>. The return value of the callback function is ignored.
     * @type {Integer (Int32)}
     */
    static DS_REPSYNCALL_EVENT_FINISHED => 3
}
