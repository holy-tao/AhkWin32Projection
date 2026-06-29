#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IEnumGUID.ahk" { IEnumGUID }
#Import "..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a list of categorizers registered on an IShellFolder.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-icategoryprovider
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ICategoryProvider extends IUnknown {
    /**
     * The interface identifier for ICategoryProvider
     * @type {Guid}
     */
    static IID := Guid("{9af64809-5864-4c26-a720-c1f78c086ee3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICategoryProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CanCategorizeOnSCID : IntPtr
        GetDefaultCategory  : IntPtr
        GetCategoryForSCID  : IntPtr
        EnumCategories      : IntPtr
        GetCategoryName     : IntPtr
        CreateCategory      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICategoryProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Determines whether a column can be used as a category.
     * @remarks
     * When using the System Folder View Object in Category view (<b>Show in Groups</b>), the titles of columns for which this method returns S_OK appear in the upper portion of the <b>Arrange Icons By</b> submenu.
     * @param {Pointer<PROPERTYKEY>} pscid Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/shell/objects">SHCOLUMNID</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/shell/objects">SHCOLUMNID</a> structure that identifies the column. Valid only when S_OK is returned. The GUID contained in this structure is then passed to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icategoryprovider-createcategory">ICategoryProvider::CreateCategory</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if the column can be used as a category or S_FALSE if not.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icategoryprovider-cancategorizeonscid
     */
    CanCategorizeOnSCID(pscid) {
        result := ComCall(3, this, PROPERTYKEY.Ptr, pscid, "HRESULT")
        return result
    }

    /**
     * Enables the folder to override the default grouping.
     * @remarks
     * <b>ICategoryProvider::GetDefaultCategory</b> returns an <a href="https://docs.microsoft.com/windows/desktop/shell/objects">SHCOLUMNID</a> structure that is used by the default categorizer. The method returns S_FALSE if a default group is not supported.
     * 
     * <b>ICategoryProvider::GetDefaultCategory</b> is called only when a folder is first opened. After that, the user's grouping choice is cached in the <a href="../oaidl/nn-oaidl-ipropertybag.md">property bag</a> storing the state of the view. To force a call to <b>ICategoryProvider::GetDefaultCategory</b> after the folder is first opened, the <b>Shell</b> and <b>ShellNoRoam</b> registry keys must be deleted. They are found in the following location.
     * 
     * <pre><b>HKEY_CURRENT_USER</b>
     *    <b>Software</b>
     *       <b>Microsoft</b>
     *          <b>Windows</b>
     *             <b>Shell</b>
     *             <b>ShellNoRoam</b></pre>
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icategoryprovider-getdefaultcategory
     */
    GetDefaultCategory(pguid, pscid) {
        result := ComCall(4, this, Guid.Ptr, pguid, PROPERTYKEY.Ptr, pscid, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icategoryprovider-getcategoryforscid
     */
    GetCategoryForSCID(pscid) {
        pguid := Guid()
        result := ComCall(5, this, PROPERTYKEY.Ptr, pscid, Guid.Ptr, pguid, "HRESULT")
        return pguid
    }

    /**
     * Gets the enumerator for the list of GUIDs that represent categories.
     * @remarks
     * In the case of the system folder view object, <b>ICategoryProvider::EnumCategories</b> is used to obtain additional categories that are not associated with a column. When the list of category GUIDs is returned through <i>penum</i>, the UI attempts to retrieve the name of each category. That name is then displayed as a category choice. In the case of Windows XP, that choice appears in the folder's <b>Arrange Icons By</b> menu.
     * @returns {IEnumGUID} Type: <b>IEnumGUID**</b>
     * 
     * When this method returns, contains the address of a pointer to an <b>IEnumGUID</b> interface that specifies a list of GUIDs that represent categories.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icategoryprovider-enumcategories
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icategoryprovider-getcategoryname
     */
    GetCategoryName(pguid, pszName, cch) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(7, this, Guid.Ptr, pguid, "ptr", pszName, "uint", cch, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icategoryprovider-createcategory
     */
    CreateCategory(pguid, riid) {
        result := ComCall(8, this, Guid.Ptr, pguid, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (ICategoryProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CanCategorizeOnSCID := CallbackCreate(GetMethod(implObj, "CanCategorizeOnSCID"), flags, 2)
        this.vtbl.GetDefaultCategory := CallbackCreate(GetMethod(implObj, "GetDefaultCategory"), flags, 3)
        this.vtbl.GetCategoryForSCID := CallbackCreate(GetMethod(implObj, "GetCategoryForSCID"), flags, 3)
        this.vtbl.EnumCategories := CallbackCreate(GetMethod(implObj, "EnumCategories"), flags, 2)
        this.vtbl.GetCategoryName := CallbackCreate(GetMethod(implObj, "GetCategoryName"), flags, 4)
        this.vtbl.CreateCategory := CallbackCreate(GetMethod(implObj, "CreateCategory"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CanCategorizeOnSCID)
        CallbackFree(this.vtbl.GetDefaultCategory)
        CallbackFree(this.vtbl.GetCategoryForSCID)
        CallbackFree(this.vtbl.EnumCategories)
        CallbackFree(this.vtbl.GetCategoryName)
        CallbackFree(this.vtbl.CreateCategory)
    }
}
