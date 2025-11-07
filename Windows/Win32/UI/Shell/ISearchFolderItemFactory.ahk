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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDisplayName", "SetFolderTypeID", "SetFolderLogicalViewMode", "SetIconSize", "SetVisibleColumns", "SetSortColumns", "SetGroupColumn", "SetStacks", "SetScope", "SetCondition", "GetShellItem", "GetIDList"]

    /**
     * 
     * @param {PWSTR} pszDisplayName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-isearchfolderitemfactory-setdisplayname
     */
    SetDisplayName(pszDisplayName) {
        pszDisplayName := pszDisplayName is String ? StrPtr(pszDisplayName) : pszDisplayName

        result := ComCall(3, this, "ptr", pszDisplayName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} ftid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-isearchfolderitemfactory-setfoldertypeid
     */
    SetFolderTypeID(ftid) {
        result := ComCall(4, this, "ptr", ftid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} flvm 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-isearchfolderitemfactory-setfolderlogicalviewmode
     */
    SetFolderLogicalViewMode(flvm) {
        result := ComCall(5, this, "int", flvm, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iIconSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-isearchfolderitemfactory-seticonsize
     */
    SetIconSize(iIconSize) {
        result := ComCall(6, this, "int", iIconSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cVisibleColumns 
     * @param {Pointer<PROPERTYKEY>} rgKey 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-isearchfolderitemfactory-setvisiblecolumns
     */
    SetVisibleColumns(cVisibleColumns, rgKey) {
        result := ComCall(7, this, "uint", cVisibleColumns, "ptr", rgKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cSortColumns 
     * @param {Pointer<SORTCOLUMN>} rgSortColumns 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-isearchfolderitemfactory-setsortcolumns
     */
    SetSortColumns(cSortColumns, rgSortColumns) {
        result := ComCall(8, this, "uint", cSortColumns, "ptr", rgSortColumns, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} keyGroup 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-isearchfolderitemfactory-setgroupcolumn
     */
    SetGroupColumn(keyGroup) {
        result := ComCall(9, this, "ptr", keyGroup, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cStackKeys 
     * @param {Pointer<PROPERTYKEY>} rgStackKeys 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-isearchfolderitemfactory-setstacks
     */
    SetStacks(cStackKeys, rgStackKeys) {
        result := ComCall(10, this, "uint", cStackKeys, "ptr", rgStackKeys, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItemArray} psiaScope 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-isearchfolderitemfactory-setscope
     */
    SetScope(psiaScope) {
        result := ComCall(11, this, "ptr", psiaScope, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ICondition} pCondition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-isearchfolderitemfactory-setcondition
     */
    SetCondition(pCondition) {
        result := ComCall(12, this, "ptr", pCondition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-isearchfolderitemfactory-getshellitem
     */
    GetShellItem(riid) {
        result := ComCall(13, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @returns {Pointer<ITEMIDLIST>} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-isearchfolderitemfactory-getidlist
     */
    GetIDList() {
        result := ComCall(14, this, "ptr*", &ppidl := 0, "HRESULT")
        return ppidl
    }
}
