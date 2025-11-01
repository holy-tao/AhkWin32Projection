#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-impersonateloggedonuser
     */
    ImpersonateLoggedOnUser(hToken) {
        hToken := hToken is Win32Handle ? NumGet(hToken, "ptr") : hToken

        result := ComCall(3, this, "ptr", hToken, "HRESULT")
        return result
    }

    /**
     * Terminates the impersonation of a client application.
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     *       
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-reverttoself
     */
    RevertToSelf() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Opens the access token associated with a thread.
     * @param {Integer} dwDesiredAccess 
     * @param {BOOL} bOpenAsSelf 
     * @param {Pointer<HANDLE>} phThreadToken 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If the token has the anonymous impersonation level, the token will not be opened and <b>OpenThreadToken</b> sets  ERROR_CANT_OPEN_ANONYMOUS as the error.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-openthreadtoken
     */
    OpenThreadToken(dwDesiredAccess, bOpenAsSelf, phThreadToken) {
        result := ComCall(5, this, "uint", dwDesiredAccess, "int", bOpenAsSelf, "ptr", phThreadToken, "HRESULT")
        return result
    }

    /**
     * Assigns an impersonation token to a thread. The function can also cause a thread to stop using an impersonation token.
     * @param {HANDLE} hToken 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-setthreadtoken
     */
    SetThreadToken(hToken) {
        hToken := hToken is Win32Handle ? NumGet(hToken, "ptr") : hToken

        result := ComCall(6, this, "ptr", hToken, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} eContextType 
     * @param {Pointer<IHostSecurityContext>} ppSecurityContext 
     * @returns {HRESULT} 
     */
    GetSecurityContext(eContextType, ppSecurityContext) {
        result := ComCall(7, this, "int", eContextType, "ptr*", ppSecurityContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} eContextType 
     * @param {IHostSecurityContext} pSecurityContext 
     * @returns {HRESULT} 
     */
    SetSecurityContext(eContextType, pSecurityContext) {
        result := ComCall(8, this, "int", eContextType, "ptr", pSecurityContext, "HRESULT")
        return result
    }
}
