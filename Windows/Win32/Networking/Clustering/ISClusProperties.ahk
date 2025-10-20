#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISClusProperties extends IDispatch{
    /**
     * The interface identifier for ISClusProperties
     * @type {Guid}
     */
    static IID => Guid("{f2e60700-2631-11d1-89f1-00a0c90d061e}")

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
     * @param {Pointer<ISClusProperty>} ppClusProperty 
     * @returns {HRESULT} 
     */
    get_Item(varIndex, ppClusProperty) {
        result := ComCall(10, this, "ptr", varIndex, "ptr", ppClusProperty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {VARIANT} varValue 
     * @param {Pointer<ISClusProperty>} pProperty 
     * @returns {HRESULT} 
     */
    CreateItem(bstrName, varValue, pProperty) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(11, this, "ptr", bstrName, "ptr", varValue, "ptr", pProperty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varIndex 
     * @returns {HRESULT} 
     */
    UseDefaultValue(varIndex) {
        result := ComCall(12, this, "ptr", varIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarStatusCode 
     * @returns {HRESULT} 
     */
    SaveChanges(pvarStatusCode) {
        result := ComCall(13, this, "ptr", pvarStatusCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarReadOnly 
     * @returns {HRESULT} 
     */
    get_ReadOnly(pvarReadOnly) {
        result := ComCall(14, this, "ptr", pvarReadOnly, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarPrivate 
     * @returns {HRESULT} 
     */
    get_Private(pvarPrivate) {
        result := ComCall(15, this, "ptr", pvarPrivate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarCommon 
     * @returns {HRESULT} 
     */
    get_Common(pvarCommon) {
        result := ComCall(16, this, "ptr", pvarCommon, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarModified 
     * @returns {HRESULT} 
     */
    get_Modified(pvarModified) {
        result := ComCall(17, this, "ptr", pvarModified, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
