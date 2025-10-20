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
     * 
     * @param {Pointer<BSTR>} pbstrGroupBy 
     * @returns {HRESULT} 
     */
    get_GroupBy(pbstrGroupBy) {
        result := ComCall(19, this, "ptr", pbstrGroupBy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrGroupBy 
     * @returns {HRESULT} 
     */
    put_GroupBy(bstrGroupBy) {
        bstrGroupBy := bstrGroupBy is String ? BSTR.Alloc(bstrGroupBy).Value : bstrGroupBy

        result := ComCall(20, this, "ptr", bstrGroupBy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwFlags 
     * @returns {HRESULT} 
     */
    get_FolderFlags(pdwFlags) {
        result := ComCall(21, this, "uint*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    put_FolderFlags(dwFlags) {
        result := ComCall(22, this, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSortColumns 
     * @returns {HRESULT} 
     */
    get_SortColumns(pbstrSortColumns) {
        result := ComCall(23, this, "ptr", pbstrSortColumns, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrSortColumns 
     * @returns {HRESULT} 
     */
    put_SortColumns(bstrSortColumns) {
        bstrSortColumns := bstrSortColumns is String ? BSTR.Alloc(bstrSortColumns).Value : bstrSortColumns

        result := ComCall(24, this, "ptr", bstrSortColumns, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iIconSize 
     * @returns {HRESULT} 
     */
    put_IconSize(iIconSize) {
        result := ComCall(25, this, "int", iIconSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} piIconSize 
     * @returns {HRESULT} 
     */
    get_IconSize(piIconSize) {
        result := ComCall(26, this, "int*", piIconSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrFilterText 
     * @returns {HRESULT} 
     */
    FilterView(bstrFilterText) {
        bstrFilterText := bstrFilterText is String ? BSTR.Alloc(bstrFilterText).Value : bstrFilterText

        result := ComCall(27, this, "ptr", bstrFilterText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
