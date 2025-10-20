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
     * 
     * @param {Pointer<UInt32>} cProps 
     * @returns {HRESULT} 
     */
    GetCount(cProps) {
        result := ComCall(3, this, "uint*", cProps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iProp 
     * @param {Pointer<PROPERTYKEY>} pkey 
     * @returns {HRESULT} 
     */
    GetAt(iProp, pkey) {
        result := ComCall(4, this, "uint", iProp, "ptr", pkey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<PROPVARIANT>} pv 
     * @returns {HRESULT} 
     */
    GetValue(key, pv) {
        result := ComCall(5, this, "ptr", key, "ptr", pv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<PROPVARIANT>} propvar 
     * @returns {HRESULT} 
     */
    SetValue(key, propvar) {
        result := ComCall(6, this, "ptr", key, "ptr", propvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Commit() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
