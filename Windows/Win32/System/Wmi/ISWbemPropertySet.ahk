#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemPropertySet extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISWbemPropertySet
     * @type {Guid}
     */
    static IID => Guid("{dea0a7b2-d4ba-11d1-8b09-00600806d9b6}")

    /**
     * The class identifier for SWbemPropertySet
     * @type {Guid}
     */
    static CLSID => Guid("{04b83d5c-21ae-11d2-8b33-00600806d9b6}")

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
     * @param {BSTR} strName 
     * @param {Integer} iFlags 
     * @param {Pointer<ISWbemProperty>} objWbemProperty 
     * @returns {HRESULT} 
     */
    Item(strName, iFlags, objWbemProperty) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(8, this, "ptr", strName, "int", iFlags, "ptr*", objWbemProperty, "HRESULT")
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
     * @param {Integer} iCIMType 
     * @param {VARIANT_BOOL} bIsArray 
     * @param {Integer} iFlags 
     * @param {Pointer<ISWbemProperty>} objWbemProperty 
     * @returns {HRESULT} 
     */
    Add(strName, iCIMType, bIsArray, iFlags, objWbemProperty) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(10, this, "ptr", strName, "int", iCIMType, "short", bIsArray, "int", iFlags, "ptr*", objWbemProperty, "HRESULT")
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
