#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Security\TOKEN_GROUPS.ahk" { TOKEN_GROUPS }
#Import ".\JOB_OBJECT_SECURITY.ahk" { JOB_OBJECT_SECURITY }
#Import "..\..\Security\TOKEN_PRIVILEGES.ahk" { TOKEN_PRIVILEGES }

/**
 * Contains the security limitations for a job object.
 * @remarks
 * After security limitations are placed on processes in a job, they cannot be revoked.
 * 
 * Starting with Windows Vista, you must set security limitations individually for each process associated with a job object, rather than setting them for the job object by using <a href="https://docs.microsoft.com/windows/desktop/api/jobapi2/nf-jobapi2-setinformationjobobject">SetInformationJobObject</a>. For information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-jobobject_security_limit_information
 * @namespace Windows.Win32.System.JobObjects
 */
export default struct JOBOBJECT_SECURITY_LIMIT_INFORMATION {
    #StructPack 8

    SecurityLimitFlags : JOB_OBJECT_SECURITY

    /**
     * A handle to the primary token that represents a user. The handle must have TOKEN_ASSIGN_PRIMARY access. 
     * 
     * 
     * 
     * 
     * If the token was created with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-createrestrictedtoken">CreateRestrictedToken</a>, all processes in the job are limited to that token or a further restricted token. Otherwise, the caller must have the SE_ASSIGNPRIMARYTOKEN_NAME privilege.
     */
    JobToken : HANDLE

    /**
     * A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure that specifies the SIDs to disable for access checking, if <b>SecurityLimitFlags</b> is JOB_OBJECT_SECURITY_FILTER_TOKENS. 
     * 
     * 
     * 
     * 
     * This member can be NULL if you do not want to disable any SIDs.
     */
    SidsToDisable : TOKEN_GROUPS.Ptr

    /**
     * A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_privileges">TOKEN_PRIVILEGES</a> structure that specifies the privileges to delete from the token, if <b>SecurityLimitFlags</b> is JOB_OBJECT_SECURITY_FILTER_TOKENS. 
     * 
     * 
     * 
     * 
     * This member can be NULL if you do not want to delete any privileges.
     */
    PrivilegesToDelete : TOKEN_PRIVILEGES.Ptr

    /**
     * A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure that specifies the deny-only SIDs that will be added to the access token, if <b>SecurityLimitFlags</b> is JOB_OBJECT_SECURITY_FILTER_TOKENS. 
     * 
     * 
     * 
     * 
     * This member can be NULL if you do not want to specify any deny-only SIDs.
     */
    RestrictedSids : TOKEN_GROUPS.Ptr

}
