#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\INetwork.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nn-netlistmgr-inetwork2
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
     * 
     * @param {Integer} domainAuthenticationKind 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetwork2-isdomainauthenticatedby
     */
    IsDomainAuthenticatedBy(domainAuthenticationKind) {
        result := ComCall(20, this, "int", domainAuthenticationKind, "int*", &pValue := 0, "HRESULT")
        return pValue
    }
}
