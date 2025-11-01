#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * This interface exposes methods used to enumerate and manipulate property values.
 * @see https://docs.microsoft.com/windows/win32/api//propsys/nn-propsys-ipropertystore
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class IPropertyStore extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertyStore
     * @type {Guid}
     */
    static IID => Guid("{886d8eeb-8cf2-4446-8d02-cdba1dbdcf99}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetAt", "GetValue", "SetValue", "Commit"]

    /**
     * 
     * @param {Pointer<Integer>} cProps 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertystore-getcount
     */
    GetCount(cProps) {
        cPropsMarshal := cProps is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, cPropsMarshal, cProps, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iProp 
     * @param {Pointer<PROPERTYKEY>} pkey 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertystore-getat
     */
    GetAt(iProp, pkey) {
        result := ComCall(4, this, "uint", iProp, "ptr", pkey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<PROPVARIANT>} pv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertystore-getvalue
     */
    GetValue(key, pv) {
        result := ComCall(5, this, "ptr", key, "ptr", pv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<PROPVARIANT>} propvar 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertystore-setvalue
     */
    SetValue(key, propvar) {
        result := ComCall(6, this, "ptr", key, "ptr", propvar, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertystore-commit
     */
    Commit() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}
