#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DS_REPSYNCALL_SYNC structure identifies a single replication operation performed between a source, and destination, server by the DsReplicaSyncAll function. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DS_REPSYNCALL_SYNC as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_repsyncall_synca
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 * @charset ANSI
 */
class DS_REPSYNCALL_SYNCA extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Pointer to a null-terminated string that specifies the DNS GUID of the source server.
     * @type {PSTR}
     */
    pszSrcId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a null-terminated string that specifies the DNS GUID of the destination server.
     * @type {PSTR}
     */
    pszDstId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * 
     * @type {PSTR}
     */
    pszNC {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * 
     * @type {Pointer<Guid>}
     */
    pguidSrc {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * 
     * @type {Pointer<Guid>}
     */
    pguidDst {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
