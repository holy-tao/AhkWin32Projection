#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @param {Pointer<IUnknown>} pUnk 
     * @returns {HRESULT} 
     */
    get__NewEnum(pUnk) {
        result := ComCall(7, this, "ptr*", pUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Integer} iFlags 
     * @param {Pointer<ISWbemQualifier>} objWbemQualifier 
     * @returns {HRESULT} 
     */
    Item(name, iFlags, objWbemQualifier) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, "ptr", name, "int", iFlags, "ptr*", objWbemQualifier, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} iCount 
     * @returns {HRESULT} 
     */
    get_Count(iCount) {
        result := ComCall(9, this, "int*", iCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strName 
     * @param {Pointer<VARIANT>} varVal 
     * @param {VARIANT_BOOL} bPropagatesToSubclass 
     * @param {VARIANT_BOOL} bPropagatesToInstance 
     * @param {VARIANT_BOOL} bIsOverridable 
     * @param {Integer} iFlags 
     * @param {Pointer<ISWbemQualifier>} objWbemQualifier 
     * @returns {HRESULT} 
     */
    Add(strName, varVal, bPropagatesToSubclass, bPropagatesToInstance, bIsOverridable, iFlags, objWbemQualifier) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(10, this, "ptr", strName, "ptr", varVal, "short", bPropagatesToSubclass, "short", bPropagatesToInstance, "short", bIsOverridable, "int", iFlags, "ptr*", objWbemQualifier, "HRESULT")
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

        result := ComCall(11, this, "ptr", strName, "int", iFlags, "HRESULT")
        return result
    }
}
