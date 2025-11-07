#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IEnumGUID.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a list of categorizers registered on an IShellFolder.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-icategoryprovider
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ICategoryProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICategoryProvider
     * @type {Guid}
     */
    static IID => Guid("{9af64809-5864-4c26-a720-c1f78c086ee3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CanCategorizeOnSCID", "GetDefaultCategory", "GetCategoryForSCID", "EnumCategories", "GetCategoryName", "CreateCategory"]

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} pscid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icategoryprovider-cancategorizeonscid
     */
    CanCategorizeOnSCID(pscid) {
        result := ComCall(3, this, "ptr", pscid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguid 
     * @param {Pointer<PROPERTYKEY>} pscid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icategoryprovider-getdefaultcategory
     */
    GetDefaultCategory(pguid, pscid) {
        result := ComCall(4, this, "ptr", pguid, "ptr", pscid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} pscid 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icategoryprovider-getcategoryforscid
     */
    GetCategoryForSCID(pscid) {
        pguid := Guid()
        result := ComCall(5, this, "ptr", pscid, "ptr", pguid, "HRESULT")
        return pguid
    }

    /**
     * 
     * @returns {IEnumGUID} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icategoryprovider-enumcategories
     */
    EnumCategories() {
        result := ComCall(6, this, "ptr*", &penum := 0, "HRESULT")
        return IEnumGUID(penum)
    }

    /**
     * 
     * @param {Pointer<Guid>} pguid 
     * @param {PWSTR} pszName 
     * @param {Integer} cch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icategoryprovider-getcategoryname
     */
    GetCategoryName(pguid, pszName, cch) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(7, this, "ptr", pguid, "ptr", pszName, "uint", cch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguid 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icategoryprovider-createcategory
     */
    CreateCategory(pguid, riid) {
        result := ComCall(8, this, "ptr", pguid, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
