#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IShellFolderViewDual2.ahk" { IShellFolderViewDual2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Exposes methods that modify the current folder view.
 * @remarks
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shldisp/nn-shldisp-ishellfolderviewdual">IShellFolderViewDual</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shldisp/nn-shldisp-ishellfolderviewdual2">IShellFolderViewDual2</a> interfaces, from which it inherits.
 * @see https://learn.microsoft.com/windows/win32/api/shldisp/nn-shldisp-ishellfolderviewdual3
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IShellFolderViewDual3 extends IShellFolderViewDual2 {
    /**
     * The interface identifier for IShellFolderViewDual3
     * @type {Guid}
     */
    static IID := Guid("{29ec8e6c-46d3-411f-baaa-611a6c9cac66}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShellFolderViewDual3 interfaces
    */
    struct Vtbl extends IShellFolderViewDual2.Vtbl {
        get_GroupBy     : IntPtr
        put_GroupBy     : IntPtr
        get_FolderFlags : IntPtr
        put_FolderFlags : IntPtr
        get_SortColumns : IntPtr
        put_SortColumns : IntPtr
        put_IconSize    : IntPtr
        get_IconSize    : IntPtr
        FilterView      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShellFolderViewDual3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    GroupBy {
        get => this.get_GroupBy()
        set => this.put_GroupBy(value)
    }

    /**
     * @type {Integer} 
     */
    FolderFlags {
        get => this.get_FolderFlags()
        set => this.put_FolderFlags(value)
    }

    /**
     * @type {BSTR} 
     */
    SortColumns {
        get => this.get_SortColumns()
        set => this.put_SortColumns(value)
    }

    /**
     * @type {Integer} 
     */
    IconSize {
        get => this.get_IconSize()
        set => this.put_IconSize(value)
    }

    /**
     * Gets the column used for grouping the folder view.
     * @returns {BSTR} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a>*</b>
     * 
     * When this method returns, contains a pointer to the column name.
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual3-get_groupby
     */
    get_GroupBy() {
        pbstrGroupBy := BSTR.Owned()
        result := ComCall(19, this, BSTR.Ptr, pbstrGroupBy, "HRESULT")
        return pbstrGroupBy
    }

    /**
     * Sets the column used in grouping the folder view.
     * @param {BSTR} bstrGroupBy Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a></b>
     * 
     * A <b>BSTR</b> that contains the column name.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual3-put_groupby
     */
    put_GroupBy(bstrGroupBy) {
        bstrGroupBy := bstrGroupBy is String ? BSTR.Alloc(bstrGroupBy).Value : bstrGroupBy

        result := ComCall(20, this, BSTR, bstrGroupBy, "HRESULT")
        return result
    }

    /**
     * Gets the settings for the current folder.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * When this method returns, contains a pointer to the current setting flags.  For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folderflags">FOLDERFLAGS</a>.
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual3-get_folderflags
     */
    get_FolderFlags() {
        result := ComCall(21, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * Sets the current folders settings.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * Flags that determine the folder settings. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folderflags">FOLDERFLAGS</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual3-put_folderflags
     */
    put_FolderFlags(dwFlags) {
        result := ComCall(22, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Gets the names of the columns used to sort the current folder.
     * @returns {BSTR} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a>*</b>
     * 
     * A <b>BSTR</b> that contains the column names.
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual3-get_sortcolumns
     */
    get_SortColumns() {
        pbstrSortColumns := BSTR.Owned()
        result := ComCall(23, this, BSTR.Ptr, pbstrSortColumns, "HRESULT")
        return pbstrSortColumns
    }

    /**
     * Sets the names of the columns to be sorted.
     * @param {BSTR} bstrSortColumns Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a></b>
     * 
     * The <b>BSTR</b> that contains the names of the columns to be sorted for the current folder.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual3-put_sortcolumns
     */
    put_SortColumns(bstrSortColumns) {
        bstrSortColumns := bstrSortColumns is String ? BSTR.Alloc(bstrSortColumns).Value : bstrSortColumns

        result := ComCall(24, this, BSTR, bstrSortColumns, "HRESULT")
        return result
    }

    /**
     * Sets the icon size setting for the current folder.
     * @param {Integer} iIconSize Type: <b>int</b>
     * 
     * The icon size value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual3-put_iconsize
     */
    put_IconSize(iIconSize) {
        result := ComCall(25, this, "int", iIconSize, "HRESULT")
        return result
    }

    /**
     * Gets the icon size setting for the current folder.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * When this method returns, contains a pointer to the icon size value.
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual3-get_iconsize
     */
    get_IconSize() {
        result := ComCall(26, this, "int*", &piIconSize := 0, "HRESULT")
        return piIconSize
    }

    /**
     * Sets the filter on the contents of the current view.
     * @param {BSTR} bstrFilterText Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a></b>
     * 
     * The BSTR that names the filter view for the current folder.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual3-filterview
     */
    FilterView(bstrFilterText) {
        bstrFilterText := bstrFilterText is String ? BSTR.Alloc(bstrFilterText).Value : bstrFilterText

        result := ComCall(27, this, BSTR, bstrFilterText, "HRESULT")
        return result
    }

    Query(iid) {
        if (IShellFolderViewDual3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_GroupBy := CallbackCreate(GetMethod(implObj, "get_GroupBy"), flags, 2)
        this.vtbl.put_GroupBy := CallbackCreate(GetMethod(implObj, "put_GroupBy"), flags, 2)
        this.vtbl.get_FolderFlags := CallbackCreate(GetMethod(implObj, "get_FolderFlags"), flags, 2)
        this.vtbl.put_FolderFlags := CallbackCreate(GetMethod(implObj, "put_FolderFlags"), flags, 2)
        this.vtbl.get_SortColumns := CallbackCreate(GetMethod(implObj, "get_SortColumns"), flags, 2)
        this.vtbl.put_SortColumns := CallbackCreate(GetMethod(implObj, "put_SortColumns"), flags, 2)
        this.vtbl.put_IconSize := CallbackCreate(GetMethod(implObj, "put_IconSize"), flags, 2)
        this.vtbl.get_IconSize := CallbackCreate(GetMethod(implObj, "get_IconSize"), flags, 2)
        this.vtbl.FilterView := CallbackCreate(GetMethod(implObj, "FilterView"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_GroupBy)
        CallbackFree(this.vtbl.put_GroupBy)
        CallbackFree(this.vtbl.get_FolderFlags)
        CallbackFree(this.vtbl.put_FolderFlags)
        CallbackFree(this.vtbl.get_SortColumns)
        CallbackFree(this.vtbl.put_SortColumns)
        CallbackFree(this.vtbl.put_IconSize)
        CallbackFree(this.vtbl.get_IconSize)
        CallbackFree(this.vtbl.FilterView)
    }
}
