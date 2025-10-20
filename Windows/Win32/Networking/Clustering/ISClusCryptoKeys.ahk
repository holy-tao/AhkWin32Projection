#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISClusCryptoKeys extends IDispatch{
    /**
     * The interface identifier for ISClusCryptoKeys
     * @type {Guid}
     */
    static IID => Guid("{f2e6072c-2631-11d1-89f1-00a0c90d061e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} plCount 
     * @returns {HRESULT} 
     */
    get_Count(plCount) {
        result := ComCall(7, this, "int*", plCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} retval 
     * @returns {HRESULT} 
     */
    get__NewEnum(retval) {
        result := ComCall(8, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varIndex 
     * @param {Pointer<BSTR>} pbstrCyrptoKey 
     * @returns {HRESULT} 
     */
    get_Item(varIndex, pbstrCyrptoKey) {
        result := ComCall(10, this, "ptr", varIndex, "ptr", pbstrCyrptoKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrCryptoKey 
     * @returns {HRESULT} 
     */
    AddItem(bstrCryptoKey) {
        bstrCryptoKey := bstrCryptoKey is String ? BSTR.Alloc(bstrCryptoKey).Value : bstrCryptoKey

        result := ComCall(11, this, "ptr", bstrCryptoKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varIndex 
     * @returns {HRESULT} 
     */
    RemoveItem(varIndex) {
        result := ComCall(12, this, "ptr", varIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
