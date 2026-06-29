#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains replication state data with respect to a specific inbound replication partner.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_repl_kcc_dsa_failurew_blob
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DS_REPL_KCC_DSA_FAILUREW_BLOB {
    #StructPack 4

    /**
     * Contains the offset, in bytes, from the address of this structure  to  a null-terminated string that contains the  distinguished name of the directory system agent object in the directory that corresponds to the source server.
     */
    oszDsaDN : UInt32

    /**
     * Contains the <b>objectGuid</b> of the directory system agent object represented by the <b>oszDsaDN</b> member.
     */
    uuidDsaObjGuid : Guid

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure which the contents of depends on the requested binary replication data.
     */
    ftimeFirstFailure : FILETIME

    /**
     * Contains the number of consecutive failures since the last successful replication.
     */
    cNumFailures : UInt32

    /**
     * Contains the error code associated with the most recent failure, or <b>ERROR_SUCCESS</b> if the specific error is unavailable.
     */
    dwLastResult : UInt32

}
