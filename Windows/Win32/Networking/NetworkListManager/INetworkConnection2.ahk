#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\INetworkConnection.ahk

/**
 * 
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
     * 
     * @param {Integer} domainAuthenticationKind 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkconnection2-isdomainauthenticatedby
     */
    IsDomainAuthenticatedBy(domainAuthenticationKind) {
        result := ComCall(14, this, "int", domainAuthenticationKind, "int*", &pValue := 0, "HRESULT")
        return pValue
    }
}
