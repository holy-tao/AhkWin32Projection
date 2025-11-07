#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk
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
     * @returns {Integer} 
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * 
     * @param {PWSTR} pszInstanceIdentity 
     * @param {Pointer<Integer>} pdwIndex 
     * @returns {IPropertyStore} 
     */
    Get(pszInstanceIdentity, pdwIndex) {
        pszInstanceIdentity := pszInstanceIdentity is String ? StrPtr(pszInstanceIdentity) : pszInstanceIdentity

        pdwIndexMarshal := pdwIndex is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pszInstanceIdentity, pdwIndexMarshal, pdwIndex, "ptr*", &ppIPropertyStore := 0, "HRESULT")
        return IPropertyStore(ppIPropertyStore)
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @returns {IPropertyStore} 
     */
    Item(dwIndex) {
        result := ComCall(5, this, "uint", dwIndex, "ptr*", &ppIPropertyStore := 0, "HRESULT")
        return IPropertyStore(ppIPropertyStore)
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
     * @returns {IPropertyStore} 
     */
    Remove(dwIndex) {
        result := ComCall(7, this, "uint", dwIndex, "ptr*", &pIPropertyStore := 0, "HRESULT")
        return IPropertyStore(pIPropertyStore)
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
