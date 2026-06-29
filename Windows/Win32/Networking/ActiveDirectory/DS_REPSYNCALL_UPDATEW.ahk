#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DS_REPSYNCALL_EVENT.ahk" { DS_REPSYNCALL_EVENT }
#Import ".\DS_REPSYNCALL_SYNCW.ahk" { DS_REPSYNCALL_SYNCW }
#Import ".\DS_REPSYNCALL_ERRINFOW.ahk" { DS_REPSYNCALL_ERRINFOW }

/**
 * The DS_REPSYNCALL_UPDATE structure contains status data about the replication performed by the DsReplicaSyncAll function. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DS_REPSYNCALL_UPDATE as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_repsyncall_updatew
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @charset Unicode
 */
export default struct DS_REPSYNCALL_UPDATEW {
    #StructPack 8

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ne-ntdsapi-ds_repsyncall_event">DS_REPSYNCALL_EVENT</a> value that describes the event which the <b>DS_REPSYNCALL_UPDATE</b> structure represents.
     */
    event : DS_REPSYNCALL_EVENT

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_repsyncall_errinfoa">DS_REPSYNCALL_ERRINFO</a> structure that contains error data about the replication performed by the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicasyncalla">DsReplicaSyncAll</a> function.
     */
    pErrInfo : DS_REPSYNCALL_ERRINFOW.Ptr

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_repsyncall_synca">DS_REPSYNCALL_SYNC</a> structure that identifies the source and destination servers that have either initiated or finished synchronization.
     */
    pSync : DS_REPSYNCALL_SYNCW.Ptr

}
