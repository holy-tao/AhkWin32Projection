#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that get and set named properties.
 * @see https://docs.microsoft.com/windows/win32/api//propsys/nn-propsys-inamedpropertystore
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class INamedPropertyStore extends IUnknown{
    /**
     * The interface identifier for INamedPropertyStore
     * @type {Guid}
     */
    static IID => Guid("{71604b0f-97b0-4764-8577-2f13e98a1422}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Pointer<PROPVARIANT>} ppropvar 
     * @returns {HRESULT} 
     */
    GetNamedValue(pszName, ppropvar) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(3, this, "ptr", pszName, "ptr", ppropvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Pointer<PROPVARIANT>} propvar 
     * @returns {HRESULT} 
     */
    SetNamedValue(pszName, propvar) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(4, this, "ptr", pszName, "ptr", propvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwCount 
     * @returns {HRESULT} 
     */
    GetNameCount(pdwCount) {
        result := ComCall(5, this, "uint*", pdwCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iProp 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    GetNameAt(iProp, pbstrName) {
        result := ComCall(6, this, "uint", iProp, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
