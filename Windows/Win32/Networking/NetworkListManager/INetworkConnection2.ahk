#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\INetworkConnection.ahk

/**
 * @namespace Windows.Win32.Networking.NetworkListManager
 * @version v4.0.30319
 */
class INetworkConnection2 extends INetworkConnection{
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
     * 
     * @param {Integer} domainAuthenticationKind 
     * @param {Pointer<BOOL>} pValue 
     * @returns {HRESULT} 
     */
    IsDomainAuthenticatedBy(domainAuthenticationKind, pValue) {
        result := ComCall(14, this, "int", domainAuthenticationKind, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
