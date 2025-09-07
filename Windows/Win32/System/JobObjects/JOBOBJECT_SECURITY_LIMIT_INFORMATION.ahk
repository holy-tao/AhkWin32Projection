#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the security limitations for a job object.
 * @remarks
 * After security limitations are placed on processes in a job, they cannot be revoked.
  * 
  * Starting with Windows Vista, you must set security limitations individually for each process associated with a job object, rather than setting them for the job object by using <a href="https://docs.microsoft.com/windows/desktop/api/jobapi2/nf-jobapi2-setinformationjobobject">SetInformationJobObject</a>. For information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-jobobject_security_limit_information
 * @namespace Windows.Win32.System.JobObjects
 * @version v4.0.30319
 */
class JOBOBJECT_SECURITY_LIMIT_INFORMATION extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    SecurityLimitFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A handle to the primary token that represents a user. The handle must have TOKEN_ASSIGN_PRIMARY access. 
     * 
     * 
     * 
     * 
     * If the token was created with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-createrestrictedtoken">CreateRestrictedToken</a>, all processes in the job are limited to that token or a further restricted token. Otherwise, the caller must have the SE_ASSIGNPRIMARYTOKEN_NAME privilege.
     * @type {Pointer<Ptr>}
     */
    JobToken {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure that specifies the SIDs to disable for access checking, if <b>SecurityLimitFlags</b> is JOB_OBJECT_SECURITY_FILTER_TOKENS. 
     * 
     * 
     * 
     * 
     * This member can be NULL if you do not want to disable any SIDs.
     * @type {Pointer<TOKEN_GROUPS>}
     */
    SidsToDisable {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_privileges">TOKEN_PRIVILEGES</a> structure that specifies the privileges to delete from the token, if <b>SecurityLimitFlags</b> is JOB_OBJECT_SECURITY_FILTER_TOKENS. 
     * 
     * 
     * 
     * 
     * This member can be NULL if you do not want to delete any privileges.
     * @type {Pointer<TOKEN_PRIVILEGES>}
     */
    PrivilegesToDelete {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure that specifies the deny-only SIDs that will be added to the access token, if <b>SecurityLimitFlags</b> is JOB_OBJECT_SECURITY_FILTER_TOKENS. 
     * 
     * 
     * 
     * 
     * This member can be NULL if you do not want to specify any deny-only SIDs.
     * @type {Pointer<TOKEN_GROUPS>}
     */
    RestrictedSids {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
