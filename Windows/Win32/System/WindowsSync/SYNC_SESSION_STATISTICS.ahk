#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents statistics about a single, unidirectional synchronization session.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/ns-winsync-sync_session_statistics
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class SYNC_SESSION_STATISTICS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The total number of changes that were successfully applied during the synchronization session. This value is the sum of item changes plus change unit changes.
     * @type {Integer}
     */
    dwChangesApplied {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The total number of changes that were not applied during a session. This value is the sum of item changes plus change unit changes.
     * @type {Integer}
     */
    dwChangesFailed {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
