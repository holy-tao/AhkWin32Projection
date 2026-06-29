#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables the manipulation of columns and indicates the kind of information that is to be presented in the result view pane of the console.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-iheaderctrl
 * @namespace Windows.Win32.System.Mmc
 */
export default struct IHeaderCtrl extends IUnknown {
    /**
     * The interface identifier for IHeaderCtrl
     * @type {Guid}
     */
    static IID := Guid("{43136eb3-d36c-11cf-adbc-00aa00a80033}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHeaderCtrl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InsertColumn   : IntPtr
        DeleteColumn   : IntPtr
        SetColumnText  : IntPtr
        GetColumnText  : IntPtr
        SetColumnWidth : IntPtr
        GetColumnWidth : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHeaderCtrl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds a column to a default result pane.
     * @remarks
     * MMC does not persist in memory any changes made to a column set due to the action of <b>IHeaderCtrl::InsertColumn</b>, so snap-ins must update persisted column configuration data after inserting columns into a column set. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/iheaderctrl2-and-column-persistence">IHeaderCtrl2 and Column Persistence</a> for more information.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Calls to 
     * <b>InsertColumn</b> fail if any items have already been inserted into the result view.
     * @param {Integer} nCol A zero-based index of the column being inserted.
     * @param {PWSTR} title A value that specifies the string that represents the title of the column being inserted. This string can have  a maximum length of <b>MAX_PATH</b> characters.
     * @param {Integer} nFormat A value that specifies the position of text within the column. For column zero, <i>nFormat</i> must be <b>LVCFMT_LEFT</b>. This value must be one of the following:
     * @param {Integer} nWidth A value that specifies the width of the column in pixels. This value must be one of the following:
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iheaderctrl-insertcolumn
     */
    InsertColumn(nCol, title, nFormat, nWidth) {
        title := title is String ? StrPtr(title) : title

        result := ComCall(3, this, "int", nCol, "ptr", title, "int", nFormat, "int", nWidth, "HRESULT")
        return result
    }

    /**
     * Removes a column from the header of the result view.
     * @remarks
     * If a column is removed, all columns with indexes greater than the one removed are adjusted down by one.
     * 
     * MMC does not persist in memory any changes made to a column set due to the action of <b>IHeaderCtrl::DeleteColumn</b>, so snap-ins must update persisted column configuration data after deleting columns from a column set. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/iheaderctrl2-and-column-persistence">IHeaderCtrl2 and Column Persistence</a>.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * This method returns <i>E_FAIL</i> when an item has already been inserted into the result view.
     * @param {Integer} nCol A zero-based index that identifies the column to be removed.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iheaderctrl-deletecolumn
     */
    DeleteColumn(nCol) {
        result := ComCall(4, this, "int", nCol, "HRESULT")
        return result
    }

    /**
     * Sets the text of the title in a specific column.
     * @param {Integer} nCol A zero-based index that specifies the location of the column.
     * @param {PWSTR} title A pointer to the string that represents the title of the column being inserted. This string can have  a maximum length of MAX_PATH characters.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iheaderctrl-setcolumntext
     */
    SetColumnText(nCol, title) {
        title := title is String ? StrPtr(title) : title

        result := ComCall(5, this, "int", nCol, "ptr", title, "HRESULT")
        return result
    }

    /**
     * Retrieves text from a specified column.
     * @remarks
     * <b>GetColumnText</b> allocates the string for the result and stores its pointer at the location specified by pText. The caller must free the memory using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @param {Integer} nCol A zero-based index that identifies the column from which the text is to be retrieved.
     * @returns {PWSTR} A pointer to the address of the text to be retrieved. This pointer must not be <b>NULL</b>. The user must call 
     * <b>CoTaskMemFree</b> on the returned text.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iheaderctrl-getcolumntext
     */
    GetColumnText(nCol) {
        result := ComCall(6, this, "int", nCol, PWSTR.Ptr, &pText := 0, "HRESULT")
        return pText
    }

    /**
     * Sets the width, in pixels, of a specific column.
     * @remarks
     * MMC does not persist in memory any changes made to a column set due to the action of <b>IHeaderCtrl::SetColumnWidth</b>, so snap-ins must update persisted column configuration data after modifying the width of columns in a column set. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/iheaderctrl2-and-column-persistence">IHeaderCtrl2 and Column Persistence</a>.
     * 
     * The HIDE_COLUMN flag for the nWidth parameter is not supported for 
     * SetColumnWidth. If the snap-in must hide the column, it must call <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iconsole-selectscopeitem">IConsole::SelectScopeItem</a> to reselect the scope item and then in the resulting call to the snap-in's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-show">MMCN_SHOW</a> notification handler, it must use nWidth=HIDE_COLUMN when inserting the column (in the call to <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iheaderctrl-insertcolumn">IHeaderCtrl::InsertColumn</a>).
     * @param {Integer} nCol A zero-based index that specifies the location of the column relative to other columns in the result pane.
     * @param {Integer} nWidth A value that specifies the width of the column. This value must be in pixels, or it can be the following value:
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iheaderctrl-setcolumnwidth
     */
    SetColumnWidth(nCol, nWidth) {
        result := ComCall(7, this, "int", nCol, "int", nWidth, "HRESULT")
        return result
    }

    /**
     * Retrieves the width, in pixels, of the column.
     * @remarks
     * This method can be called successfully even if items are already in the list.
     * 
     * If the column is currently hidden, 
     * GetColumnWidth returns 0 (zero) as the column width. However, because a column can have a (0) zero width without being hidden, a return value of (0) zero does not mean that the column is hidden. Therefore, the snap-in should call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icolumndata-getcolumnconfigdata">IColumnData::GetColumnConfigData</a> to identify which columns are hidden.
     * @param {Integer} nCol A zero-based index of the column from which the width is to be retrieved.
     * @returns {Integer} A pointer to width, in pixels, of the column. This parameter must not be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iheaderctrl-getcolumnwidth
     */
    GetColumnWidth(nCol) {
        result := ComCall(8, this, "int", nCol, "int*", &pWidth := 0, "HRESULT")
        return pWidth
    }

    Query(iid) {
        if (IHeaderCtrl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InsertColumn := CallbackCreate(GetMethod(implObj, "InsertColumn"), flags, 5)
        this.vtbl.DeleteColumn := CallbackCreate(GetMethod(implObj, "DeleteColumn"), flags, 2)
        this.vtbl.SetColumnText := CallbackCreate(GetMethod(implObj, "SetColumnText"), flags, 3)
        this.vtbl.GetColumnText := CallbackCreate(GetMethod(implObj, "GetColumnText"), flags, 3)
        this.vtbl.SetColumnWidth := CallbackCreate(GetMethod(implObj, "SetColumnWidth"), flags, 3)
        this.vtbl.GetColumnWidth := CallbackCreate(GetMethod(implObj, "GetColumnWidth"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InsertColumn)
        CallbackFree(this.vtbl.DeleteColumn)
        CallbackFree(this.vtbl.SetColumnText)
        CallbackFree(this.vtbl.GetColumnText)
        CallbackFree(this.vtbl.SetColumnWidth)
        CallbackFree(this.vtbl.GetColumnWidth)
    }
}
