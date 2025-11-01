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
     * 
     * @param {Pointer<BSTR>} pbstrGroupBy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual3-get_groupby
     */
    get_GroupBy(pbstrGroupBy) {
        result := ComCall(19, this, "ptr", pbstrGroupBy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrGroupBy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual3-put_groupby
     */
    put_GroupBy(bstrGroupBy) {
        bstrGroupBy := bstrGroupBy is String ? BSTR.Alloc(bstrGroupBy).Value : bstrGroupBy

        result := ComCall(20, this, "ptr", bstrGroupBy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual3-get_folderflags
     */
    get_FolderFlags(pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual3-put_folderflags
     */
    put_FolderFlags(dwFlags) {
        result := ComCall(22, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSortColumns 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual3-get_sortcolumns
     */
    get_SortColumns(pbstrSortColumns) {
        result := ComCall(23, this, "ptr", pbstrSortColumns, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrSortColumns 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual3-put_sortcolumns
     */
    put_SortColumns(bstrSortColumns) {
        bstrSortColumns := bstrSortColumns is String ? BSTR.Alloc(bstrSortColumns).Value : bstrSortColumns

        result := ComCall(24, this, "ptr", bstrSortColumns, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iIconSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual3-put_iconsize
     */
    put_IconSize(iIconSize) {
        result := ComCall(25, this, "int", iIconSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} piIconSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual3-get_iconsize
     */
    get_IconSize(piIconSize) {
        piIconSizeMarshal := piIconSize is VarRef ? "int*" : "ptr"

        result := ComCall(26, this, piIconSizeMarshal, piIconSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrFilterText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual3-filterview
     */
    FilterView(bstrFilterText) {
        bstrFilterText := bstrFilterText is String ? BSTR.Alloc(bstrFilterText).Value : bstrFilterText

        result := ComCall(27, this, "ptr", bstrFilterText, "HRESULT")
        return result
    }
}
