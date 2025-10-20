#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IPropertyKeyStore extends IUnknown{
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
     * 
     * @param {Pointer<Int32>} keyCount 
     * @returns {HRESULT} 
     */
    GetKeyCount(keyCount) {
        result := ComCall(3, this, "int*", keyCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<PROPERTYKEY>} pkey 
     * @returns {HRESULT} 
     */
    GetKeyAt(index, pkey) {
        result := ComCall(4, this, "int", index, "ptr", pkey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {HRESULT} 
     */
    AppendKey(key) {
        result := ComCall(5, this, "ptr", key, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     */
    DeleteKey(index) {
        result := ComCall(6, this, "int", index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {HRESULT} 
     */
    IsKeyInStore(key) {
        result := ComCall(7, this, "ptr", key, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {HRESULT} 
     */
    RemoveKey(key) {
        result := ComCall(8, this, "ptr", key, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
