#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that create and modify search folders.
 * @remarks
 * 
  * To implement this interface use class ID <b>CLSID_SearchFolderItemFactory</b>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-isearchfolderitemfactory
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISearchFolderItemFactory extends IUnknown{
    /**
     * The interface identifier for ISearchFolderItemFactory
     * @type {Guid}
     */
    static IID => Guid("{a0ffbc28-5482-4366-be27-3e81e78e06c2}")

    /**
     * The class identifier for SearchFolderItemFactory
     * @type {Guid}
     */
    static CLSID => Guid("{14010e02-bbbd-41f0-88e3-eda371216584}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pszDisplayName 
     * @returns {HRESULT} 
     */
    SetDisplayName(pszDisplayName) {
        pszDisplayName := pszDisplayName is String ? StrPtr(pszDisplayName) : pszDisplayName

        result := ComCall(3, this, "ptr", pszDisplayName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ftid 
     * @returns {HRESULT} 
     */
    SetFolderTypeID(ftid) {
        result := ComCall(4, this, "ptr", ftid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} flvm 
     * @returns {HRESULT} 
     */
    SetFolderLogicalViewMode(flvm) {
        result := ComCall(5, this, "int", flvm, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iIconSize 
     * @returns {HRESULT} 
     */
    SetIconSize(iIconSize) {
        result := ComCall(6, this, "int", iIconSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cVisibleColumns 
     * @param {Pointer<PROPERTYKEY>} rgKey 
     * @returns {HRESULT} 
     */
    SetVisibleColumns(cVisibleColumns, rgKey) {
        result := ComCall(7, this, "uint", cVisibleColumns, "ptr", rgKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cSortColumns 
     * @param {Pointer<SORTCOLUMN>} rgSortColumns 
     * @returns {HRESULT} 
     */
    SetSortColumns(cSortColumns, rgSortColumns) {
        result := ComCall(8, this, "uint", cSortColumns, "ptr", rgSortColumns, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} keyGroup 
     * @returns {HRESULT} 
     */
    SetGroupColumn(keyGroup) {
        result := ComCall(9, this, "ptr", keyGroup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cStackKeys 
     * @param {Pointer<PROPERTYKEY>} rgStackKeys 
     * @returns {HRESULT} 
     */
    SetStacks(cStackKeys, rgStackKeys) {
        result := ComCall(10, this, "uint", cStackKeys, "ptr", rgStackKeys, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItemArray>} psiaScope 
     * @returns {HRESULT} 
     */
    SetScope(psiaScope) {
        result := ComCall(11, this, "ptr", psiaScope, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ICondition>} pCondition 
     * @returns {HRESULT} 
     */
    SetCondition(pCondition) {
        result := ComCall(12, this, "ptr", pCondition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetShellItem(riid, ppv) {
        result := ComCall(13, this, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} ppidl 
     * @returns {HRESULT} 
     */
    GetIDList(ppidl) {
        result := ComCall(14, this, "ptr", ppidl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
