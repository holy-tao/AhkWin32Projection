#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemNamedValueSet extends IDispatch{
    /**
     * The interface identifier for ISWbemNamedValueSet
     * @type {Guid}
     */
    static IID => Guid("{cf2376ea-ce8c-11d1-8b05-00600806d9b6}")

    /**
     * The class identifier for SWbemNamedValueSet
     * @type {Guid}
     */
    static CLSID => Guid("{9aed384e-ce8b-11d1-8b05-00600806d9b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IUnknown>} pUnk 
     * @returns {HRESULT} 
     */
    get__NewEnum(pUnk) {
        result := ComCall(7, this, "ptr", pUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strName 
     * @param {Integer} iFlags 
     * @param {Pointer<ISWbemNamedValue>} objWbemNamedValue 
     * @returns {HRESULT} 
     */
    Item(strName, iFlags, objWbemNamedValue) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(8, this, "ptr", strName, "int", iFlags, "ptr", objWbemNamedValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} iCount 
     * @returns {HRESULT} 
     */
    get_Count(iCount) {
        result := ComCall(9, this, "int*", iCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strName 
     * @param {Pointer<VARIANT>} varValue 
     * @param {Integer} iFlags 
     * @param {Pointer<ISWbemNamedValue>} objWbemNamedValue 
     * @returns {HRESULT} 
     */
    Add(strName, varValue, iFlags, objWbemNamedValue) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(10, this, "ptr", strName, "ptr", varValue, "int", iFlags, "ptr", objWbemNamedValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strName 
     * @param {Integer} iFlags 
     * @returns {HRESULT} 
     */
    Remove(strName, iFlags) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(11, this, "ptr", strName, "int", iFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISWbemNamedValueSet>} objWbemNamedValueSet 
     * @returns {HRESULT} 
     */
    Clone(objWbemNamedValueSet) {
        result := ComCall(12, this, "ptr", objWbemNamedValueSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DeleteAll() {
        result := ComCall(13, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
