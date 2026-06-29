#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Defines the initialization information for the resource manager.
 * @see https://learn.microsoft.com/windows/win32/api/authz/ns-authz-authz_init_info
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct AUTHZ_INIT_INFO {
    #StructPack 8

    /**
     * The version of the authorization resource manager initialization information structure. This must be set to AUTHZ_INIT_INFO_VERSION_V1 (1).
     */
    version : UInt16

    /**
     * Pointer to a Unicode string that identifies the resource manager. This parameter can be <b>NULL</b> if the resource manager does not need a name.
     */
    szResourceManagerName : PWSTR

    /**
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authzaccesscheckcallback">AuthzAccessCheckCallback</a> callback function that the resource manager calls each time it encounters a callback access control entry (ACE) during access control list (ACL) evaluation in <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzaccesscheck">AuthzAccessCheck</a> or <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzcachedaccesscheck">AuthzCachedAccessCheck</a>. This parameter can be <b>NULL</b> if no access check callback function is used.
     */
    pfnDynamicAccessCheck : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authzcomputegroupscallback">AuthzComputeGroupsCallback</a> callback function called by the resource manager during initialization of an AuthzClientContext handle. This parameter can be <b>NULL</b> if no callback function is used to compute dynamic groups.
     */
    pfnComputeDynamicGroups : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authzfreegroupscallback">AuthzFreeGroupsCallback</a> callback function called by the resource manager to free security identifier (SID) attribute arrays allocated by the compute dynamic groups callback. This parameter can be <b>NULL</b> if no callback function is used to compute dynamic groups.
     */
    pfnFreeDynamicGroups : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authzgetcentralaccesspolicycallback-">AuthzGetCentralAccessPolicyCallback</a> callback function to be called by the resource manager to resolve any Central Access Policy ID ACE (<a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-system_scoped_policy_id_ace">SYSTEM_SCOPED_POLICY_ID_ACE</a>) encountered by <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzaccesscheck">AuthzAccessCheck</a> or <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzcachedaccesscheck">AuthzCachedAccessCheck</a>. If this parameter is <b>NULL</b>, the <b>AuthzAccessCheck</b> function will fall back to LSA to resolve the Central Access Policy ID ACE.
     */
    pfnGetCentralAccessPolicy : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authzfreecentralaccesspolicycallback">AuthzFreeCentralAccessPolicyCallback</a> callback function called by the resource manager to free the Central Access Policy allocated by the callback to get a central access policy. This parameter can be <b>NULL</b> if no callback function is specified for pfnGetCentralAccessPolicy
     */
    pfnFreeCentralAccessPolicy : IntPtr

}
