#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents items in collections on the COM+ catalog. ICatalogObject enables you to get and put properties exposed by objects in the catalog.
 * @see https://docs.microsoft.com/windows/win32/api//comadmin/nn-comadmin-icatalogobject
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ICatalogObject extends IDispatch{
    /**
     * The interface identifier for ICatalogObject
     * @type {Guid}
     */
    static IID => Guid("{6eb22871-8a19-11d0-81b6-00a0c9231c29}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {BSTR} bstrPropName 
     * @param {Pointer<VARIANT>} pvarRetVal 
     * @returns {HRESULT} 
     */
    get_Value(bstrPropName, pvarRetVal) {
        bstrPropName := bstrPropName is String ? BSTR.Alloc(bstrPropName).Value : bstrPropName

        result := ComCall(7, this, "ptr", bstrPropName, "ptr", pvarRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrPropName 
     * @param {VARIANT} val 
     * @returns {HRESULT} 
     */
    put_Value(bstrPropName, val) {
        bstrPropName := bstrPropName is String ? BSTR.Alloc(bstrPropName).Value : bstrPropName

        result := ComCall(8, this, "ptr", bstrPropName, "ptr", val, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarRetVal 
     * @returns {HRESULT} 
     */
    get_Key(pvarRetVal) {
        result := ComCall(9, this, "ptr", pvarRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarRetVal 
     * @returns {HRESULT} 
     */
    get_Name(pvarRetVal) {
        result := ComCall(10, this, "ptr", pvarRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrPropName 
     * @param {Pointer<VARIANT_BOOL>} pbRetVal 
     * @returns {HRESULT} 
     */
    IsPropertyReadOnly(bstrPropName, pbRetVal) {
        bstrPropName := bstrPropName is String ? BSTR.Alloc(bstrPropName).Value : bstrPropName

        result := ComCall(11, this, "ptr", bstrPropName, "ptr", pbRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbRetVal 
     * @returns {HRESULT} 
     */
    get_Valid(pbRetVal) {
        result := ComCall(12, this, "ptr", pbRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrPropName 
     * @param {Pointer<VARIANT_BOOL>} pbRetVal 
     * @returns {HRESULT} 
     */
    IsPropertyWriteOnly(bstrPropName, pbRetVal) {
        bstrPropName := bstrPropName is String ? BSTR.Alloc(bstrPropName).Value : bstrPropName

        result := ComCall(13, this, "ptr", bstrPropName, "ptr", pbRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
