#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\DS_REPL_KCC_DSA_FAILUREW.ahk

/**
 * The DS_REPL_KCC_DSA_FAILURES structure contains an array of DS_REPL_KCC_DSA_FAILURE structures, which in turn contain replication state data with respect to inbound replication partners, as returned by the DsReplicaGetInfo and DsReplicaGetInfo2 functions.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_repl_kcc_dsa_failuresw
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DS_REPL_KCC_DSA_FAILURESW extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Contains the number of elements in the <b>rgMetaData</b> array.
     * @type {Integer}
     */
    cNumEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_repl_kcc_dsa_failurew">DS_REPL_KCC_DSA_FAILURE</a> structures that contain the requested replication data. The <b>cNumEntries</b> member contains the number of elements in this array.
     * @type {Array<DS_REPL_KCC_DSA_FAILUREW>}
     */
    rgDsaFailure{
        get {
            if(!this.HasProp("__rgDsaFailureProxyArray"))
                this.__rgDsaFailureProxyArray := Win32FixedArray(this.ptr + 8, 8, DS_REPL_KCC_DSA_FAILUREW, "")
            return this.__rgDsaFailureProxyArray
        }
    }
}
