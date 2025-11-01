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
     * @param {Pointer<Integer>} pllOriginalCapabilityMask 
     * @returns {HRESULT} 
     */
    GetProviderCapability(pProviderId, pllOriginalCapabilityMask) {
        pllOriginalCapabilityMaskMarshal := pllOriginalCapabilityMask is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", pProviderId, pllOriginalCapabilityMaskMarshal, pllOriginalCapabilityMask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} ProviderId 
     * @param {Pointer<Integer>} plContext 
     * @returns {HRESULT} 
     */
    GetProviderContext(ProviderId, plContext) {
        plContextMarshal := plContext is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, "ptr", ProviderId, plContextMarshal, plContext, "HRESULT")
        return result
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
