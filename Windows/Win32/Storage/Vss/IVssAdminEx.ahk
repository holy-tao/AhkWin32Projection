#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVssAdmin.ahk

/**
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssAdminEx extends IVssAdmin{
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
     * 
     * @param {Pointer<Guid>} pProviderId 
     * @param {Pointer<UInt64>} pllOriginalCapabilityMask 
     * @returns {HRESULT} 
     */
    GetProviderCapability(pProviderId, pllOriginalCapabilityMask) {
        result := ComCall(7, this, "ptr", pProviderId, "uint*", pllOriginalCapabilityMask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ProviderId 
     * @param {Pointer<Int32>} plContext 
     * @returns {HRESULT} 
     */
    GetProviderContext(ProviderId, plContext) {
        result := ComCall(8, this, "ptr", ProviderId, "int*", plContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ProviderId 
     * @param {Integer} lContext 
     * @returns {HRESULT} 
     */
    SetProviderContext(ProviderId, lContext) {
        result := ComCall(9, this, "ptr", ProviderId, "int", lContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
