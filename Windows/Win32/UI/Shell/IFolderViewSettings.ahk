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
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetColumnPropertyList(riid, ppv) {
        result := ComCall(3, this, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} pkey 
     * @param {Pointer<BOOL>} pfGroupAscending 
     * @returns {HRESULT} 
     */
    GetGroupByProperty(pkey, pfGroupAscending) {
        result := ComCall(4, this, "ptr", pkey, "ptr", pfGroupAscending, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plvm 
     * @returns {HRESULT} 
     */
    GetViewMode(plvm) {
        result := ComCall(5, this, "int*", plvm, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} puIconSize 
     * @returns {HRESULT} 
     */
    GetIconSize(puIconSize) {
        result := ComCall(6, this, "uint*", puIconSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pfolderMask 
     * @param {Pointer<Int32>} pfolderFlags 
     * @returns {HRESULT} 
     */
    GetFolderFlags(pfolderMask, pfolderFlags) {
        result := ComCall(7, this, "int*", pfolderMask, "int*", pfolderFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SORTCOLUMN>} rgSortColumns 
     * @param {Integer} cColumnsIn 
     * @param {Pointer<UInt32>} pcColumnsOut 
     * @returns {HRESULT} 
     */
    GetSortColumns(rgSortColumns, cColumnsIn, pcColumnsOut) {
        result := ComCall(8, this, "ptr", rgSortColumns, "uint", cColumnsIn, "uint*", pcColumnsOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcVisibleRows 
     * @returns {HRESULT} 
     */
    GetGroupSubsetCount(pcVisibleRows) {
        result := ComCall(9, this, "uint*", pcVisibleRows, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
