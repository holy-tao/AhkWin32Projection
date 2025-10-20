#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a list of categorizers registered on an IShellFolder.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-icategoryprovider
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ICategoryProvider extends IUnknown{
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
     * 
     * @param {Pointer<PROPERTYKEY>} pscid 
     * @returns {HRESULT} 
     */
    CanCategorizeOnSCID(pscid) {
        result := ComCall(3, this, "ptr", pscid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguid 
     * @param {Pointer<PROPERTYKEY>} pscid 
     * @returns {HRESULT} 
     */
    GetDefaultCategory(pguid, pscid) {
        result := ComCall(4, this, "ptr", pguid, "ptr", pscid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} pscid 
     * @param {Pointer<Guid>} pguid 
     * @returns {HRESULT} 
     */
    GetCategoryForSCID(pscid, pguid) {
        result := ComCall(5, this, "ptr", pscid, "ptr", pguid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumGUID>} penum 
     * @returns {HRESULT} 
     */
    EnumCategories(penum) {
        result := ComCall(6, this, "ptr", penum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguid 
     * @param {PWSTR} pszName 
     * @param {Integer} cch 
     * @returns {HRESULT} 
     */
    GetCategoryName(pguid, pszName, cch) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(7, this, "ptr", pguid, "ptr", pszName, "uint", cch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    CreateCategory(pguid, riid, ppv) {
        result := ComCall(8, this, "ptr", pguid, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
