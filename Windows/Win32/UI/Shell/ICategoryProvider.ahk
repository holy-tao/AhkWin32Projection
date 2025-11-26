#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IEnumGUID.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a list of categorizers registered on an IShellFolder.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-icategoryprovider
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ICategoryProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICategoryProvider
     * @type {Guid}
     */
    static IID => Guid("{9af64809-5864-4c26-a720-c1f78c086ee3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CanCategorizeOnSCID", "GetDefaultCategory", "GetCategoryForSCID", "EnumCategories", "GetCategoryName", "CreateCategory"]

    /**
     * Determines whether a column can be used as a category.
     * @param {Pointer<PROPERTYKEY>} pscid Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/shell/objects">SHCOLUMNID</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/shell/objects">SHCOLUMNID</a> structure that identifies the column. Valid only when S_OK is returned. The GUID contained in this structure is then passed to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icategoryprovider-createcategory">ICategoryProvider::CreateCategory</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if the column can be used as a category or S_FALSE if not.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-icategoryprovider-cancategorizeonscid
     */
    CanCategorizeOnSCID(pscid) {
        result := ComCall(3, this, "ptr", pscid, "HRESULT")
        return result
    }

    /**
     * Enables the folder to override the default grouping.
     * @param {Pointer<Guid>} pguid Type: <b>GUID*</b>
     * 
     * Not used.
     * @param {Pointer<PROPERTYKEY>} pscid Type: <b><a href="https://docs.microsoft.com/windows/desktop/shell/objects">SHCOLUMNID</a>*</b>
     * 
     * When this method returns, contains a pointer to a <a href="https://docs.microsoft.com/windows/desktop/shell/objects">SHCOLUMNID</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise, including the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no default group.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-icategoryprovider-getdefaultcategory
     */
    GetDefaultCategory(pguid, pscid) {
        result := ComCall(4, this, "ptr", pguid, "ptr", pscid, "HRESULT")
        return result
    }

    /**
     * Gets a GUID that represents the categorizer to use for the specified Shell column.
     * @param {Pointer<PROPERTYKEY>} pscid Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/shell/objects">SHCOLUMNID</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/shell/objects">SHCOLUMNID</a> structure.
     * @returns {Guid} Type: <b>GUID*</b>
     * 
     * When this method returns, contains a pointer to a GUID that represents the categorizer to use for the <a href="https://docs.microsoft.com/windows/desktop/shell/objects">SHCOLUMNID</a> pointed to by <i>pscid</i>.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-icategoryprovider-getcategoryforscid
     */
    GetCategoryForSCID(pscid) {
        pguid := Guid()
        result := ComCall(5, this, "ptr", pscid, "ptr", pguid, "HRESULT")
        return pguid
    }

    /**
     * Gets the enumerator for the list of GUIDs that represent categories.
     * @returns {IEnumGUID} Type: <b>IEnumGUID**</b>
     * 
     * When this method returns, contains the address of a pointer to an <b>IEnumGUID</b> interface that specifies a list of GUIDs that represent categories.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-icategoryprovider-enumcategories
     */
    EnumCategories() {
        result := ComCall(6, this, "ptr*", &penum := 0, "HRESULT")
        return IEnumGUID(penum)
    }

    /**
     * Gets the name of the specified category.
     * @param {Pointer<Guid>} pguid Type: <b>const GUID*</b>
     * 
     * A pointer to a GUID.
     * @param {PWSTR} pszName Type: <b>LPWSTR</b>
     * 
     * When this method returns, contains a pointer to a string that receives the name of the category.
     * @param {Integer} cch Type: <b>UINT</b>
     * 
     * An integer that receives the number of characters in the string.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-icategoryprovider-getcategoryname
     */
    GetCategoryName(pguid, pszName, cch) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(7, this, "ptr", pguid, "ptr", pszName, "uint", cch, "HRESULT")
        return result
    }

    /**
     * Creates a category object.
     * @param {Pointer<Guid>} pguid Type: <b>const GUID*</b>
     * 
     * A pointer to the <b>GUID</b> for the category object.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The identifier of the object to return. Currently, the only value supported by the system folder view object is IID_ICategorizer.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains the address of a pointer to the category object.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-icategoryprovider-createcategory
     */
    CreateCategory(pguid, riid) {
        result := ComCall(8, this, "ptr", pguid, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
