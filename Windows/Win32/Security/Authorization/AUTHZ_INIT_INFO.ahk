#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the initialization information for the resource manager.
 * @see https://learn.microsoft.com/windows/win32/api/authz/ns-authz-authz_init_info
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class AUTHZ_INIT_INFO extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * The version of the authorization resource manager initialization information structure. This must be set to AUTHZ_INIT_INFO_VERSION_V1 (1).
     * @type {Integer}
     */
    version {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Pointer to a Unicode string that identifies the resource manager. This parameter can be <b>NULL</b> if the resource manager does not need a name.
     * @type {Pointer<Ptr>}
     */
    szResourceManagerName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authzaccesscheckcallback">AuthzAccessCheckCallback</a> callback function that the resource manager calls each time it encounters a callback access control entry (ACE) during access control list (ACL) evaluation in <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzaccesscheck">AuthzAccessCheck</a> or <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzcachedaccesscheck">AuthzCachedAccessCheck</a>. This parameter can be <b>NULL</b> if no access check callback function is used.
     * @type {Pointer<Ptr>}
     */
    pfnDynamicAccessCheck {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authzcomputegroupscallback">AuthzComputeGroupsCallback</a> callback function called by the resource manager during initialization of an AuthzClientContext handle. This parameter can be <b>NULL</b> if no callback function is used to compute dynamic groups.
     * @type {Pointer<Ptr>}
     */
    pfnComputeDynamicGroups {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authzfreegroupscallback">AuthzFreeGroupsCallback</a> callback function called by the resource manager to free security identifier (SID) attribute arrays allocated by the compute dynamic groups callback. This parameter can be <b>NULL</b> if no callback function is used to compute dynamic groups.
     * @type {Pointer<Ptr>}
     */
    pfnFreeDynamicGroups {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authzgetcentralaccesspolicycallback-">AuthzGetCentralAccessPolicyCallback</a> callback function to be called by the resource manager to resolve any Central Access Policy ID ACE (<a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-system_scoped_policy_id_ace">SYSTEM_SCOPED_POLICY_ID_ACE</a>) encountered by <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzaccesscheck">AuthzAccessCheck</a> or <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzcachedaccesscheck">AuthzCachedAccessCheck</a>. If this parameter is <b>NULL</b>, the <b>AuthzAccessCheck</b> function will fall back to LSA to resolve the Central Access Policy ID ACE.
     * @type {Pointer<Ptr>}
     */
    pfnGetCentralAccessPolicy {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authzfreecentralaccesspolicycallback">AuthzFreeCentralAccessPolicyCallback</a> callback function called by the resource manager to free the Central Access Policy allocated by the callback to get a central access policy. This parameter can be <b>NULL</b> if no callback function is specified for pfnGetCentralAccessPolicy
     * @type {Pointer<Ptr>}
     */
    pfnFreeCentralAccessPolicy {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
