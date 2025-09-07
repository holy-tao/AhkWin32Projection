#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DS_REPSYNCALL_UPDATE structure contains status data about the replication performed by the DsReplicaSyncAll function. (Unicode)
 * @remarks
 * > [!NOTE]
  * > The ntdsapi.h header defines DS_REPSYNCALL_UPDATE as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_repsyncall_updatew
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 * @charset Unicode
 */
class DS_REPSYNCALL_UPDATEW extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ne-ntdsapi-ds_repsyncall_event">DS_REPSYNCALL_EVENT</a> value that describes the event which the <b>DS_REPSYNCALL_UPDATE</b> structure represents.
     * @type {Integer}
     */
    event {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_repsyncall_errinfoa">DS_REPSYNCALL_ERRINFO</a> structure that contains error data about the replication performed by the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicasyncalla">DsReplicaSyncAll</a> function.
     * @type {Pointer<DS_REPSYNCALL_ERRINFOW>}
     */
    pErrInfo {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_repsyncall_synca">DS_REPSYNCALL_SYNC</a> structure that identifies the source and destination servers that have either initiated or finished synchronization.
     * @type {Pointer<DS_REPSYNCALL_SYNCW>}
     */
    pSync {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
