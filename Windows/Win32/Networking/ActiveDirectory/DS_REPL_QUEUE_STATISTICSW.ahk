#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * Used to contain replication queue statistics.
 * @remarks
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms676274(v=vs.85)">DS_REPL_QUEUE_STATISTICSW_BLOB</a> is an alias for this structure.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_repl_queue_statisticsw
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DS_REPL_QUEUE_STATISTICSW {
    #StructPack 4

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the date and time that the currently running operation started.
     */
    ftimeCurrentOpStarted : FILETIME

    /**
     * Contains the number of currently pending operations.
     */
    cNumPendingOps : UInt32

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the date and time of the oldest synchronization operation.
     */
    ftimeOldestSync : FILETIME

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the date and time of the oldest add operation.
     */
    ftimeOldestAdd : FILETIME

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the date and time of the oldest modification operation.
     */
    ftimeOldestMod : FILETIME

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the date and time of the oldest delete operation.
     */
    ftimeOldestDel : FILETIME

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the date and time of the oldest reference update operation.
     */
    ftimeOldestUpdRefs : FILETIME

}
