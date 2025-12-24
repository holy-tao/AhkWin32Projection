#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Used by a server to help authenticate the client and to manage impersonation of the client.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-iserversecurity
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
     * Retrieves information about the client that invoked one of the server's methods.
     * @param {Pointer<Integer>} pAuthnSvc A pointer to the current authentication service. This will be a single value taken from the list of <a href="https://docs.microsoft.com/windows/desktop/com/com-authentication-service-constants">authentication service constants</a>. If the caller specifies <b>NULL</b>, the current authentication service is not retrieved.
     * @param {Pointer<Integer>} pAuthzSvc A pointer to a variable that receives the current authorization service. This will be a single value from the list of <a href="https://docs.microsoft.com/windows/desktop/com/com-authorization-constants">authorization constants</a>. If the caller specifies <b>NULL</b>, the current authorization service is not retrieved.
     * @param {Pointer<Pointer<Integer>>} pServerPrincName The current principal name. The string will be allocated by the callee using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>, and must be freed by the caller using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>. By default, Schannel principal names will be in the msstd form. The fullsic form will be returned if EOAC_MAKE_FULLSIC is specified in the <i>pCapabilities</i> parameter. For more information on the msstd and fullsic forms, see <a href="https://docs.microsoft.com/windows/desktop/Rpc/principal-names">Principal Names</a>. If the caller specifies <b>NULL</b>, the current principal name is not retrieved.
     * @param {Pointer<Integer>} pAuthnLevel A pointer to a variable that receives the current authentication level. This will be a single value taken from the list of <a href="https://docs.microsoft.com/windows/desktop/com/com-authentication-level-constants">authentication level constants</a>. If the caller specifies <b>NULL</b>, the current authentication level is not retrieved.
     * @param {Pointer<Integer>} pImpLevel This parameter must be <b>NULL</b>.
     * @param {Pointer<Pointer<Void>>} pPrivs The privilege information for the client application. The format of the structure that the handle refers to depends on the authentication service. The application should not write or free the memory. The information is only valid for the duration of the current call. For NTLMSSP, and Kerberos, this is a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY</a> or <a href="https://docs.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_winnt_auth_identity_ex2">SEC_WINNT_AUTH_IDENTITY_EX</a> structure. For Schannel, this is a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that represents the client's certificate. If the client has no certificate, <b>NULL</b> is returned. If the caller specifies <b>NULL</b>, the current privilege information is not retrieved.
     * @param {Pointer<Integer>} pCapabilities The capabilities of the call. To request that the principal name be returned in fullsic form if Schannel is the authentication service, the caller can set the EOAC_MAKE_FULLSIC flag in this parameter. If the caller specifies <b>NULL</b>, the current capabilities are not retrieved.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-iserversecurity-queryblanket
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
     * Enables a server to impersonate a client for the duration of a call.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, it is E_FAIL.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-iserversecurity-impersonateclient
     */
    ImpersonateClient() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Restores the authentication information of a thread to what it was before impersonation began.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, it is E_FAIL.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-iserversecurity-reverttoself
     */
    RevertToSelf() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Indicates whether the server is currently impersonating the client.
     * @returns {BOOL} If the thread is currently impersonating, the return value is <b>TRUE</b>. Otherwise, it is <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-iserversecurity-isimpersonating
     */
    IsImpersonating() {
        result := ComCall(6, this, "int")
        return result
    }
}
