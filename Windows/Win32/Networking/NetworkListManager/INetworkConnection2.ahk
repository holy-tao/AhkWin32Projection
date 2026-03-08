#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\INetworkConnection.ahk

/**
 * The **INetworkConnection2** interface represents a single network connection.
 * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nn-netlistmgr-inetworkconnection2
 * @namespace Windows.Win32.Networking.NetworkListManager
 * @version v4.0.30319
 */
class INetworkConnection2 extends INetworkConnection{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetworkConnection2
     * @type {Guid}
     */
    static IID => Guid("{00e676ed-5a35-4738-92eb-8581738d0f0a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsDomainAuthenticatedBy"]

    /**
     * Queries whether the specified domain authentication method succeeded for this network connection.
     * @remarks
     * See **Remarks** for [INetwork2::IsDomainAuthenticatedBy method](nf-netlistmgr-inetwork2-isdomainauthenticatedby.md).
     * @param {Integer} domainAuthenticationKind Type: \[in\] **[NLM_DOMAIN_AUTHENTICATION_KIND](ne-netlistmgr-nlm_domain_authentication_kind.md)**
     * 
     * The specific domain authentication method to query about.
     * @returns {BOOL} Type: \[out, retval\] **[BOOL](/windows/win32/winprog/windows-data-types)\***
     * 
     * The function dereferences *pValue*, and assigns `TRUE` if this network connection has the same domain authentication kind as that specified in the *domainAuthenticationKind* parameter; or `FALSE` if this network connection has a different domain authentication kind from that specified in *domainAuthenticationKind*.
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkconnection2-isdomainauthenticatedby
     */
    IsDomainAuthenticatedBy(domainAuthenticationKind) {
        result := ComCall(14, this, "int", domainAuthenticationKind, "int*", &pValue := 0, "HRESULT")
        return pValue
    }
}
