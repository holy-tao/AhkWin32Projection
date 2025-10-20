#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 * @version v4.0.30319
 */
class IPropertyStoreCollection extends IUnknown{
    /**
     * The interface identifier for IPropertyStoreCollection
     * @type {Guid}
     */
    static IID => Guid("{d14d9c30-12d2-42d8-bce4-c60c2bb226fa}")

    /**
     * The class identifier for PropertyStoreCollection
     * @type {Guid}
     */
    static CLSID => Guid("{edd36029-d753-4862-aa5b-5bccad2a4d29}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pdwCount 
     * @returns {HRESULT} 
     */
    GetCount(pdwCount) {
        result := ComCall(3, this, "uint*", pdwCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszInstanceIdentity 
     * @param {Pointer<UInt32>} pdwIndex 
     * @param {Pointer<IPropertyStore>} ppIPropertyStore 
     * @returns {HRESULT} 
     */
    Get(pszInstanceIdentity, pdwIndex, ppIPropertyStore) {
        pszInstanceIdentity := pszInstanceIdentity is String ? StrPtr(pszInstanceIdentity) : pszInstanceIdentity

        result := ComCall(4, this, "ptr", pszInstanceIdentity, "uint*", pdwIndex, "ptr", ppIPropertyStore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<IPropertyStore>} ppIPropertyStore 
     * @returns {HRESULT} 
     */
    Item(dwIndex, ppIPropertyStore) {
        result := ComCall(5, this, "uint", dwIndex, "ptr", ppIPropertyStore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPropertyStore>} pIPropertyStore 
     * @returns {HRESULT} 
     */
    Add(pIPropertyStore) {
        result := ComCall(6, this, "ptr", pIPropertyStore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<IPropertyStore>} pIPropertyStore 
     * @returns {HRESULT} 
     */
    Remove(dwIndex, pIPropertyStore) {
        result := ComCall(7, this, "uint", dwIndex, "ptr", pIPropertyStore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @returns {HRESULT} 
     */
    Delete(dwIndex) {
        result := ComCall(8, this, "uint", dwIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DeleteAll() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
