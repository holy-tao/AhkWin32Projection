#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods to obtain folder view settings.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ifolderviewsettings
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IFolderViewSettings extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFolderViewSettings
     * @type {Guid}
     */
    static IID => Guid("{ae8c987d-8797-4ed3-be72-2a47dd938db0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetColumnPropertyList", "GetGroupByProperty", "GetViewMode", "GetIconSize", "GetFolderFlags", "GetSortColumns", "GetGroupSubsetCount"]

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderviewsettings-getcolumnpropertylist
     */
    GetColumnPropertyList(riid, ppv) {
        result := ComCall(3, this, "ptr", riid, "ptr*", ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} pkey 
     * @param {Pointer<BOOL>} pfGroupAscending 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderviewsettings-getgroupbyproperty
     */
    GetGroupByProperty(pkey, pfGroupAscending) {
        result := ComCall(4, this, "ptr", pkey, "ptr", pfGroupAscending, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plvm 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderviewsettings-getviewmode
     */
    GetViewMode(plvm) {
        result := ComCall(5, this, "int*", plvm, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} puIconSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderviewsettings-geticonsize
     */
    GetIconSize(puIconSize) {
        result := ComCall(6, this, "uint*", puIconSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pfolderMask 
     * @param {Pointer<Integer>} pfolderFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderviewsettings-getfolderflags
     */
    GetFolderFlags(pfolderMask, pfolderFlags) {
        result := ComCall(7, this, "int*", pfolderMask, "int*", pfolderFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SORTCOLUMN>} rgSortColumns 
     * @param {Integer} cColumnsIn 
     * @param {Pointer<Integer>} pcColumnsOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderviewsettings-getsortcolumns
     */
    GetSortColumns(rgSortColumns, cColumnsIn, pcColumnsOut) {
        result := ComCall(8, this, "ptr", rgSortColumns, "uint", cColumnsIn, "uint*", pcColumnsOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcVisibleRows 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderviewsettings-getgroupsubsetcount
     */
    GetGroupSubsetCount(pcVisibleRows) {
        result := ComCall(9, this, "uint*", pcVisibleRows, "HRESULT")
        return result
    }
}
