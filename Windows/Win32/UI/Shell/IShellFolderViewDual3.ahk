#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IShellFolderViewDual2.ahk

/**
 * Exposes methods that modify the current folder view.
 * @remarks
 * 
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shldisp/nn-shldisp-ishellfolderviewdual">IShellFolderViewDual</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shldisp/nn-shldisp-ishellfolderviewdual2">IShellFolderViewDual2</a> interfaces, from which it inherits.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shldisp/nn-shldisp-ishellfolderviewdual3
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellFolderViewDual3 extends IShellFolderViewDual2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellFolderViewDual3
     * @type {Guid}
     */
    static IID => Guid("{29ec8e6c-46d3-411f-baaa-611a6c9cac66}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_GroupBy", "put_GroupBy", "get_FolderFlags", "put_FolderFlags", "get_SortColumns", "put_SortColumns", "put_IconSize", "get_IconSize", "FilterView"]

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
     * @see https://docs.microsoft.com/windows/win32/api//shldisp/nf-shldisp-ishellfolderviewdual3-get_groupby
     */
    get_GroupBy() {
        pbstrGroupBy := BSTR()
        result := ComCall(19, this, "ptr", pbstrGroupBy, "HRESULT")
        return pbstrGroupBy
    }

    /**
     * Sets the column used in grouping the folder view.
     * @param {BSTR} bstrGroupBy Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a></b>
     * 
     * A <b>BSTR</b> that contains the column name.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shldisp/nf-shldisp-ishellfolderviewdual3-put_groupby
     */
    put_GroupBy(bstrGroupBy) {
        bstrGroupBy := bstrGroupBy is String ? BSTR.Alloc(bstrGroupBy).Value : bstrGroupBy

        result := ComCall(20, this, "ptr", bstrGroupBy, "HRESULT")
        return result
    }

    /**
     * Gets the settings for the current folder.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * When this method returns, contains a pointer to the current setting flags.  For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folderflags">FOLDERFLAGS</a>.
     * @see https://docs.microsoft.com/windows/win32/api//shldisp/nf-shldisp-ishellfolderviewdual3-get_folderflags
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shldisp/nf-shldisp-ishellfolderviewdual3-put_folderflags
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
     * @see https://docs.microsoft.com/windows/win32/api//shldisp/nf-shldisp-ishellfolderviewdual3-get_sortcolumns
     */
    get_SortColumns() {
        pbstrSortColumns := BSTR()
        result := ComCall(23, this, "ptr", pbstrSortColumns, "HRESULT")
        return pbstrSortColumns
    }

    /**
     * Sets the names of the columns to be sorted.
     * @param {BSTR} bstrSortColumns Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a></b>
     * 
     * The <b>BSTR</b> that contains the names of the columns to be sorted for the current folder.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shldisp/nf-shldisp-ishellfolderviewdual3-put_sortcolumns
     */
    put_SortColumns(bstrSortColumns) {
        bstrSortColumns := bstrSortColumns is String ? BSTR.Alloc(bstrSortColumns).Value : bstrSortColumns

        result := ComCall(24, this, "ptr", bstrSortColumns, "HRESULT")
        return result
    }

    /**
     * Sets the icon size setting for the current folder.
     * @param {Integer} iIconSize Type: <b>int</b>
     * 
     * The icon size value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shldisp/nf-shldisp-ishellfolderviewdual3-put_iconsize
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
     * @see https://docs.microsoft.com/windows/win32/api//shldisp/nf-shldisp-ishellfolderviewdual3-get_iconsize
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shldisp/nf-shldisp-ishellfolderviewdual3-filterview
     */
    FilterView(bstrFilterText) {
        bstrFilterText := bstrFilterText is String ? BSTR.Alloc(bstrFilterText).Value : bstrFilterText

        result := ComCall(27, this, "ptr", bstrFilterText, "HRESULT")
        return result
    }
}
