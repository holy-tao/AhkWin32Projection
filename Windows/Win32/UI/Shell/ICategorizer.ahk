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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDescription", "GetCategory", "GetCategoryInfo", "CompareCategory"]

    /**
     * 
     * @param {PWSTR} pszDesc 
     * @param {Integer} cch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icategorizer-getdescription
     */
    GetDescription(pszDesc, cch) {
        pszDesc := pszDesc is String ? StrPtr(pszDesc) : pszDesc

        result := ComCall(3, this, "ptr", pszDesc, "uint", cch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cidl 
     * @param {Pointer<Pointer<ITEMIDLIST>>} apidl 
     * @param {Pointer<Integer>} rgCategoryIds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icategorizer-getcategory
     */
    GetCategory(cidl, apidl, rgCategoryIds) {
        apidlMarshal := apidl is VarRef ? "ptr*" : "ptr"
        rgCategoryIdsMarshal := rgCategoryIds is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", cidl, apidlMarshal, apidl, rgCategoryIdsMarshal, rgCategoryIds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwCategoryId 
     * @param {Pointer<CATEGORY_INFO>} pci 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icategorizer-getcategoryinfo
     */
    GetCategoryInfo(dwCategoryId, pci) {
        result := ComCall(5, this, "uint", dwCategoryId, "ptr", pci, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} csfFlags 
     * @param {Integer} dwCategoryId1 
     * @param {Integer} dwCategoryId2 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icategorizer-comparecategory
     */
    CompareCategory(csfFlags, dwCategoryId1, dwCategoryId2) {
        result := ComCall(6, this, "int", csfFlags, "uint", dwCategoryId1, "uint", dwCategoryId2, "HRESULT")
        return result
    }
}
