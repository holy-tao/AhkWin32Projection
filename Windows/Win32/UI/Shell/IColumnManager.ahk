#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\PROPERTYKEY.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetColumnInfo", "GetColumnInfo", "GetColumnCount", "GetColumns", "SetColumns"]

    /**
     * Sets the state for a specified column.
     * @param {Pointer<PROPERTYKEY>} propkey Type: <b>REFPROPERTYKEY</b>
     * 
     * A reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure that identifies the column.
     * @param {Pointer<CM_COLUMNINFO>} pcmci Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-cm_columninfo">CM_COLUMNINFO</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-cm_columninfo">CM_COLUMNINFO</a> structure that contains the state to set for this column.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Column state set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Column state not set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pcmci</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-icolumnmanager-setcolumninfo
     */
    SetColumnInfo(propkey, pcmci) {
        result := ComCall(3, this, "ptr", propkey, "ptr", pcmci, "HRESULT")
        return result
    }

    /**
     * Gets information about each column:\_width, visibility, display name, and state.
     * @param {Pointer<PROPERTYKEY>} propkey Type: <b>REFPROPERTYKEY</b>
     * 
     * A reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure.
     * @param {Pointer<CM_COLUMNINFO>} pcmci Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-cm_columninfo">CM_COLUMNINFO</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-cm_columninfo">CM_COLUMNINFO</a> structure. On entry, set this structure's <b>dwMask</b> member to specify the information to retrieve. Also set its <b>cbSize</b> member. When this method returns successfully, the structure contains the requested information.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Column information obtained.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Column information not obtained.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that cbSize member of <i>pcmci</i> does not equal the size of CM_COLUMNINFO.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-icolumnmanager-getcolumninfo
     */
    GetColumnInfo(propkey, pcmci) {
        result := ComCall(4, this, "ptr", propkey, "ptr", pcmci, "HRESULT")
        return result
    }

    /**
     * Gets the column count for either the visible columns or the complete set of columns.
     * @param {Integer} dwFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-cm_enum_flags">CM_ENUM_FLAGS</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-cm_enum_flags">CM_ENUM_FLAGS</a> enumeration that specifies whether to show only visible columns or all columns regardless of visibility.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * Contains a pointer to the column count.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-icolumnmanager-getcolumncount
     */
    GetColumnCount(dwFlags) {
        result := ComCall(5, this, "int", dwFlags, "uint*", &puCount := 0, "HRESULT")
        return puCount
    }

    /**
     * Gets an array of PROPERTYKEY structures that represent the columns that the view supports. Includes either all columns or only those currently visible.
     * @param {Integer} dwFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-cm_enum_flags">CM_ENUM_FLAGS</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-cm_enum_flags">CM_ENUM_FLAGS</a> enumeration that specifies whether to show only visible columns or all columns regardless of visibility.
     * @param {Integer} cColumns Type: <b>UINT</b>
     * 
     * The length of the <i>rgkeyOrder</i> array.
     * @returns {PROPERTYKEY} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a>*</b>
     * 
     * On success, contains a pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structures that represent the columns.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-icolumnmanager-getcolumns
     */
    GetColumns(dwFlags, cColumns) {
        rgkeyOrder := PROPERTYKEY()
        result := ComCall(6, this, "int", dwFlags, "ptr", rgkeyOrder, "uint", cColumns, "HRESULT")
        return rgkeyOrder
    }

    /**
     * Sets the collection of columns for the view to display.
     * @param {Pointer<PROPERTYKEY>} rgkeyOrder Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a>*</b>
     * 
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structures that specify the columns to display.
     * @param {Integer} cVisible Type: <b>UINT</b>
     * 
     * The size of the <i>rgkeyOrder</i> array.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Collection set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Collection not set.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-icolumnmanager-setcolumns
     */
    SetColumns(rgkeyOrder, cVisible) {
        result := ComCall(7, this, "ptr", rgkeyOrder, "uint", cVisible, "HRESULT")
        return result
    }
}
