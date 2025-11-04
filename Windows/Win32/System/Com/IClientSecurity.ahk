#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Gives the client control over the security settings for each individual interface proxy of an object.
 * @remarks
 * 
  * Every object has one proxy manager, and every proxy manager exposes the <b>IClientSecurity</b> interface automatically. Therefore, the client can query the proxy manager of an object for <b>IClientSecurity</b>, using any interface pointer on the object. If the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> call succeeds, the <b>IClientSecurity</b> pointer can be used to call an <b>IClientSecurity</b> method, passing a pointer to the interface proxy that the client is interested in. If a call to <b>QueryInterface</b> for <b>IClientSecurity</b> fails, either the object is implemented in-process or it is remoted by a custom marshaler that does not support security. (A custom marshaler can support security by offering the <b>IClientSecurity</b> interface to the client.)
  * 
  * The interface proxies passed as parameters to <b>IClientSecurity</b> methods must be from the same object as the <b>IClientSecurity</b> interface. That is, each object has a distinct <b>IClientSecurity</b> interface; calling <b>IClientSecurity</b> on one object and passing a proxy to another object will not work. Also, you cannot pass an interface to an <b>IClientSecurity</b> method if the interface does not use a proxy. This means that interfaces implemented locally by the proxy manager cannot be passed to <b>IClientSecurity</b> methods, except for <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>, which is the exception to this rule.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-iclientsecurity
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
     * 
     * @param {IUnknown} pProxy 
     * @param {Pointer<Integer>} pAuthnSvc 
     * @param {Pointer<Integer>} pAuthzSvc 
     * @param {Pointer<Pointer<Integer>>} pServerPrincName 
     * @param {Pointer<Integer>} pAuthnLevel 
     * @param {Pointer<Integer>} pImpLevel 
     * @param {Pointer<Pointer<Void>>} pAuthInfo 
     * @param {Pointer<Integer>} pCapabilites 
     * @returns {HRESULT} 
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
     * 
     * @param {IUnknown} pProxy 
     * @param {Integer} dwAuthnSvc 
     * @param {Integer} dwAuthzSvc 
     * @param {PWSTR} pServerPrincName 
     * @param {Integer} dwAuthnLevel 
     * @param {Integer} dwImpLevel 
     * @param {Pointer<Void>} pAuthInfo 
     * @param {Integer} dwCapabilities 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-iclientsecurity-setblanket
     */
    SetBlanket(pProxy, dwAuthnSvc, dwAuthzSvc, pServerPrincName, dwAuthnLevel, dwImpLevel, pAuthInfo, dwCapabilities) {
        pServerPrincName := pServerPrincName is String ? StrPtr(pServerPrincName) : pServerPrincName

        pAuthInfoMarshal := pAuthInfo is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "ptr", pProxy, "uint", dwAuthnSvc, "uint", dwAuthzSvc, "ptr", pServerPrincName, "uint", dwAuthnLevel, "uint", dwImpLevel, pAuthInfoMarshal, pAuthInfo, "uint", dwCapabilities, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pProxy 
     * @param {Pointer<IUnknown>} ppCopy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-iclientsecurity-copyproxy
     */
    CopyProxy(pProxy, ppCopy) {
        result := ComCall(5, this, "ptr", pProxy, "ptr*", ppCopy, "HRESULT")
        return result
    }
}
