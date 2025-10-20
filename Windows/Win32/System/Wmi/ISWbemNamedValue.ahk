#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemNamedValue extends IDispatch{
    /**
     * The interface identifier for ISWbemNamedValue
     * @type {Guid}
     */
    static IID => Guid("{76a64164-cb41-11d1-8b02-00600806d9b6}")

    /**
     * The class identifier for SWbemNamedValue
     * @type {Guid}
     */
    static CLSID => Guid("{04b83d60-21ae-11d2-8b33-00600806d9b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<VARIANT>} varValue 
     * @returns {HRESULT} 
     */
    get_Value(varValue) {
        result := ComCall(7, this, "ptr", varValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} varValue 
     * @returns {HRESULT} 
     */
    put_Value(varValue) {
        result := ComCall(8, this, "ptr", varValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strName 
     * @returns {HRESULT} 
     */
    get_Name(strName) {
        result := ComCall(9, this, "ptr", strName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
