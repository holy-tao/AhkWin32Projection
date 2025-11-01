#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 * @version v4.0.30319
 */
class IPropertyStoreCollection extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "Get", "Item", "Add", "Remove", "Delete", "DeleteAll"]

    /**
     * 
     * @param {Pointer<Integer>} pdwCount 
     * @returns {HRESULT} 
     */
    GetCount(pdwCount) {
        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwCountMarshal, pdwCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszInstanceIdentity 
     * @param {Pointer<Integer>} pdwIndex 
     * @param {Pointer<IPropertyStore>} ppIPropertyStore 
     * @returns {HRESULT} 
     */
    Get(pszInstanceIdentity, pdwIndex, ppIPropertyStore) {
        pszInstanceIdentity := pszInstanceIdentity is String ? StrPtr(pszInstanceIdentity) : pszInstanceIdentity

        pdwIndexMarshal := pdwIndex is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pszInstanceIdentity, pdwIndexMarshal, pdwIndex, "ptr*", ppIPropertyStore, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<IPropertyStore>} ppIPropertyStore 
     * @returns {HRESULT} 
     */
    Item(dwIndex, ppIPropertyStore) {
        result := ComCall(5, this, "uint", dwIndex, "ptr*", ppIPropertyStore, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPropertyStore} pIPropertyStore 
     * @returns {HRESULT} 
     */
    Add(pIPropertyStore) {
        result := ComCall(6, this, "ptr", pIPropertyStore, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<IPropertyStore>} pIPropertyStore 
     * @returns {HRESULT} 
     */
    Remove(dwIndex, pIPropertyStore) {
        result := ComCall(7, this, "uint", dwIndex, "ptr*", pIPropertyStore, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @returns {HRESULT} 
     */
    Delete(dwIndex) {
        result := ComCall(8, this, "uint", dwIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DeleteAll() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}
