#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\CATEGORY_INFO.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that are used to obtain information about item identifier lists.
 * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nn-shobjidl_core-icategorizer
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ICategorizer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICategorizer
     * @type {Guid}
     */
    static IID => Guid("{a3b14589-9174-49a8-89a3-06a1ae2b9ba7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDescription", "GetCategory", "GetCategoryInfo", "CompareCategory"]

    /**
     * Gets the name of a categorizer, such as Group By Device Type, that can be displayed in the UI.
     * @remarks
     * In the case of the system folder view object, if the description at <i>pszDesc</i> matches one of the category names listed in the folder's <b>Arrange Icons By</b> menu, a dot is placed by that name when the menu is displayed, either through the <b>View</b> menu or through the context menu.
     * @param {PWSTR} pszDesc Type: <b>LPWSTR</b>
     * 
     * When this method returns, contains a pointer to a string of length <i>cch</i> that contains the categorizer name.
     * @param {Integer} cch Type: <b>UINT</b>
     * 
     * The number of characters in the <i>pszDesc</i> buffer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-icategorizer-getdescription
     */
    GetDescription(pszDesc, cch) {
        pszDesc := pszDesc is String ? StrPtr(pszDesc) : pszDesc

        result := ComCall(3, this, "ptr", pszDesc, "uint", cch, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets a list of categories associated with a list of identifiers.
     * @remarks
     * The <b>ICategorizer::GetCategory</b> method accepts an array of pointers to item identifier lists (PIDLs) and fills an array of category identifiers.
     * 
     * <div class="alert"><b>Important</b>   The value -1 is an invalid category identifier.</div>
     * <div> </div>
     * @param {Integer} cidl Type: <b>UINT</b>
     * 
     * The number of items in an item identifier list array.
     * @param {Pointer<Pointer<ITEMIDLIST>>} apidl Type: <b>PCUITEMID_CHILD_ARRAY*</b>
     * 
     * A pointer to an array of <i>cidl</i> item identifier list pointers.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * When this method returns, contains a pointer to an array of <i>cidl</i> category identifiers.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-icategorizer-getcategory
     */
    GetCategory(cidl, apidl) {
        apidlMarshal := apidl is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "uint", cidl, apidlMarshal, apidl, "uint*", &rgCategoryIds := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return rgCategoryIds
    }

    /**
     * Gets information about a category, such as the default display and the text to display in the UI.
     * @param {Integer} dwCategoryId Type: <b>DWORD</b>
     * 
     * A <b>DWORD</b> that specifies a category identifier.
     * @returns {CATEGORY_INFO} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-category_info">CATEGORY_INFO</a>*</b>
     * 
     * When this method returns, contains a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-category_info">CATEGORY_INFO</a> structure that contains the category information.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-icategorizer-getcategoryinfo
     */
    GetCategoryInfo(dwCategoryId) {
        pci := CATEGORY_INFO()
        result := ComCall(5, this, "uint", dwCategoryId, "ptr", pci, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pci
    }

    /**
     * Determines the relative order of two items in their item identifier lists, and hence in the UI.
     * @remarks
     * The following table shows the values returned in the CODE field of the HRESULT.
     * 
     *     			
     * 
     * 
     * <table class="clsStd">
     * <tr>
     * <td>Less than zero </td>
     * <td>The first item should precede the second (<i>dwCategoryId1</i> &lt; <i>dwCategoryId2</i>).</td>
     * </tr>
     * <tr>
     * <td>Greater than zero </td>
     * <td>The first item should follow the second (<i>dwCategoryId1</i> &gt; <i>dwCategoryId2</i>).</td>
     * </tr>
     * <tr>
     * <td>Zero </td>
     * <td>The two items are the same (<i>dwCategoryId1</i> = <i>dwCategoryId2</i>).</td>
     * </tr>
     * </table>
     * @param {Integer} csfFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-catsort_flags">CATSORT_FLAGS</a></b>
     * 
     * A flag that specifies how the comparison should be performed. The parameter should be one of the values in <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-catsort_flags">CATSORT_FLAGS</a>.
     * @param {Integer} dwCategoryId1 Type: <b>DWORD</b>
     * 
     * A <b>DWORD</b> that specifies the first category identifier to use in the comparison.
     * @param {Integer} dwCategoryId2 Type: <b>DWORD</b>
     * 
     * A <b>DWORD</b> that specifies the second category identifier to use in the comparison.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method is successful, the CODE field of the HRESULT contains a value that specifies the outcome of the comparison, otherwise it returns a COM error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-icategorizer-comparecategory
     */
    CompareCategory(csfFlags, dwCategoryId1, dwCategoryId2) {
        result := ComCall(6, this, "int", csfFlags, "uint", dwCategoryId1, "uint", dwCategoryId2, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
