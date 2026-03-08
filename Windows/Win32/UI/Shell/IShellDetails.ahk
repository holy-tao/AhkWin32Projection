#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include Common\SHELLDETAILS.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposed by Shell folders to provide detailed information about the items in a folder.
 * @remarks
 * For Windows 2000 and later systems, folder objects should implement <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder2">IShellFolder2</a> instead of this interface. However, if your application needs to function on earlier systems, <b>IShellDetails</b> should also be exposed.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nn-shlobj_core-ishelldetails
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellDetails extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellDetails
     * @type {Guid}
     */
    static IID => Guid("{000214ec-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDetailsOf", "ColumnClick"]

    /**
     * Gets detailed information on an item in a Shell folder.
     * @remarks
     * This method has been superseded by the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder2">IShellFolder2</a> methods for Shell <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb776779(v=vs.85)">version 5.0</a> and later.
     * 
     * The <b>IShellDetails::GetDetailsOf</b> method provides access to the information that is displayed in the Windows Explorer Details view of a Shell folder. The column numbers, column titles, and item information that you see in the Details view are identical to those returned by <b>IShellDetails::GetDetailsOf</b>.
     * 
     * The available information fields and their column numbers vary depending on the particular folder. To enumerate the available fields call <b>IShellDetails::GetDetailsOf</b> with <i>pidl</i> set to <b>NULL</b> for increasing values of <i>iColumn</i>. This approach provides you with the title associated with each column index. When <i>iColumn</i> exceeds the number of columns supported by the folder, <b>IShellDetails::GetDetailsOf</b> will return E_FAIL. Bear in mind that these titles are localizable, and may not be the same for all locales.
     * 
     * File system folders have a large standard set of information fields. The first four fields are standard for all file system folders.
     *                 
     *                 
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Column Index</th>
     * <th>Column Title</th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>Name</td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>Size</td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>Type</td>
     * </tr>
     * <tr>
     * <td>3</td>
     * <td>Date Modified</td>
     * </tr>
     * </table>
     *  
     * 
     * File system folders may support a number of additional fields. However, they are not required to do so and the column indexes assigned to these fields may vary.
     * 
     * Each virtual folder has its own unique set of information fields. Typically, the item's display name is in column zero, but the order and content of the available fields depend on the implementation of the particular folder object.
     * 
     * <h3><a id="Note_to_Implementers"></a><a id="note_to_implementers"></a><a id="NOTE_TO_IMPLEMENTERS"></a>Note to Implementers</h3>
     * Folder objects should implement <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder2">IShellFolder2</a> instead of this interface.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PCUITEMID_CHILD</b>
     * 
     * The PIDL of the item that you are requesting information for. If this parameter is set to <b>NULL</b>, the title of the information field specified by <i>iColumn</i> will be returned in the <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-shelldetails">SHELLDETAILS</a> structure pointed to by <i>pDetails</i>.
     * @param {Integer} iColumn Type: <b>UINT</b>
     * 
     * The zero-based index of the desired information field. It is identical to column number of the information as it is displayed in a Windows Explorer Details view.
     * @returns {SHELLDETAILS} Type: <b>SHELLDETAILS*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-shelldetails">SHELLDETAILS</a> structure with the detail information.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishelldetails-getdetailsof
     */
    GetDetailsOf(pidl, iColumn) {
        pDetails := SHELLDETAILS()
        result := ComCall(3, this, "ptr", pidl, "uint", iColumn, "ptr", pDetails, "HRESULT")
        return pDetails
    }

    /**
     * Rearranges a column.
     * @remarks
     * This method is called when a client of a folder object wants to sort the object's items based on the contents of one of the Details columns. Folder objects typically return S_FALSE.
     * 
     * <h3><a id="Note_to_Implementers"></a><a id="note_to_implementers"></a><a id="NOTE_TO_IMPLEMENTERS"></a>Note to Implementers</h3>
     * For Windows 2000 and later systems, folder objects should implement <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder2">IShellFolder2</a> instead of this interface. However, if your application needs to function on earlier systems, it should also expose <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nn-shlobj_core-ishelldetails">IShellDetails</a>.
     * @param {Integer} iColumn Type: <b>UINT</b>
     * 
     * The index of the column to be rearranged.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_FALSE to tell the calling application to sort the selected column. Otherwise, returns S_OK if successful, a COM error code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishelldetails-columnclick
     */
    ColumnClick(iColumn) {
        result := ComCall(4, this, "uint", iColumn, "HRESULT")
        return result
    }
}
