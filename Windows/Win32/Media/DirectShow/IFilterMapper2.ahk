#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Registers and unregisters filters, and locates filters in the registry.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ifiltermapper2
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IFilterMapper2 extends IUnknown{
    /**
     * The interface identifier for IFilterMapper2
     * @type {Guid}
     */
    static IID => Guid("{b79bb0b0-33c1-11d1-abe1-00a0c905f375}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} clsidCategory 
     * @param {Integer} dwCategoryMerit 
     * @param {PWSTR} Description 
     * @returns {HRESULT} 
     */
    CreateCategory(clsidCategory, dwCategoryMerit, Description) {
        Description := Description is String ? StrPtr(Description) : Description

        result := ComCall(3, this, "ptr", clsidCategory, "uint", dwCategoryMerit, "ptr", Description, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pclsidCategory 
     * @param {PWSTR} szInstance 
     * @param {Pointer<Guid>} Filter 
     * @returns {HRESULT} 
     */
    UnregisterFilter(pclsidCategory, szInstance, Filter) {
        szInstance := szInstance is String ? StrPtr(szInstance) : szInstance

        result := ComCall(4, this, "ptr", pclsidCategory, "ptr", szInstance, "ptr", Filter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} clsidFilter 
     * @param {PWSTR} Name 
     * @param {Pointer<IMoniker>} ppMoniker 
     * @param {Pointer<Guid>} pclsidCategory 
     * @param {PWSTR} szInstance 
     * @param {Pointer<REGFILTER2>} prf2 
     * @returns {HRESULT} 
     */
    RegisterFilter(clsidFilter, Name, ppMoniker, pclsidCategory, szInstance, prf2) {
        Name := Name is String ? StrPtr(Name) : Name
        szInstance := szInstance is String ? StrPtr(szInstance) : szInstance

        result := ComCall(5, this, "ptr", clsidFilter, "ptr", Name, "ptr", ppMoniker, "ptr", pclsidCategory, "ptr", szInstance, "ptr", prf2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumMoniker>} ppEnum 
     * @param {Integer} dwFlags 
     * @param {BOOL} bExactMatch 
     * @param {Integer} dwMerit 
     * @param {BOOL} bInputNeeded 
     * @param {Integer} cInputTypes 
     * @param {Pointer<Guid>} pInputTypes 
     * @param {Pointer<REGPINMEDIUM>} pMedIn 
     * @param {Pointer<Guid>} pPinCategoryIn 
     * @param {BOOL} bRender 
     * @param {BOOL} bOutputNeeded 
     * @param {Integer} cOutputTypes 
     * @param {Pointer<Guid>} pOutputTypes 
     * @param {Pointer<REGPINMEDIUM>} pMedOut 
     * @param {Pointer<Guid>} pPinCategoryOut 
     * @returns {HRESULT} 
     */
    EnumMatchingFilters(ppEnum, dwFlags, bExactMatch, dwMerit, bInputNeeded, cInputTypes, pInputTypes, pMedIn, pPinCategoryIn, bRender, bOutputNeeded, cOutputTypes, pOutputTypes, pMedOut, pPinCategoryOut) {
        result := ComCall(6, this, "ptr", ppEnum, "uint", dwFlags, "int", bExactMatch, "uint", dwMerit, "int", bInputNeeded, "uint", cInputTypes, "ptr", pInputTypes, "ptr", pMedIn, "ptr", pPinCategoryIn, "int", bRender, "int", bOutputNeeded, "uint", cOutputTypes, "ptr", pOutputTypes, "ptr", pMedOut, "ptr", pPinCategoryOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
