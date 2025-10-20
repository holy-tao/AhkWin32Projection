#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\INetwork.ahk

/**
 * @namespace Windows.Win32.Networking.NetworkListManager
 * @version v4.0.30319
 */
class INetwork2 extends INetwork{
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
     * 
     * @param {Integer} domainAuthenticationKind 
     * @param {Pointer<BOOL>} pValue 
     * @returns {HRESULT} 
     */
    IsDomainAuthenticatedBy(domainAuthenticationKind, pValue) {
        result := ComCall(20, this, "int", domainAuthenticationKind, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
