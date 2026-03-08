#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables the manipulation of columns and indicates the kind of information that is to be presented in the result view pane of the console.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-iheaderctrl
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IHeaderCtrl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHeaderCtrl
     * @type {Guid}
     */
    static IID => Guid("{43136eb3-d36c-11cf-adbc-00aa00a80033}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InsertColumn", "DeleteColumn", "SetColumnText", "GetColumnText", "SetColumnWidth", "GetColumnWidth"]

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
        result := ComCall(6, this, "int", nCol, "ptr*", &pText := 0, "HRESULT")
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
}
