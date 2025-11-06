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
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderviewsettings-getcolumnpropertylist
     */
    GetColumnPropertyList(riid) {
        result := ComCall(3, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} pkey 
     * @param {Pointer<BOOL>} pfGroupAscending 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderviewsettings-getgroupbyproperty
     */
    GetGroupByProperty(pkey, pfGroupAscending) {
        pfGroupAscendingMarshal := pfGroupAscending is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pkey, pfGroupAscendingMarshal, pfGroupAscending, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderviewsettings-getviewmode
     */
    GetViewMode() {
        result := ComCall(5, this, "int*", &plvm := 0, "HRESULT")
        return plvm
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderviewsettings-geticonsize
     */
    GetIconSize() {
        result := ComCall(6, this, "uint*", &puIconSize := 0, "HRESULT")
        return puIconSize
    }

    /**
     * 
     * @param {Pointer<Integer>} pfolderMask 
     * @param {Pointer<Integer>} pfolderFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderviewsettings-getfolderflags
     */
    GetFolderFlags(pfolderMask, pfolderFlags) {
        pfolderMaskMarshal := pfolderMask is VarRef ? "int*" : "ptr"
        pfolderFlagsMarshal := pfolderFlags is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pfolderMaskMarshal, pfolderMask, pfolderFlagsMarshal, pfolderFlags, "HRESULT")
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
        pcColumnsOutMarshal := pcColumnsOut is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", rgSortColumns, "uint", cColumnsIn, pcColumnsOutMarshal, pcColumnsOut, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderviewsettings-getgroupsubsetcount
     */
    GetGroupSubsetCount() {
        result := ComCall(9, this, "uint*", &pcVisibleRows := 0, "HRESULT")
        return pcVisibleRows
    }
}
