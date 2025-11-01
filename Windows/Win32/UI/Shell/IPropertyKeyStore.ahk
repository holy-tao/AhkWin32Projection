#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IPropertyKeyStore extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertyKeyStore
     * @type {Guid}
     */
    static IID => Guid("{75bd59aa-f23b-4963-aba4-0b355752a91b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetKeyCount", "GetKeyAt", "AppendKey", "DeleteKey", "IsKeyInStore", "RemoveKey"]

    /**
     * 
     * @param {Pointer<Integer>} keyCount 
     * @returns {HRESULT} 
     */
    GetKeyCount(keyCount) {
        keyCountMarshal := keyCount is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, keyCountMarshal, keyCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<PROPERTYKEY>} pkey 
     * @returns {HRESULT} 
     */
    GetKeyAt(index, pkey) {
        result := ComCall(4, this, "int", index, "ptr", pkey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {HRESULT} 
     */
    AppendKey(key) {
        result := ComCall(5, this, "ptr", key, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     */
    DeleteKey(index) {
        result := ComCall(6, this, "int", index, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {HRESULT} 
     */
    IsKeyInStore(key) {
        result := ComCall(7, this, "ptr", key, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {HRESULT} 
     */
    RemoveKey(key) {
        result := ComCall(8, this, "ptr", key, "HRESULT")
        return result
    }
}
