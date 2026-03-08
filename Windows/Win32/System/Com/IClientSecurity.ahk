#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Gives the client control over the security settings for each individual interface proxy of an object.
 * @remarks
 * Every object has one proxy manager, and every proxy manager exposes the <b>IClientSecurity</b> interface automatically. Therefore, the client can query the proxy manager of an object for <b>IClientSecurity</b>, using any interface pointer on the object. If the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> call succeeds, the <b>IClientSecurity</b> pointer can be used to call an <b>IClientSecurity</b> method, passing a pointer to the interface proxy that the client is interested in. If a call to <b>QueryInterface</b> for <b>IClientSecurity</b> fails, either the object is implemented in-process or it is remoted by a custom marshaler that does not support security. (A custom marshaler can support security by offering the <b>IClientSecurity</b> interface to the client.)
 * 
 * The interface proxies passed as parameters to <b>IClientSecurity</b> methods must be from the same object as the <b>IClientSecurity</b> interface. That is, each object has a distinct <b>IClientSecurity</b> interface; calling <b>IClientSecurity</b> on one object and passing a proxy to another object will not work. Also, you cannot pass an interface to an <b>IClientSecurity</b> method if the interface does not use a proxy. This means that interfaces implemented locally by the proxy manager cannot be passed to <b>IClientSecurity</b> methods, except for <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>, which is the exception to this rule.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/nn-objidl-iclientsecurity
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IClientSecurity extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IClientSecurity
     * @type {Guid}
     */
    static IID => Guid("{0000013d-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryBlanket", "SetBlanket", "CopyProxy"]

    /**
     * Retrieves authentication information the client uses to make calls on the specified proxy.
     * @remarks
     * <b>QueryBlanket</b> is called by the client to retrieve the authentication information COM will use on calls made from the specified interface proxy. With a pointer to an interface on the proxy, the client would first call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> for a pointer to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iclientsecurity">IClientSecurity</a>; then, with this pointer, the client would call <b>QueryBlanket</b>, followed by releasing the pointer. This sequence of calls is encapsulated in the helper function <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coqueryproxyblanket">CoQueryProxyBlanket</a>.
     * 
     * In <i>pProxy</i>, you pass an interface pointer. However, you cannot pass a pointer to an interface that does not use a proxy. Thus you cannot pass a pointer to an interface that has the local keyword in its interface definition since no proxy is created for such an interface. <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> is the exception to this rule.
     * @param {IUnknown} pProxy A pointer to the proxy. This parameter cannot be <b>NULL</b>. For more information, see the Remarks section.
     * @param {Pointer<Integer>} pAuthnSvc The current authentication service. This will be a single value taken from the list of <a href="https://docs.microsoft.com/windows/desktop/com/com-authentication-service-constants">authentication service constants</a>. This parameter cannot be <b>NULL</b>.
     * @param {Pointer<Integer>} pAuthzSvc The current authorization service. This will be a single value taken from the list of <a href="https://docs.microsoft.com/windows/desktop/com/com-authorization-constants">authorization constants</a>. This parameter cannot be <b>NULL</b>.
     * @param {Pointer<Pointer<Integer>>} pServerPrincName The current principal name. The string will be allocated by the callee using the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> function and must be freed by the caller using the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function. Note that the actual principal name is returned. The EOAC_MAKE_FULLSIC flag is not accepted to convert the prinicpal name. If the caller specifies <b>NULL</b>, the current principal name is not retrieved.
     * @param {Pointer<Integer>} pAuthnLevel The current authentication level. This will be a single value taken from the list of <a href="https://docs.microsoft.com/windows/desktop/com/com-authentication-level-constants">authentication level constants</a>. If this parameter is <b>NULL</b>, the current authentication level is not retrieved.
     * @param {Pointer<Integer>} pImpLevel The current impersonation level. This will be a single value taken from the list of <a href="https://docs.microsoft.com/windows/desktop/com/com-impersonation-level-constants">impersonation level constants</a>. If this parameter is <b>NULL</b>, the current impersonation level is not retrieved.
     * @param {Pointer<Pointer<Void>>} pAuthInfo A pointer to a handle indicating the identity of the client that was passed to the last <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iclientsecurity-setblanket">IClientSecurity::SetBlanket</a> call (or the default value). Default values are only valid until the proxy is released. If the caller specifies <b>NULL</b>, the client identity is not retrieved. 
     * 
     * The format of the structure that the returned handle refers to depends on the authentication service. For NTLMSSP and Kerberos, if the client specified a structure in the <i>pAuthInfo</i> parameter to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializesecurity">CoInitializeSecurity</a>, that value is returned. For Schannel, if a certificate for the client could be retrieved from the certificate manager, that value is returned here. Otherwise, <b>NULL</b> is returned. Because this points to the value itself and is not a copy, it should not be manipulated or freed.
     * @param {Pointer<Integer>} pCapabilites The capabilities of the proxy. These flags are defined in the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-eole_authentication_capabilities">EOLE_AUTHENTICATION_CAPABILITIES</a> enumeration. If this parameter is <b>NULL</b>, the current capability flags are not retrieved.
     * @returns {HRESULT} This method can return the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is insufficient memory to create the <i>pServerPrincName</i> buffer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-iclientsecurity-queryblanket
     */
    QueryBlanket(pProxy, pAuthnSvc, pAuthzSvc, pServerPrincName, pAuthnLevel, pImpLevel, pAuthInfo, pCapabilites) {
        pAuthnSvcMarshal := pAuthnSvc is VarRef ? "uint*" : "ptr"
        pAuthzSvcMarshal := pAuthzSvc is VarRef ? "uint*" : "ptr"
        pServerPrincNameMarshal := pServerPrincName is VarRef ? "ptr*" : "ptr"
        pAuthnLevelMarshal := pAuthnLevel is VarRef ? "uint*" : "ptr"
        pImpLevelMarshal := pImpLevel is VarRef ? "uint*" : "ptr"
        pAuthInfoMarshal := pAuthInfo is VarRef ? "ptr*" : "ptr"
        pCapabilitesMarshal := pCapabilites is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pProxy, pAuthnSvcMarshal, pAuthnSvc, pAuthzSvcMarshal, pAuthzSvc, pServerPrincNameMarshal, pServerPrincName, pAuthnLevelMarshal, pAuthnLevel, pImpLevelMarshal, pImpLevel, pAuthInfoMarshal, pAuthInfo, pCapabilitesMarshal, pCapabilites, "HRESULT")
        return result
    }

    /**
     * Sets the authentication information (the security blanket) that will be used to make calls on the specified proxy.
     * @remarks
     * <b>SetBlanket</b> sets the authentication information that will be used to make calls on the specified interface proxy. The values specified here override the values chosen by automatic security. Calling this method changes the security values for all other users of the specified proxy. If you want the changes to apply only to a particular instance of a proxy, call <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iclientsecurity-copyproxy">IClientSecurity::CopyProxy</a> to make a private copy of the proxy and then call <b>SetBlanket</b> on the copy.
     * 
     * Whenever this method is called, DCOM will set the identity on the proxy, and future calls made using this proxy will use this identity. Calls in progress when <b>SetBlanket</b> is called will use the authentication information on the proxy at the time the call was started. If <i>pAuthInfo</i> is <b>NULL</b>, the proxy identity defaults to the current process token (unless an authentication identity was specified on a call to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializesecurity">CoInitializeSecurity</a>). See <a href="https://docs.microsoft.com/windows/desktop/com/cloaking">Cloaking</a> to learn how the cloaking flags affect the proxy when <i>pAuthInfo</i> is <b>NULL</b>.
     * 
     * By default, COM will choose the first available authentication service and authorization service available on both the client and server computers and the principal name that the server registered for that authentication service. Currently, COM will not try another authentication service if the first fails.
     * 
     * When the default constant for <i>dwImpLevel</i> is specified in <b>SetBlanket</b>, the parameter defaults to the value specified to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializesecurity">CoInitializeSecurity</a>. If <b>CoInitializeSecurity</b> is not called, it defaults to RPC_C_IMP_LEVEL_IDENTIFY.
     * 
     * The initial value for dwAuthnLevel on a proxy will be the higher of the value set on the client's call to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializesecurity">CoInitializeSecurity</a> and the server's call to <b>CoInitializeSecurity</b>. For any process that did not call <b>CoInitializeSecurity</b>, the default authentication level is RPC_C_AUTHN_CONNECT.
     * 
     * The default authentication and impersonation level for processes that do not call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializesecurity">CoInitializeSecurity</a> can be set with DCOMCNFG.
     * 
     * If EOAC_DEFAULT is specified for <i>dwCapabilities</i>, the valid capabilities from <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializesecurity">CoInitializeSecurity</a> will be used. If <b>CoInitializeSecurity</b> was not called, EOAC_NONE will be used for the capabilities flag.
     * 
     * If <b>SetBlanket</b> is called simultaneously on two threads on the same proxy, only one set of changes will be applied. If <b>SetBlanket</b> and <b>CRpcOptions::Set</b> are called simultaneously on two threads on the same proxy, both changes may be applied or only one may be applied.
     * 
     * Security information cannot be set on local interfaces such as the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iclientsecurity">IClientSecurity</a> interface. However, since that interface is only supported locally, there is no need for security. <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imultiqi">IMultiQI</a> are special cases. The location implementation makes remote calls to support these interfaces. <b>SetBlanket</b> can be used for <b>IUnknown</b>. <b>IMultiQI</b> will use the security settings on <b>IUnknown</b>.
     * 
     * To change one <b>SetBlanket</b> parameter without having to deal with the others, one can specify the default constants for the other parameters. Applications can change a parameter (such as the authentication level) and ignore the other parameters, including the authentication service, by setting all other parameters to the default constants.
     * 
     * Note that it is important to set all unused parameters to the default constants because the default value is often not obvious. In particular, if you set the authentication service to the default, you should set the authentication information and principal name to the default. The reasons for this are twofold: First, the type of the authentication information depends on the authentication service DCOM chooses. Second, because DCOM needs to pass some complex authentication information for certain authentication services, if you set the authentication service to default and the authentication information to <b>NULL</b>, you might get a security setting that will not work.
     * @param {IUnknown} pProxy A pointer to the proxy.
     * @param {Integer} dwAuthnSvc The authentication service. This will be a single value taken from the list of <a href="https://docs.microsoft.com/windows/desktop/com/com-authentication-service-constants">authentication service constants</a>. If no authentication is required, use RPC_C_AUTHN_NONE. If RPC_C_AUTHN_DEFAULT is specified, COM will pick an authentication service following its normal security blanket negotiation algorithm.
     * @param {Integer} dwAuthzSvc The authorization service. This will be a single value taken from the list of <a href="https://docs.microsoft.com/windows/desktop/com/com-authorization-constants">authorization constants</a>. If RPC_C_AUTHZ_DEFAULT is specified, COM will pick an authorization service following its normal security blanket negotiation algorithm. If NTLMSSP, Kerberos, or Schannel is used as the authentication service, RPC_C_AUTHZ_NONE should be used as the authorization service.
     * @param {PWSTR} pServerPrincName The server principal name. If COLE_DEFAULT_PRINCIPAL is specified, DCOM will pick a principal name using its security blanket negotiation algorithm. If Kerberos is used as the authentication service, this parameter must be the correct principal name of the server or the call will fail.
     * 
     * If Schannel is used as the authentication service, this value must be one of the msstd or fullsic forms described in <a href="https://docs.microsoft.com/windows/desktop/Rpc/principal-names">Principal Names</a>, or <b>NULL</b> if you do not want mutual authentication.
     * 
     * Generally, specifying <b>NULL</b> will not reset server principal name on the proxy, rather, the previous setting will be retained. You must exercise care when using <b>NULL</b> as <i>pServerPrincName</i> when selecting a different authentication service for the proxy, because there is no guarantee that the previously set principal name would be valid for the newly selected authentication service.
     * @param {Integer} dwAuthnLevel The authentication level. This will be a single value taken from the list of <a href="https://docs.microsoft.com/windows/desktop/com/com-authentication-level-constants">authentication level constants</a>. If RPC_C_AUTHN_LEVEL_DEFAULT is specified, COM will pick an authentication level following its normal security blanket negotiation algorithm. If this value is set to RPC_C_AUTHN_LEVEL_NONE, the authentication service must be RPC_C_AUTHN_NONE. Each authentication service may choose to use a higher security authentication level than the one specified.
     * @param {Integer} dwImpLevel The impersonation level. This will be a single value taken from the list of <a href="https://docs.microsoft.com/windows/desktop/com/com-impersonation-level-constants">impersonation level constants</a>. If RPC_C_IMP_LEVEL_DEFAULT is specified, COM will pick an impersonation level following its normal security blanket negotiation algorithm. If you are using NTLMSSP remotely, this value must be RPC_C_IMP_LEVEL_IMPERSONATE or RPC_C_IMP_LEVEL_IDENTIFY. When using NTLMSSP on the same computer, RPC_C_IMP_LEVEL_DELEGATE is also supported. For Kerberos, this value can be RPC_C_IMP_LEVEL_IDENTIFY, RPC_C_IMP_LEVEL_IMPERSONATE, or RPC_C_IMP_LEVEL_DELEGATE. For Schannel, this value must be RPC_C_IMP_LEVEL_IMPERSONATE.
     * @param {Pointer<Void>} pAuthInfo An RPC_AUTH_IDENTITY_HANDLE value that indicates the identity of the client. This parameter is not used for calls on the same computer. If <i>pAuthInfo</i> is <b>NULL</b>, COM uses the current proxy identity, which is either the process token, the impersonation token, or the authentication identity from the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializesecurity">CoInitializeSecurity</a> function. If the handle is not <b>NULL</b>, that identity is used. The format of the structure referred to by the handle depends on the provider of the authentication service.
     * 
     * For NTLMSSP or Kerberos, the structure is a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY</a> or <a href="https://docs.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_winnt_auth_identity_ex2">SEC_WINNT_AUTH_IDENTITY_EX</a> structure. If the client obtains the credentials set on the proxy by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coqueryproxyblanket">CoQueryProxyBlanket</a>, it must ensure that the memory remains valid and unchanged until a different identity is set on the proxy or all proxies on the object are released.
     * 
     * If this parameter is <b>NULL</b>, COM uses the current proxy identity (which is either the process token or the impersonation token). If the handle refers to a structure, that identity is used.
     * 
     * For Schannel, this parameter must either be a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that contains the client's X.509 certificate, or <b>NULL</b> if the client wishes to make an anonymous connection to the server. If a certificate is specified, the caller must not free it as long as any proxy to the object exists in the current apartment.
     * 
     * For Snego, this member is either <b>NULL</b>, points to a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY</a> structure, or points to a <a href="https://docs.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_winnt_auth_identity_ex2">SEC_WINNT_AUTH_IDENTITY_EX</a> structure. If it is <b>NULL</b>, Snego will pick a list of authentication services based on those available on the client computer. If it points to a <b>SEC_WINNT_AUTH_IDENTITY_EX</b> structure, the structure's <b>PackageList</b> member must point to a string containing a comma-separated list of authentication service names and the <b>PackageListLength</b> member must give the number of bytes in the <b>PackageList</b> string. If <b>PackageList</b> is <b>NULL</b>, all calls using Snego will fail.
     * 
     * If COLE_DEFAULT_AUTHINFO is specified, COM will pick the authentication information following its normal security blanket negotiation algorithm.
     * 
     * <b>SetBlanket</b> will return an error if both <i>pAuthInfo</i> is set and one of the cloaking flags is set in <i>dwCapabilities</i>.
     * @param {Integer} dwCapabilities The capabilities of this proxy. Capability flags are defined in the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-eole_authentication_capabilities">EOLE_AUTHENTICATION_CAPABILITIES</a> enumeration. The only flags that can be set through this method are EOAC_MUTUAL_AUTH, EOAC_STATIC_CLOAKING, EOAC_DYNAMIC_CLOAKING, EOAC_ANY_AUTHORITY (this flag is deprecated), EOAC_MAKE_FULLSIC, and EOAC_DEFAULT. Either EOAC_STATIC_CLOAKING or EOAC_DYNAMIC_CLOAKING can be set if <i>pAuthInfo</i> is not set and Schannel is not the authentication service. (See <a href="https://docs.microsoft.com/windows/desktop/com/cloaking">Cloaking</a> for more information.) If any capability flags other than those mentioned here are indicated, <b>SetBlanket</b> will return an error.
     * @returns {HRESULT} This method can return the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-iclientsecurity-setblanket
     */
    SetBlanket(pProxy, dwAuthnSvc, dwAuthzSvc, pServerPrincName, dwAuthnLevel, dwImpLevel, pAuthInfo, dwCapabilities) {
        pServerPrincName := pServerPrincName is String ? StrPtr(pServerPrincName) : pServerPrincName

        pAuthInfoMarshal := pAuthInfo is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "ptr", pProxy, "uint", dwAuthnSvc, "uint", dwAuthzSvc, "ptr", pServerPrincName, "uint", dwAuthnLevel, "uint", dwImpLevel, pAuthInfoMarshal, pAuthInfo, "uint", dwCapabilities, "HRESULT")
        return result
    }

    /**
     * Makes a private copy of the proxy for the specified interface.
     * @remarks
     * <b>CopyProxy</b> is called by the client to make a private copy of the proxy for the specified interface. The proxy copy has default values for the authentication information. Its authentication information can be changed through a call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iclientsecurity-setblanket">IClientSecurity::SetBlanket</a> without affecting any other clients of the original proxy. The copy has one reference, and the caller of <b>CopyProxy</b> must ensure that the proxy copy gets freed.
     * 
     * Local interfaces, such as <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iclientsecurity">IClientSecurity</a>, cannot be copied. You cannot duplicate a proxy manager using <b>CopyProxy</b>.
     * 
     * Copies of the same proxy have a special relationship with respect to <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a>. Given a proxy, a, of the IA interface of a remote object, suppose a copy of a is created, called b. In this case, calling <b>QueryInterface</b> from the b proxy for IID_IA will not retrieve the IA interface on b, but the one on a, the original proxy.
     * 
     * Notice that anyone can query for a proxy and change security on it using <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iclientsecurity-setblanket">SetBlanket</a>. However, when you have made a copy of a proxy, no one can get the copy unless you give it to them. Only people who have the copy can set security on it.
     * 
     * The helper function <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocopyproxy">CoCopyProxy</a> encapsulates a <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> call for a pointer to IClientSecurity, a call to <b>CopyProxy</b> with the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iclientsecurity">IClientSecurity</a> pointer, and the release of the <b>IClientSecurity</b> pointer.
     * @param {IUnknown} pProxy A pointer to the interface whose proxy is to be copied. This parameter cannot be <b>NULL</b>.
     * @returns {IUnknown} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface pointer that receives the copy of the proxy. This parameter cannot be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-iclientsecurity-copyproxy
     */
    CopyProxy(pProxy) {
        result := ComCall(5, this, "ptr", pProxy, "ptr*", &ppCopy := 0, "HRESULT")
        return IUnknown(ppCopy)
    }
}
