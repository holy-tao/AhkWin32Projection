#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Contains replication state data with respect to a specific inbound replication partner.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_repl_kcc_dsa_failurew_blob
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
class DS_REPL_KCC_DSA_FAILUREW_BLOB extends Win32Struct {
    static sizeof => 36

    static packingSize => 4

    /**
     * Contains the offset, in bytes, from the address of this structure  to  a null-terminated string that contains the  distinguished name of the directory system agent object in the directory that corresponds to the source server.
     * @type {Integer}
     */
    oszDsaDN {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Contains the <b>objectGuid</b> of the directory system agent object represented by the <b>oszDsaDN</b> member.
     * @type {Guid}
     */
    uuidDsaObjGuid {
        get {
            if(!this.HasProp("__uuidDsaObjGuid"))
                this.__uuidDsaObjGuid := Guid(4, this)
            return this.__uuidDsaObjGuid
        }
    }

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure which the contents of depends on the requested binary replication data.
     * @type {FILETIME}
     */
    ftimeFirstFailure {
        get {
            if(!this.HasProp("__ftimeFirstFailure"))
                this.__ftimeFirstFailure := FILETIME(20, this)
            return this.__ftimeFirstFailure
        }
    }

    /**
     * Contains the number of consecutive failures since the last successful replication.
     * @type {Integer}
     */
    cNumFailures {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Contains the error code associated with the most recent failure, or <b>ERROR_SUCCESS</b> if the specific error is unavailable.
     * @type {Integer}
     */
    dwLastResult {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
