#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVssAdmin.ahk

/**
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssAdminEx extends IVssAdmin{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVssAdminEx
     * @type {Guid}
     */
    static IID => Guid("{7858a9f8-b1fa-41a6-964f-b9b36b8cd8d8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProviderCapability", "GetProviderContext", "SetProviderContext"]

    /**
     * 
     * @param {Guid} pProviderId 
     * @returns {Integer} 
     */
    GetProviderCapability(pProviderId) {
        result := ComCall(7, this, "ptr", pProviderId, "uint*", &pllOriginalCapabilityMask := 0, "HRESULT")
        return pllOriginalCapabilityMask
    }

    /**
     * 
     * @param {Guid} ProviderId 
     * @returns {Integer} 
     */
    GetProviderContext(ProviderId) {
        result := ComCall(8, this, "ptr", ProviderId, "int*", &plContext := 0, "HRESULT")
        return plContext
    }

    /**
     * 
     * @param {Guid} ProviderId 
     * @param {Integer} lContext 
     * @returns {HRESULT} 
     */
    SetProviderContext(ProviderId, lContext) {
        result := ComCall(9, this, "ptr", ProviderId, "int", lContext, "HRESULT")
        return result
    }
}
