#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/attributes
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class Property extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for Property
     * @type {Guid}
     */
    static IID => Guid("{4600c3a5-e301-41d8-b6d0-ef2e4212e0ca}")

    /**
     * The class identifier for Property
     * @type {Guid}
     */
    static CLSID => Guid("{4600c3a5-e301-41d8-b6d0-ef2e4212e0ca}")

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
     * @param {Pointer<VARIANT>} Value 
     * @returns {HRESULT} 
     */
    get_Value(Value) {
        result := ComCall(7, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} Value 
     * @returns {HRESULT} 
     */
    put_Value(Value) {
        result := ComCall(8, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Name 
     * @returns {HRESULT} 
     */
    get_Name(Name) {
        result := ComCall(9, this, "ptr", Name, "HRESULT")
        return result
    }
}
