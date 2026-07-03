#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\GROUP_POLICY_OBJECTA.ahk" { GROUP_POLICY_OBJECTA }
#Import ".\PFNSTATUSMESSAGECALLBACK.ahk" { PFNSTATUSMESSAGECALLBACK }
#Import "..\Registry\HKEY.ahk" { HKEY }

/**
 * The ProcessGroupPolicy function is an application-defined callback function used when applying policy.
 * @remarks
 * For more information, see 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/Policy/implementing-a-group-policy-client-side-extension">Implementing a Group Policy Client-side Extension</a>.
 * 
 * The system calls this function in the context of the 
 * <a href="https://docs.microsoft.com/windows/desktop/Services/localsystem-account">LocalSystem account</a>, which has extensive privileges on the local computer. To use network resources, you must impersonate the user or computer by using the token provided in the <i>hToken</i> parameter.
 * 
 * To register this callback function, create a subkey under the following registry key:
 * 
 * 
 * <b>HKEY_LOCAL_MACHINE</b>&#92;<b>SOFTWARE</b>&#92;<b>Microsoft</b>&#92;<b>Windows NT</b>&#92;<b>CurrentVersion</b>&#92;<b>Winlogon</b>&#92;<b>GPExtensions</b>&#92;<b>ClientExtensionGuid</b>
 * 
 * 
 * 
 * The subkey should be a <b>GUID</b>, so that it is unique. It should contain the following values.
 * 
 * 
 * 
 * You should update the status message only if you are applying policy synchronously. This allows you to provide feedback and diagnostics during a lengthy policy application. To use the status message callback function, you must verify that <i>pStatusCallback</i> is not <b>NULL</b>. Then load your message string resource. When you call the status function, you must indicate whether the string is verbose. If the string is verbose, the callback function will verify that the computer is in verbose mode and display the message. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nc-userenv-pfnstatusmessagecallback">StatusMessageCallback</a>.
 * 
 * <div class="alert"><b>Warning</b>  Do not call the <i>pStatusCallback</i> function from a background thread because you may overwrite another thread's status message.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/userenv/nc-userenv-pfnprocessgrouppolicy
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct PFNPROCESSGROUPPOLICY {
    value : IntPtr

    __value {
        set {
            if (value is PFNPROCESSGROUPPOLICY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwFlags This parameter can be one or more of the following flags.
     * @param {HANDLE} hToken Token for the user or computer, returned from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-logonusera">LogonUser</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-createrestrictedtoken">CreateRestrictedToken</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-duplicatetoken">DuplicateToken</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-openprocesstoken">OpenProcessToken</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-openthreadtoken">OpenThreadToken</a> function. This token must have <b>TOKEN_IMPERSONATE</b> and <b>TOKEN_QUERY</b> access. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-rights-for-access-token-objects">Access Rights for Access-Token Objects</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/client-impersonation">Client Impersonation</a>.
     * @param {HKEY} hKeyRoot Handle to the <b>HKEY_LOCAL_MACHINE</b> or <b>HKEY_CURRENT_USER</b> registry key.
     * @param {Pointer<GROUP_POLICY_OBJECTA>} pDeletedGPOList Pointer that receives the list of deleted GPO structures. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/ns-userenv-group_policy_objecta">GROUP_POLICY_OBJECT</a>.
     * @param {Pointer<GROUP_POLICY_OBJECTA>} pChangedGPOList Pointer that receives the list of changed GPO structures. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/ns-userenv-group_policy_objecta">GROUP_POLICY_OBJECT</a>.
     * @param {Pointer} pHandle Asynchronous completion handle. If the callback function does not support asynchronous processing, this handle is zero.
     * @param {Pointer<BOOL>} pbAbort Specifies whether to continue processing GPOs. If this parameter is <b>TRUE</b>, GPO processing will cease. If this parameter is <b>FALSE</b>, GPO processing will continue.
     * @param {Pointer<PFNSTATUSMESSAGECALLBACK>} pStatusCallback Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nc-userenv-pfnstatusmessagecallback">StatusMessageCallback</a> callback function that displays status messages. This parameter can be <b>NULL</b> in certain cases. For example, if the system is applying policy in the background, the status user interface is not present and the application cannot send status messages to be displayed. For more information, see the following Remarks section.
     * @returns {Integer} If policy was applied successfully, return <b>ERROR_SUCCESS</b>. If there are no changes to the GPO list, and the extension is to be called again, return <b>ERROR_OVERRIDE_NOCHANGES</b>. Returning <b>ERROR_OVERRIDE_NOCHANGES</b> ensures that the extension is called again, even if the <b>NoGPOListChanges</b> registry value is set. (For more information about this registry value, see Remarks.) Otherwise, return a 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>.
     */
    Call(dwFlags, hToken, hKeyRoot, pDeletedGPOList, pChangedGPOList, pHandle, pbAbort, pStatusCallback) {
        pbAbortMarshal := pbAbort is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, UInt32, dwFlags, HANDLE, hToken, HKEY, hKeyRoot, GROUP_POLICY_OBJECTA.Ptr, pDeletedGPOList, GROUP_POLICY_OBJECTA.Ptr, pChangedGPOList, IntPtr, pHandle, pbAbortMarshal, pbAbort, PFNSTATUSMESSAGECALLBACK, pStatusCallback, UInt32)
        return result
    }

    /**
     * A PFNPROCESSGROUPPOLICY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNPROCESSGROUPPOLICY {
        /**
         * Creates a PFNPROCESSGROUPPOLICY pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, HANDLE, HKEY, GROUP_POLICY_OBJECTA, GROUP_POLICY_OBJECTA, IntPtr, BOOL, PFNSTATUSMESSAGECALLBACK) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, HANDLE, HKEY, GROUP_POLICY_OBJECTA.Ptr, GROUP_POLICY_OBJECTA.Ptr, IntPtr, BOOL.Ptr, PFNSTATUSMESSAGECALLBACK, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
