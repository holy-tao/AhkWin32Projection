#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that are used to obtain information about item identifier lists.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-icategorizer
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ICategorizer extends IUnknown{
    /**
     * The interface identifier for ICategorizer
     * @type {Guid}
     */
    static IID => Guid("{a3b14589-9174-49a8-89a3-06a1ae2b9ba7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pszDesc 
     * @param {Integer} cch 
     * @returns {HRESULT} 
     */
    GetDescription(pszDesc, cch) {
        pszDesc := pszDesc is String ? StrPtr(pszDesc) : pszDesc

        result := ComCall(3, this, "ptr", pszDesc, "uint", cch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cidl 
     * @param {Pointer<ITEMIDLIST>} apidl 
     * @param {Pointer<UInt32>} rgCategoryIds 
     * @returns {HRESULT} 
     */
    GetCategory(cidl, apidl, rgCategoryIds) {
        result := ComCall(4, this, "uint", cidl, "ptr", apidl, "uint*", rgCategoryIds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwCategoryId 
     * @param {Pointer<CATEGORY_INFO>} pci 
     * @returns {HRESULT} 
     */
    GetCategoryInfo(dwCategoryId, pci) {
        result := ComCall(5, this, "uint", dwCategoryId, "ptr", pci, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} csfFlags 
     * @param {Integer} dwCategoryId1 
     * @param {Integer} dwCategoryId2 
     * @returns {HRESULT} 
     */
    CompareCategory(csfFlags, dwCategoryId1, dwCategoryId2) {
        result := ComCall(6, this, "int", csfFlags, "uint", dwCategoryId1, "uint", dwCategoryId2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
