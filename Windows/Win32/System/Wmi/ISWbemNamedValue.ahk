#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemNamedValue extends IDispatch{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Value", "put_Value", "get_Name"]

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Value() {
        varValue := VARIANT()
        result := ComCall(7, this, "ptr", varValue, "HRESULT")
        return varValue
    }

    /**
     * 
     * @param {Pointer<VARIANT>} varValue 
     * @returns {HRESULT} 
     */
    put_Value(varValue) {
        result := ComCall(8, this, "ptr", varValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        strName := BSTR()
        result := ComCall(9, this, "ptr", strName, "HRESULT")
        return strName
    }
}
