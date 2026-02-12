#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\IHostSecurityContext.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IHostSecurityManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHostSecurityManager
     * @type {Guid}
     */
    static IID => Guid("{75ad2468-a349-4d02-a764-76a68aee0c4f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ImpersonateLoggedOnUser", "RevertToSelf", "OpenThreadToken", "SetThreadToken", "GetSecurityContext", "SetSecurityContext"]

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
     * @see https://learn.microsoft.com/windows/win32/api//content/securitybaseapi/nf-securitybaseapi-impersonateloggedonuser
     */
    ImpersonateLoggedOnUser(hToken) {
        hToken := hToken is Win32Handle ? NumGet(hToken, "ptr") : hToken

        result := ComCall(3, this, "ptr", hToken, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/securitybaseapi/nf-securitybaseapi-reverttoself
     */
    RevertToSelf() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/processthreadsapi/nf-processthreadsapi-openthreadtoken
     */
    OpenThreadToken(dwDesiredAccess, bOpenAsSelf) {
        phThreadToken := HANDLE()
        result := ComCall(5, this, "uint", dwDesiredAccess, "int", bOpenAsSelf, "ptr", phThreadToken, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/processthreadsapi/nf-processthreadsapi-setthreadtoken
     */
    SetThreadToken(hToken) {
        hToken := hToken is Win32Handle ? NumGet(hToken, "ptr") : hToken

        result := ComCall(6, this, "ptr", hToken, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} eContextType_ 
     * @returns {IHostSecurityContext} 
     */
    GetSecurityContext(eContextType_) {
        result := ComCall(7, this, "int", eContextType_, "ptr*", &ppSecurityContext := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHostSecurityContext(ppSecurityContext)
    }

    /**
     * 
     * @param {Integer} eContextType_ 
     * @param {IHostSecurityContext} pSecurityContext 
     * @returns {HRESULT} 
     */
    SetSecurityContext(eContextType_, pSecurityContext) {
        result := ComCall(8, this, "int", eContextType_, "ptr", pSecurityContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
