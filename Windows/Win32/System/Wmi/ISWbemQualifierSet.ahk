#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk
#Include .\ISWbemQualifier.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemQualifierSet extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISWbemQualifierSet
     * @type {Guid}
     */
    static IID => Guid("{9b16ed16-d3df-11d1-8b08-00600806d9b6}")

    /**
     * The class identifier for SWbemQualifierSet
     * @type {Guid}
     */
    static CLSID => Guid("{04b83d5e-21ae-11d2-8b33-00600806d9b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "Item", "get_Count", "Add", "Remove"]

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &pUnk := 0, "HRESULT")
        return IUnknown(pUnk)
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Integer} iFlags 
     * @returns {ISWbemQualifier} 
     */
    Item(name, iFlags) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, "ptr", name, "int", iFlags, "ptr*", &objWbemQualifier := 0, "HRESULT")
        return ISWbemQualifier(objWbemQualifier)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(9, this, "int*", &iCount := 0, "HRESULT")
        return iCount
    }

    /**
     * 
     * @param {BSTR} strName 
     * @param {Pointer<VARIANT>} varVal 
     * @param {VARIANT_BOOL} bPropagatesToSubclass 
     * @param {VARIANT_BOOL} bPropagatesToInstance 
     * @param {VARIANT_BOOL} bIsOverridable 
     * @param {Integer} iFlags 
     * @returns {ISWbemQualifier} 
     */
    Add(strName, varVal, bPropagatesToSubclass, bPropagatesToInstance, bIsOverridable, iFlags) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(10, this, "ptr", strName, "ptr", varVal, "short", bPropagatesToSubclass, "short", bPropagatesToInstance, "short", bIsOverridable, "int", iFlags, "ptr*", &objWbemQualifier := 0, "HRESULT")
        return ISWbemQualifier(objWbemQualifier)
    }

    /**
     * 
     * @param {BSTR} strName 
     * @param {Integer} iFlags 
     * @returns {HRESULT} 
     */
    Remove(strName, iFlags) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(11, this, "ptr", strName, "int", iFlags, "HRESULT")
        return result
    }
}
