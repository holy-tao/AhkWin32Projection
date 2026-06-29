#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FOLDERLOGICALVIEWMODE.ahk" { FOLDERLOGICALVIEWMODE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Search\ICondition.ahk" { ICondition }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }
#Import "..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IShellItemArray.ahk" { IShellItemArray }
#Import ".\SORTCOLUMN.ahk" { SORTCOLUMN }

/**
 * Exposes methods that create and modify search folders.
 * @remarks
 * To implement this interface use class ID <b>CLSID_SearchFolderItemFactory</b>.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-isearchfolderitemfactory
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ISearchFolderItemFactory extends IUnknown {
    /**
     * The interface identifier for ISearchFolderItemFactory
     * @type {Guid}
     */
    static IID := Guid("{a0ffbc28-5482-4366-be27-3e81e78e06c2}")

    /**
     * The class identifier for SearchFolderItemFactory
     * @type {Guid}
     */
    static CLSID := Guid("{14010e02-bbbd-41f0-88e3-eda371216584}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISearchFolderItemFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetDisplayName           : IntPtr
        SetFolderTypeID          : IntPtr
        SetFolderLogicalViewMode : IntPtr
        SetIconSize              : IntPtr
        SetVisibleColumns        : IntPtr
        SetSortColumns           : IntPtr
        SetGroupColumn           : IntPtr
        SetStacks                : IntPtr
        SetScope                 : IntPtr
        SetCondition             : IntPtr
        GetShellItem             : IntPtr
        GetIDList                : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISearchFolderItemFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the search folder display name, as specified.
     * @remarks
     * Calling this method is required. A display name must be set.
     * @param {PWSTR} pszDisplayName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a folder display name as a Unicode string.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns a success value if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-isearchfolderitemfactory-setdisplayname
     */
    SetDisplayName(pszDisplayName) {
        pszDisplayName := pszDisplayName is String ? StrPtr(pszDisplayName) : pszDisplayName

        result := ComCall(3, this, "ptr", pszDisplayName, "HRESULT")
        return result
    }

    /**
     * Sets a search folder type ID, as specified.
     * @param {Guid} ftid Type: <b><a href="https://docs.microsoft.com/windows/desktop/shell/foldertypeid">FOLDERTYPEID</a></b>
     * 
     * The FOLDERTYPEID, which is a <b>GUID</b> used to identify folder types within the system. The default is <b>FOLDERTYPID_Library</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns a success value if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-isearchfolderitemfactory-setfoldertypeid
     */
    SetFolderTypeID(ftid) {
        result := ComCall(4, this, Guid, ftid, "HRESULT")
        return result
    }

    /**
     * Sets folder logical view mode. The default settings are based on the FolderTypeID which is set by the ISearchFolderItemFactory::SetFolderTypeID method.
     * @param {FOLDERLOGICALVIEWMODE} flvm Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folderlogicalviewmode">FOLDERLOGICALVIEWMODE</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folderlogicalviewmode">FOLDERLOGICALVIEWMODE</a> value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns a success value if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-isearchfolderitemfactory-setfolderlogicalviewmode
     */
    SetFolderLogicalViewMode(flvm) {
        result := ComCall(5, this, FOLDERLOGICALVIEWMODE, flvm, "HRESULT")
        return result
    }

    /**
     * Sets the search folder icon size, as specified. The default settings are based on the FolderTypeID which is set by the ISearchFolderItemFactory::SetFolderTypeID method.
     * @param {Integer} iIconSize Type: <b>int</b>
     * 
     * The icon size.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns a success value if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-isearchfolderitemfactory-seticonsize
     */
    SetIconSize(iIconSize) {
        result := ComCall(6, this, "int", iIconSize, "HRESULT")
        return result
    }

    /**
     * Creates a new column list whose columns are all visible, given an array of PROPERTYKEY structures. The default is based on FolderTypeID.
     * @param {Integer} cVisibleColumns Type: <b>UINT</b>
     * 
     * The number of array elements.
     * @param {Pointer<PROPERTYKEY>} rgKey Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a>*</b>
     * 
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structures.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns a success value if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-isearchfolderitemfactory-setvisiblecolumns
     */
    SetVisibleColumns(cVisibleColumns, rgKey) {
        result := ComCall(7, this, "uint", cVisibleColumns, PROPERTYKEY.Ptr, rgKey, "HRESULT")
        return result
    }

    /**
     * Creates a list of sort column directions, as specified.
     * @param {Integer} cSortColumns Type: <b>UINT</b>
     * 
     * The number of sort columns.
     * @param {Pointer<SORTCOLUMN>} rgSortColumns Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-sortcolumn">SORTCOLUMN</a>*</b>
     * 
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-sortcolumn">SORTCOLUMN</a> structures containing sort direction.  The default is <b>PKEY_ItemNameDisplay</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns a success value if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-isearchfolderitemfactory-setsortcolumns
     */
    SetSortColumns(cSortColumns, rgSortColumns) {
        result := ComCall(8, this, "uint", cSortColumns, SORTCOLUMN.Ptr, rgSortColumns, "HRESULT")
        return result
    }

    /**
     * Sets a group column, as specified. If no group column is specified, no grouping occurs.
     * @param {Pointer<PROPERTYKEY>} keyGroup Type: <b>REFPROPERTYKEY</b>
     * 
     * A reference to a group column <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns a success value if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-isearchfolderitemfactory-setgroupcolumn
     */
    SetGroupColumn(keyGroup) {
        result := ComCall(9, this, PROPERTYKEY.Ptr, keyGroup, "HRESULT")
        return result
    }

    /**
     * Creates a list of stack keys, as specified. If this method is not called, by default the folder will not be stacked.
     * @param {Integer} cStackKeys Type: <b>UINT</b>
     * 
     * The number of stacks keys.
     * @param {Pointer<PROPERTYKEY>} rgStackKeys Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a>*</b>
     * 
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structures containing stack key information.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns a success value if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-isearchfolderitemfactory-setstacks
     */
    SetStacks(cStackKeys, rgStackKeys) {
        result := ComCall(10, this, "uint", cStackKeys, PROPERTYKEY.Ptr, rgStackKeys, "HRESULT")
        return result
    }

    /**
     * Sets search scope, as specified.
     * @param {IShellItemArray} psiaScope Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>*</b>
     * 
     * A pointer to the list of locations to search. The search will include this location and all its subcontainers. The default is <b>FOLDERID_Profile</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns a success value if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-isearchfolderitemfactory-setscope
     */
    SetScope(psiaScope) {
        result := ComCall(11, this, "ptr", psiaScope, "HRESULT")
        return result
    }

    /**
     * Sets the ICondition of the search. When this method is not called, the resulting search will have no filters applied.
     * @param {ICondition} pCondition Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a> interface.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-isearchfolderitemfactory-setcondition
     */
    SetCondition(pCondition) {
        result := ComCall(12, this, "ptr", pCondition, "HRESULT")
        return result
    }

    /**
     * Gets the search folder as a IShellItem.
     * @remarks
     * When the retrieved <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> is enumerated, it returns the search results.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the desired IID.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> interface pointer specified in <i>riid</i>.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-isearchfolderitemfactory-getshellitem
     */
    GetShellItem(riid) {
        result := ComCall(13, this, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Gets the search folder as an ITEMIDLIST.
     * @returns {Pointer<ITEMIDLIST>} Type: <b>PIDLIST_ABSOLUTE*</b>
     * 
     * When this method returns successfully, contains a PIDL.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-isearchfolderitemfactory-getidlist
     */
    GetIDList() {
        result := ComCall(14, this, "ptr*", &ppidl := 0, "HRESULT")
        return ppidl
    }

    Query(iid) {
        if (ISearchFolderItemFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetDisplayName := CallbackCreate(GetMethod(implObj, "SetDisplayName"), flags, 2)
        this.vtbl.SetFolderTypeID := CallbackCreate(GetMethod(implObj, "SetFolderTypeID"), flags, 2)
        this.vtbl.SetFolderLogicalViewMode := CallbackCreate(GetMethod(implObj, "SetFolderLogicalViewMode"), flags, 2)
        this.vtbl.SetIconSize := CallbackCreate(GetMethod(implObj, "SetIconSize"), flags, 2)
        this.vtbl.SetVisibleColumns := CallbackCreate(GetMethod(implObj, "SetVisibleColumns"), flags, 3)
        this.vtbl.SetSortColumns := CallbackCreate(GetMethod(implObj, "SetSortColumns"), flags, 3)
        this.vtbl.SetGroupColumn := CallbackCreate(GetMethod(implObj, "SetGroupColumn"), flags, 2)
        this.vtbl.SetStacks := CallbackCreate(GetMethod(implObj, "SetStacks"), flags, 3)
        this.vtbl.SetScope := CallbackCreate(GetMethod(implObj, "SetScope"), flags, 2)
        this.vtbl.SetCondition := CallbackCreate(GetMethod(implObj, "SetCondition"), flags, 2)
        this.vtbl.GetShellItem := CallbackCreate(GetMethod(implObj, "GetShellItem"), flags, 3)
        this.vtbl.GetIDList := CallbackCreate(GetMethod(implObj, "GetIDList"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetDisplayName)
        CallbackFree(this.vtbl.SetFolderTypeID)
        CallbackFree(this.vtbl.SetFolderLogicalViewMode)
        CallbackFree(this.vtbl.SetIconSize)
        CallbackFree(this.vtbl.SetVisibleColumns)
        CallbackFree(this.vtbl.SetSortColumns)
        CallbackFree(this.vtbl.SetGroupColumn)
        CallbackFree(this.vtbl.SetStacks)
        CallbackFree(this.vtbl.SetScope)
        CallbackFree(this.vtbl.SetCondition)
        CallbackFree(this.vtbl.GetShellItem)
        CallbackFree(this.vtbl.GetIDList)
    }
}
