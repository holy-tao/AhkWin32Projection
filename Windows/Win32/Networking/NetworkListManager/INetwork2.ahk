#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\INetwork.ahk

/**
 * The **INetwork2** interface represents a network on the local machine. It can also represent a collection of network connections with a similar network signature.
 * @remarks
 * See **Remarks** for [INetwork](nn-netlistmgr-inetwork.md).
 * @see https://learn.microsoft.com/windows/win32/api//content/netlistmgr/nn-netlistmgr-inetwork2
 * @namespace Windows.Win32.Networking.NetworkListManager
 * @version v4.0.30319
 */
class INetwork2 extends INetwork{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetwork2
     * @type {Guid}
     */
    static IID => Guid("{b5550abb-3391-4310-804f-25dcc325ed81}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsDomainAuthenticatedBy"]

    /**
     * Queries whether the specified domain authentication method succeeded for this network.
     * @param {Integer} domainAuthenticationKind Type: \[in\] **[NLM_DOMAIN_AUTHENTICATION_KIND](ne-netlistmgr-nlm_domain_authentication_kind.md)**
     * 
     * The specific domain authentication method to query about.
     * @returns {BOOL} Type: \[out, retval\] **[BOOL](/windows/win32/winprog/windows-data-types)\***
     * 
     * The function dereferences *pValue*, and assigns `TRUE` if this network has the same domain authentication kind as that specified in the *domainAuthenticationKind* parameter; or `FALSE` if this network has a different domain authentication kind from that specified in *domainAuthenticationKind*.
     * @see https://learn.microsoft.com/windows/win32/api//content/netlistmgr/nf-netlistmgr-inetwork2-isdomainauthenticatedby
     */
    IsDomainAuthenticatedBy(domainAuthenticationKind) {
        result := ComCall(20, this, "int", domainAuthenticationKind, "int*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }
}
