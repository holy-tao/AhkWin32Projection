#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * The DS_REPL_KCC_DSA_FAILURE structure contains replication state data about a specific inbound replication partner, as returned by the DsReplicaGetInfo and DsReplicaGetInfo2 function.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_repl_kcc_dsa_failurew
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DS_REPL_KCC_DSA_FAILUREW extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Pointer to a null-terminated string that contains the  distinguished name of the directory system agent object in the directory that corresponds to the source server.
     * @type {PWSTR}
     */
    pszDsaDN{
        get {
            if(!this.HasProp("__pszDsaDN"))
                this.__pszDsaDN := PWSTR(this.ptr + 0)
            return this.__pszDsaDN
        }
    }

    /**
     * Contains the <b>objectGuid</b> of the directory system agent object represented by the <b>pszDsaDN</b> member.
     * @type {Pointer<Guid>}
     */
    uuidDsaObjGuid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure which the contents of depends on the value passed for the <i>InfoType</i> parameter when <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicagetinfow">DsReplicaGetInfo</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicagetinfo2w">DsReplicaGetInfo2</a> function was called.
     * @type {FILETIME}
     */
    ftimeFirstFailure{
        get {
            if(!this.HasProp("__ftimeFirstFailure"))
                this.__ftimeFirstFailure := FILETIME(this.ptr + 16)
            return this.__ftimeFirstFailure
        }
    }

    /**
     * Contains the number of consecutive failures since the last successful replication.
     * @type {Integer}
     */
    cNumFailures {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Contains the error code associated with the most recent failure, or <b>ERROR_SUCCESS</b> if the specific error is unavailable.
     * @type {Integer}
     */
    dwLastResult {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
