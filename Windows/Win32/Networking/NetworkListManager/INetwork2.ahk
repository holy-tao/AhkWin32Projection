#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\INetwork.ahk" { INetwork }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\NLM_DOMAIN_AUTHENTICATION_KIND.ahk" { NLM_DOMAIN_AUTHENTICATION_KIND }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The **INetwork2** interface represents a network on the local machine. It can also represent a collection of network connections with a similar network signature.
 * @remarks
 * See **Remarks** for [INetwork](nn-netlistmgr-inetwork.md).
 * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nn-netlistmgr-inetwork2
 * @namespace Windows.Win32.Networking.NetworkListManager
 */
export default struct INetwork2 extends INetwork {
    /**
     * The interface identifier for INetwork2
     * @type {Guid}
     */
    static IID := Guid("{b5550abb-3391-4310-804f-25dcc325ed81}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetwork2 interfaces
    */
    struct Vtbl extends INetwork.Vtbl {
        IsDomainAuthenticatedBy : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetwork2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Queries whether the specified domain authentication method succeeded for this network.
     * @param {NLM_DOMAIN_AUTHENTICATION_KIND} domainAuthenticationKind Type: \[in\] **[NLM_DOMAIN_AUTHENTICATION_KIND](ne-netlistmgr-nlm_domain_authentication_kind.md)**
     * 
     * The specific domain authentication method to query about.
     * @returns {BOOL} Type: \[out, retval\] **[BOOL](/windows/win32/winprog/windows-data-types)\***
     * 
     * The function dereferences *pValue*, and assigns `TRUE` if this network has the same domain authentication kind as that specified in the *domainAuthenticationKind* parameter; or `FALSE` if this network has a different domain authentication kind from that specified in *domainAuthenticationKind*.
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetwork2-isdomainauthenticatedby
     */
    IsDomainAuthenticatedBy(domainAuthenticationKind) {
        result := ComCall(20, this, NLM_DOMAIN_AUTHENTICATION_KIND, domainAuthenticationKind, BOOL.Ptr, &pValue := 0, "HRESULT")
        return pValue
    }

    Query(iid) {
        if (INetwork2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsDomainAuthenticatedBy := CallbackCreate(GetMethod(implObj, "IsDomainAuthenticatedBy"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsDomainAuthenticatedBy)
    }
}
