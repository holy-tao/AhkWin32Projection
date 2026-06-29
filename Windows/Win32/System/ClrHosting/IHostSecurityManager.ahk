#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\EContextType.ahk" { EContextType }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHostSecurityContext.ahk" { IHostSecurityContext }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct IHostSecurityManager extends IUnknown {
    /**
     * The interface identifier for IHostSecurityManager
     * @type {Guid}
     */
    static IID := Guid("{75ad2468-a349-4d02-a764-76a68aee0c4f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHostSecurityManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ImpersonateLoggedOnUser : IntPtr
        RevertToSelf            : IntPtr
        OpenThreadToken         : IntPtr
        SetThreadToken          : IntPtr
        GetSecurityContext      : IntPtr
        SetSecurityContext      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHostSecurityManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Lets the calling thread impersonate the security context of a logged-on user. The user is represented by a token handle.
     * @remarks
     * The impersonation lasts until the thread exits or until it calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-reverttoself">RevertToSelf</a>.
     * 
     * The calling thread does not need to have any particular <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">privileges</a> to call <b>ImpersonateLoggedOnUser</b>.
     * 
     * If the call to <b>ImpersonateLoggedOnUser</b> fails, the client connection is not impersonated and the client request is made in the security context of the process. If the process is running as a highly privileged account, such as LocalSystem, or as a member of an administrative group, the user may be able to perform actions they would otherwise be disallowed. Therefore, it is important to always check the return value of the call, and if it fails, raise an error; do not continue execution of the client request.
     * 
     * All impersonate functions, including <b>ImpersonateLoggedOnUser</b> allow the requested impersonation if one of the following is true: 
     * 
     * 
     * 
     * <ul>
     * <li>The requested impersonation level of the token is less than <b>SecurityImpersonation</b>, such as <b>SecurityIdentification</b> or <b>SecurityAnonymous</b>.</li>
     * <li>The caller has the <b>SeImpersonatePrivilege</b> privilege.</li>
     * <li>A process (or another process in the caller's logon session) created the token using explicit credentials through <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-logonusera">LogonUser</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsalogonuser">LsaLogonUser</a> function.</li>
     * <li>The authenticated identity is same as the caller.</li>
     * </ul>
     * <b>Windows XP with SP1 and earlier:  </b>The <b>SeImpersonatePrivilege</b> privilege is not supported.
     * 
     * For more information about impersonation, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/client-impersonation">Client Impersonation</a>.
     * @param {HANDLE} hToken A handle to a primary or impersonation <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access token</a> that represents a logged-on user. This can be a token handle returned by a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-logonusera">LogonUser</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-createrestrictedtoken">CreateRestrictedToken</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-duplicatetoken">DuplicateToken</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-duplicatetokenex">DuplicateTokenEx</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-openprocesstoken">OpenProcessToken</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-openthreadtoken">OpenThreadToken</a> functions. If <i>hToken</i> is a handle to a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">primary token</a>, the token must have <b>TOKEN_QUERY</b> and <b>TOKEN_DUPLICATE</b> access. If <i>hToken</i> is a handle to an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">impersonation token</a>, the token must have <b>TOKEN_QUERY</b> and <b>TOKEN_IMPERSONATE</b> access.
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-impersonateloggedonuser
     */
    ImpersonateLoggedOnUser(hToken) {
        result := ComCall(3, this, HANDLE, hToken, "HRESULT")
        return result
    }

    /**
     * Terminates the impersonation of a client application.
     * @remarks
     * A <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">process</a> should call the <b>RevertToSelf</b> function after finishing any impersonation begun by using the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeimpersonateclient">DdeImpersonateClient</a>, <a href="https://docs.microsoft.com/windows/desktop/api/dde/nf-dde-impersonateddeclientwindow">ImpersonateDdeClientWindow</a>, <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-impersonateloggedonuser">ImpersonateLoggedOnUser</a>, <a href="https://docs.microsoft.com/windows/desktop/api/namedpipeapi/nf-namedpipeapi-impersonatenamedpipeclient">ImpersonateNamedPipeClient</a>, <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-impersonateself">ImpersonateSelf</a>, <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-impersonateanonymoustoken">ImpersonateAnonymousToken</a> or <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-setthreadtoken">SetThreadToken</a> function.
     * 
     * An RPC server that used the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcimpersonateclient">RpcImpersonateClient</a> function to impersonate a client must call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcreverttoself">RpcRevertToSelf</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcreverttoselfex">RpcRevertToSelfEx</a> to end the impersonation.
     * 
     * If <b>RevertToSelf</b> fails, your application continues to run in the context of the client, which is not appropriate. You should shut down the process if <b>RevertToSelf</b> fails.
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     *       
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-reverttoself
     */
    RevertToSelf() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Opens the access token associated with a thread.
     * @remarks
     * Tokens with the anonymous impersonation level cannot be opened.
     * 
     * Close the access token handle returned through the <i>TokenHandle</i> parameter by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a>.
     * @param {Integer} dwDesiredAccess 
     * @param {BOOL} bOpenAsSelf 
     * @returns {HANDLE} 
     * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-openthreadtoken
     */
    OpenThreadToken(dwDesiredAccess, bOpenAsSelf) {
        phThreadToken := HANDLE.Owned()
        result := ComCall(5, this, "uint", dwDesiredAccess, BOOL, bOpenAsSelf, HANDLE.Ptr, phThreadToken, "HRESULT")
        return phThreadToken
    }

    /**
     * Assigns an impersonation token to a thread. The function can also cause a thread to stop using an impersonation token.
     * @remarks
     * When using the <b>SetThreadToken</b> function to impersonate, you must have the impersonate  privileges and make sure that the <b>SetThreadToken</b> function succeeds before calling the <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-reverttoself">RevertToSelf</a> function.
     * @param {HANDLE} hToken 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-setthreadtoken
     */
    SetThreadToken(hToken) {
        result := ComCall(6, this, HANDLE, hToken, "HRESULT")
        return result
    }

    /**
     * 
     * @param {EContextType} _eContextType 
     * @returns {IHostSecurityContext} 
     */
    GetSecurityContext(_eContextType) {
        result := ComCall(7, this, EContextType, _eContextType, "ptr*", &ppSecurityContext := 0, "HRESULT")
        return IHostSecurityContext(ppSecurityContext)
    }

    /**
     * 
     * @param {EContextType} _eContextType 
     * @param {IHostSecurityContext} pSecurityContext 
     * @returns {HRESULT} 
     */
    SetSecurityContext(_eContextType, pSecurityContext) {
        result := ComCall(8, this, EContextType, _eContextType, "ptr", pSecurityContext, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHostSecurityManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ImpersonateLoggedOnUser := CallbackCreate(GetMethod(implObj, "ImpersonateLoggedOnUser"), flags, 2)
        this.vtbl.RevertToSelf := CallbackCreate(GetMethod(implObj, "RevertToSelf"), flags, 1)
        this.vtbl.OpenThreadToken := CallbackCreate(GetMethod(implObj, "OpenThreadToken"), flags, 4)
        this.vtbl.SetThreadToken := CallbackCreate(GetMethod(implObj, "SetThreadToken"), flags, 2)
        this.vtbl.GetSecurityContext := CallbackCreate(GetMethod(implObj, "GetSecurityContext"), flags, 3)
        this.vtbl.SetSecurityContext := CallbackCreate(GetMethod(implObj, "SetSecurityContext"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ImpersonateLoggedOnUser)
        CallbackFree(this.vtbl.RevertToSelf)
        CallbackFree(this.vtbl.OpenThreadToken)
        CallbackFree(this.vtbl.SetThreadToken)
        CallbackFree(this.vtbl.GetSecurityContext)
        CallbackFree(this.vtbl.SetSecurityContext)
    }
}
