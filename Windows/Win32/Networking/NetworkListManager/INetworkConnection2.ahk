#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\NLM_DOMAIN_AUTHENTICATION_KIND.ahk" { NLM_DOMAIN_AUTHENTICATION_KIND }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\INetworkConnection.ahk" { INetworkConnection }

/**
 * The **INetworkConnection2** interface represents a single network connection.
 * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nn-netlistmgr-inetworkconnection2
 * @namespace Windows.Win32.Networking.NetworkListManager
 */
export default struct INetworkConnection2 extends INetworkConnection {
    /**
     * The interface identifier for INetworkConnection2
     * @type {Guid}
     */
    static IID := Guid("{00e676ed-5a35-4738-92eb-8581738d0f0a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetworkConnection2 interfaces
    */
    struct Vtbl extends INetworkConnection.Vtbl {
        IsDomainAuthenticatedBy : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetworkConnection2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Queries whether the specified domain authentication method succeeded for this network connection.
     * @remarks
     * See **Remarks** for [INetwork2::IsDomainAuthenticatedBy method](nf-netlistmgr-inetwork2-isdomainauthenticatedby.md).
     * @param {NLM_DOMAIN_AUTHENTICATION_KIND} domainAuthenticationKind Type: \[in\] **[NLM_DOMAIN_AUTHENTICATION_KIND](ne-netlistmgr-nlm_domain_authentication_kind.md)**
     * 
     * The specific domain authentication method to query about.
     * @returns {BOOL} Type: \[out, retval\] **[BOOL](/windows/win32/winprog/windows-data-types)\***
     * 
     * The function dereferences *pValue*, and assigns `TRUE` if this network connection has the same domain authentication kind as that specified in the *domainAuthenticationKind* parameter; or `FALSE` if this network connection has a different domain authentication kind from that specified in *domainAuthenticationKind*.
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkconnection2-isdomainauthenticatedby
     */
    IsDomainAuthenticatedBy(domainAuthenticationKind) {
        result := ComCall(14, this, NLM_DOMAIN_AUTHENTICATION_KIND, domainAuthenticationKind, BOOL.Ptr, &pValue := 0, "HRESULT")
        return pValue
    }

    Query(iid) {
        if (INetworkConnection2.IID.Equals(iid)) {
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
