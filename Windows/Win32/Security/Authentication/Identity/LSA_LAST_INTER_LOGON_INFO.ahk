#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a logon session. (LSA_LAST_INTER_LOGON_INFO)
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-lsa_last_inter_logon_info
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class LSA_LAST_INTER_LOGON_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The time that the session owner most recently logged on  successfully.
     * @type {Integer}
     */
    LastSuccessfulLogon {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * The time of the most recent failed attempt to log on.
     * @type {Integer}
     */
    LastFailedLogon {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * The number of failed attempts to log on since the last successful log on.
     * @type {Integer}
     */
    FailedAttemptCountSinceLastSuccessfulLogon {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
