#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that enable inspection and manipulation of columns in the Windows Explorer Details view. Each column is referenced by a PROPERTYKEY structure, which names a property.
 * @remarks
 * 
  * This interface can be accessed even when the Windows Explorer window is in a non-column view mode such as icons, thumbnails, or tiles. It affects those views, as well as views in which the column header control displays the set of columns to which <b>IColumnManager</b> provides access.
  * 
  * The default implementation of the Windows Explorer view object, created by <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shcreateshellfolderviewex">SHCreateShellFolderViewEx</a>, supports this interface retrieved through <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a>. Code that runs in the Windows Explorer (such as view callbacks, context menus or drop targets) can access the view object using <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/cc678966(v=vs.85)">IServiceProvider::QueryService</a>, querying for <b>SID_SFolderView</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-icolumnmanager
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IColumnManager extends IUnknown{
    /**
     * The interface identifier for IColumnManager
     * @type {Guid}
     */
    static IID => Guid("{d8ec27bb-3f3b-4042-b10a-4acfd924d453}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} propkey 
     * @param {Pointer<CM_COLUMNINFO>} pcmci 
     * @returns {HRESULT} 
     */
    SetColumnInfo(propkey, pcmci) {
        result := ComCall(3, this, "ptr", propkey, "ptr", pcmci, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} propkey 
     * @param {Pointer<CM_COLUMNINFO>} pcmci 
     * @returns {HRESULT} 
     */
    GetColumnInfo(propkey, pcmci) {
        result := ComCall(4, this, "ptr", propkey, "ptr", pcmci, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<UInt32>} puCount 
     * @returns {HRESULT} 
     */
    GetColumnCount(dwFlags, puCount) {
        result := ComCall(5, this, "int", dwFlags, "uint*", puCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<PROPERTYKEY>} rgkeyOrder 
     * @param {Integer} cColumns 
     * @returns {HRESULT} 
     */
    GetColumns(dwFlags, rgkeyOrder, cColumns) {
        result := ComCall(6, this, "int", dwFlags, "ptr", rgkeyOrder, "uint", cColumns, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} rgkeyOrder 
     * @param {Integer} cVisible 
     * @returns {HRESULT} 
     */
    SetColumns(rgkeyOrder, cVisible) {
        result := ComCall(7, this, "ptr", rgkeyOrder, "uint", cVisible, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
