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
     * 
     * @param {Pointer<Integer>} pAuthnSvc 
     * @param {Pointer<Integer>} pAuthzSvc 
     * @param {Pointer<Pointer<Integer>>} pServerPrincName 
     * @param {Pointer<Integer>} pAuthnLevel 
     * @param {Pointer<Integer>} pImpLevel 
     * @param {Pointer<Pointer<Void>>} pPrivs 
     * @param {Pointer<Integer>} pCapabilities 
     * @returns {HRESULT} 
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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-iserversecurity-impersonateclient
     */
    ImpersonateClient() {
        result := ComCall(4, this, "HRESULT")
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
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-iserversecurity-isimpersonating
     */
    IsImpersonating() {
        result := ComCall(6, this, "int")
        return result
    }
}
