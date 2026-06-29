#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about a logon session. (LSA_LAST_INTER_LOGON_INFO)
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-lsa_last_inter_logon_info
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct LSA_LAST_INTER_LOGON_INFO {
    #StructPack 8

    /**
     * The time that the session owner most recently logged on  successfully.
     */
    LastSuccessfulLogon : Int64

    /**
     * The time of the most recent failed attempt to log on.
     */
    LastFailedLogon : Int64

    /**
     * The number of failed attempts to log on since the last successful log on.
     */
    FailedAttemptCountSinceLastSuccessfulLogon : UInt32

}
