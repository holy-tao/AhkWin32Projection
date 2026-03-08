#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * The IServerSecurity (objidlbase.h) interface is used by a server to help authenticate the client and to manage impersonation of the client.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nn-objidlbase-iserversecurity
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IServerSecurity extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IServerSecurity
     * @type {Guid}
     */
    static IID => Guid("{0000013e-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryBlanket", "ImpersonateClient", "RevertToSelf", "IsImpersonating"]

    /**
     * The IServerSecurity::QueryBlanket (objidlbase.h) method retrieves information about the client that invoked one of the server's methods.
     * @remarks
     * <b>QueryBlanket</b> is used by the server to find out about the client that invoked one of its methods. To get a pointer to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iserversecurity">IServerSecurity</a> for the current call on the current thread, call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cogetcallcontext">CoGetCallContext</a>, specifying IID_IServerSecurity. This interface pointer may only be used in the same apartment as the call for the duration of the call.
     * @param {Pointer<Integer>} pAuthnSvc A pointer to the current authentication service. This will be a single value taken from the list of <a href="https://docs.microsoft.com/windows/desktop/com/com-authentication-service-constants">authentication service constants</a>. If the caller specifies <b>NULL</b>, the current authentication service is not retrieved.
     * @param {Pointer<Integer>} pAuthzSvc A pointer to a variable that receives the current authorization service. This will be a single value from the list of <a href="https://docs.microsoft.com/windows/desktop/com/com-authorization-constants">authorization constants</a>. If the caller specifies <b>NULL</b>, the current authorization service is not retrieved.
     * @param {Pointer<Pointer<Integer>>} pServerPrincName The current principal name. The string will be allocated by the callee using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>, and must be freed by the caller using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>. By default, Schannel principal names will be in the msstd form. The fullsic form will be returned if EOAC_MAKE_FULLSIC is specified in the <i>pCapabilities</i> parameter. For more information on the msstd and fullsic forms, see <a href="https://docs.microsoft.com/windows/desktop/Rpc/principal-names">Principal Names</a>. If the caller specifies <b>NULL</b>, the current principal name is not retrieved.
     * @param {Pointer<Integer>} pAuthnLevel A pointer to a variable that receives the current authentication level. This will be a single value taken from the list of <a href="https://docs.microsoft.com/windows/desktop/com/com-authentication-level-constants">authentication level constants</a>. If the caller specifies <b>NULL</b>, the current authentication level is not retrieved.
     * @param {Pointer<Integer>} pImpLevel This parameter must be <b>NULL</b>.
     * @param {Pointer<Pointer<Void>>} pPrivs The privilege information for the client application. The format of the structure that the handle refers to depends on the authentication service. The application should not write or free the memory. The information is only valid for the duration of the current call. For NTLMSSP, and Kerberos, this is a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY</a> or <a href="https://docs.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_winnt_auth_identity_ex2">SEC_WINNT_AUTH_IDENTITY_EX</a> structure. For Schannel, this is a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that represents the client's certificate. If the client has no certificate, <b>NULL</b> is returned. If the caller specifies <b>NULL</b>, the current privilege information is not retrieved.
     * @param {Pointer<Integer>} pCapabilities The capabilities of the call. To request that the principal name be returned in fullsic form if Schannel is the authentication service, the caller can set the EOAC_MAKE_FULLSIC flag in this parameter. If the caller specifies <b>NULL</b>, the current capabilities are not retrieved.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-iserversecurity-queryblanket
     */
    QueryBlanket(pAuthnSvc, pAuthzSvc, pServerPrincName, pAuthnLevel, pImpLevel, pPrivs, pCapabilities) {
        pAuthnSvcMarshal := pAuthnSvc is VarRef ? "uint*" : "ptr"
        pAuthzSvcMarshal := pAuthzSvc is VarRef ? "uint*" : "ptr"
        pServerPrincNameMarshal := pServerPrincName is VarRef ? "ptr*" : "ptr"
        pAuthnLevelMarshal := pAuthnLevel is VarRef ? "uint*" : "ptr"
        pImpLevelMarshal := pImpLevel is VarRef ? "uint*" : "ptr"
        pPrivsMarshal := pPrivs is VarRef ? "ptr*" : "ptr"
        pCapabilitiesMarshal := pCapabilities is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pAuthnSvcMarshal, pAuthnSvc, pAuthzSvcMarshal, pAuthzSvc, pServerPrincNameMarshal, pServerPrincName, pAuthnLevelMarshal, pAuthnLevel, pImpLevelMarshal, pImpLevel, pPrivsMarshal, pPrivs, pCapabilitiesMarshal, pCapabilities, "HRESULT")
        return result
    }

    /**
     * The IServerSecurity::ImpersonateClient (objidlbase.h) method enables a server to impersonate a client for the duration of a call.
     * @remarks
     * Usually, a method executes on a thread that uses the access token of the process. However, when impersonating a client, the server runs in the client's security context so that the server has access to the resources that the client has access to. When impersonation is necessary, the server calls the <b>ImpersonateClient</b> method to cause an access token representing the client's credentials to be assigned to the current thread. This thread token is used for access checks. <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iserversecurity-reverttoself">RevertToSelf</a> restores the current thread's access token.
     * 
     * What the server can do on behalf of the client depends on the impersonation level set by the client, which is specified using one of the <a href="https://docs.microsoft.com/windows/desktop/com/com-impersonation-level-constants">impersonation level constants</a>. The server may impersonate the client on an encrypted call at identify, impersonate, or delegate level. For information about these levels of impersonation, see <a href="https://docs.microsoft.com/windows/desktop/com/impersonation-levels">Impersonation Levels</a>.
     * 
     * The identity presented to a server called during impersonation depends on the type of cloaking value, if any, that is set by the client. For more information, see <a href="https://docs.microsoft.com/windows/desktop/com/cloaking">Cloaking</a>.
     * 
     * At the end of each method call, COM will call <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iserversecurity-reverttoself">RevertToSelf</a> if the application does not.
     * 
     * Traditionally, impersonation information is not nested: The last call to any impersonation mechanism overrides any previous impersonation. However, in the apartment model, impersonation is maintained during nested calls. Thus if the server A receives a call from B, impersonates, calls C, receives a call from D, impersonates, reverts, and receives the reply from C, the impersonation token will be set back to B, not A.
     * 
     * For information on using impersonation with asynchronous calls, see <a href="https://docs.microsoft.com/windows/desktop/com/impersonation-and-asynchronous-calls">Impersonation and Asynchronous Calls</a>.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, it is E_FAIL.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-iserversecurity-impersonateclient
     */
    ImpersonateClient() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * The IServerSecurity::RevertToSelf (objidlbase.h) method restores the authentication information of a thread to what it was before impersonation began.
     * @remarks
     * <b>RevertToSelf</b> restores the authentication information on a thread to the authentication information on the thread before impersonation began. If the server does not call <b>RevertToSelf</b> before the end of the current call, it will be called automatically by COM.
     * 
     * When <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iserversecurity-impersonateclient">ImpersonateClient</a> is called on a thread that is not currently impersonating, COM saves the token currently on the thread. A subsequent call to <b>RevertToSelf</b> restores the saved token, and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iserversecurity-isimpersonating">IsImpersonating</a> will then return <b>FALSE</b>. This means that if a series of impersonation calls are made using different <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iserversecurity">IServerSecurity</a> objects, <b>RevertToSelf</b> will restore the token that was on the thread when the first call to <b>ImpersonateClient</b> was made. Also, only one <b>RevertToSelf</b> call is needed to undo any number of <b>ImpersonateClient</b> calls.
     * 
     * This method will only revert impersonation changes made by <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iserversecurity-impersonateclient">ImpersonateClient</a>. If the thread token is modified by other means (through the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-setthreadtoken">SetThreadToken</a> or <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcimpersonateclient">RpcImpersonateClient</a> functions) the result of this function is undefined.
     * 
     * <b>RevertToSelf</b> affects only the current method invocation. If there are nested method invocations, each invocation can have its own impersonation token and DCOM will correctly restore the impersonation token before returning to them (regardless of whether <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coreverttoself">CoRevertToSelf</a> or <b>RevertToSelf</b> was called).
     * 
     * It is important to understand that an instance of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iserversecurity">IServerSecurity</a> is valid on any thread in the apartment until the call represented by <b>IServerSecurity</b> completes. However, impersonation is local to a particular thread for the duration of the current call on that thread. Therefore, if two threads in the same apartment use the same <b>IServerSecurity</b> instance to call <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iserversecurity-impersonateclient">ImpersonateClient</a>, one thread can call <b>RevertToSelf</b> without affecting the other.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, it is E_FAIL.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-iserversecurity-reverttoself
     */
    RevertToSelf() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The IServerSecurity::IsImpersonating (objidlbase.h) method indicates whether the server is currently impersonating the client.
     * @returns {BOOL} If the thread is currently impersonating, the return value is <b>TRUE</b>. Otherwise, it is <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-iserversecurity-isimpersonating
     */
    IsImpersonating() {
        result := ComCall(6, this, "int")
        return result
    }
}
