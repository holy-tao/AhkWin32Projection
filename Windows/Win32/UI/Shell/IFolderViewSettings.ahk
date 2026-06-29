#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FOLDERFLAGS.ahk" { FOLDERFLAGS }
#Import ".\FOLDERLOGICALVIEWMODE.ahk" { FOLDERLOGICALVIEWMODE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\SORTCOLUMN.ahk" { SORTCOLUMN }

/**
 * Exposes methods to obtain folder view settings.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ifolderviewsettings
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IFolderViewSettings extends IUnknown {
    /**
     * The interface identifier for IFolderViewSettings
     * @type {Guid}
     */
    static IID := Guid("{ae8c987d-8797-4ed3-be72-2a47dd938db0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFolderViewSettings interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetColumnPropertyList : IntPtr
        GetGroupByProperty    : IntPtr
        GetViewMode           : IntPtr
        GetIconSize           : IntPtr
        GetFolderFlags        : IntPtr
        GetSortColumns        : IntPtr
        GetGroupSubsetCount   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFolderViewSettings.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets an ordered list of columns that corresponds to the column enumerated.
     * @param {Pointer<Guid>} riid A reference to the interface identifier (IID) of the IPropertyDescriptionList.
     * @returns {Pointer<Void>} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescriptionlist">IPropertyDescriptionList</a>**</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescriptionlist">IPropertyDescriptionList</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderviewsettings-getcolumnpropertylist
     */
    GetColumnPropertyList(riid) {
        result := ComCall(3, this, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Gets a grouping property.
     * @param {Pointer<PROPERTYKEY>} pkey Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure indicating the key by which content is grouped.
     * @param {Pointer<BOOL>} pfGroupAscending Type: <b>BOOL*</b>
     * 
     * A pointer to a value indicating whether grouping order is ascending.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderviewsettings-getgroupbyproperty
     */
    GetGroupByProperty(pkey, pfGroupAscending) {
        pfGroupAscendingMarshal := pfGroupAscending is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, PROPERTYKEY.Ptr, pkey, pfGroupAscendingMarshal, pfGroupAscending, "HRESULT")
        return result
    }

    /**
     * Gets a folder's logical view mode.
     * @returns {FOLDERLOGICALVIEWMODE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folderlogicalviewmode">FOLDERLOGICALVIEWMODE</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folderlogicalviewmode">FOLDERLOGICALVIEWMODE</a> value.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderviewsettings-getviewmode
     */
    GetViewMode() {
        result := ComCall(5, this, "int*", &plvm := 0, "HRESULT")
        return plvm
    }

    /**
     * Gets the folder icon size.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * A pointer to the icon size.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderviewsettings-geticonsize
     */
    GetIconSize() {
        result := ComCall(6, this, "uint*", &puIconSize := 0, "HRESULT")
        return puIconSize
    }

    /**
     * Gets folder view options flags.
     * @param {Pointer<FOLDERFLAGS>} pfolderMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folderflags">FOLDERFLAGS</a>*</b>
     * 
     * A pointer to a mask for folder view options.
     * @param {Pointer<FOLDERFLAGS>} pfolderFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folderflags">FOLDERFLAGS</a>*</b>
     * 
     * A pointer to a flag for folder view options.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderviewsettings-getfolderflags
     */
    GetFolderFlags(pfolderMask, pfolderFlags) {
        pfolderMaskMarshal := pfolderMask is VarRef ? "int*" : "ptr"
        pfolderFlagsMarshal := pfolderFlags is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pfolderMaskMarshal, pfolderMask, pfolderFlagsMarshal, pfolderFlags, "HRESULT")
        return result
    }

    /**
     * Gets sort column information.
     * @param {Pointer<SORTCOLUMN>} rgSortColumns Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-sortcolumn">SORTCOLUMN</a>*</b>
     * 
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-sortcolumn">SORTCOLUMN</a> structures.
     * @param {Integer} cColumnsIn Type: <b>UINT</b>
     * 
     * The source column count.
     * @param {Pointer<Integer>} pcColumnsOut Type: <b>UINT*</b>
     * 
     * A pointer to the <i>rgSortColumns</i> array length.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderviewsettings-getsortcolumns
     */
    GetSortColumns(rgSortColumns, cColumnsIn, pcColumnsOut) {
        pcColumnsOutMarshal := pcColumnsOut is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, SORTCOLUMN.Ptr, rgSortColumns, "uint", cColumnsIn, pcColumnsOutMarshal, pcColumnsOut, "HRESULT")
        return result
    }

    /**
     * Gets group count for visible rows.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * A pointer to group count.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderviewsettings-getgroupsubsetcount
     */
    GetGroupSubsetCount() {
        result := ComCall(9, this, "uint*", &pcVisibleRows := 0, "HRESULT")
        return pcVisibleRows
    }

    Query(iid) {
        if (IFolderViewSettings.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetColumnPropertyList := CallbackCreate(GetMethod(implObj, "GetColumnPropertyList"), flags, 3)
        this.vtbl.GetGroupByProperty := CallbackCreate(GetMethod(implObj, "GetGroupByProperty"), flags, 3)
        this.vtbl.GetViewMode := CallbackCreate(GetMethod(implObj, "GetViewMode"), flags, 2)
        this.vtbl.GetIconSize := CallbackCreate(GetMethod(implObj, "GetIconSize"), flags, 2)
        this.vtbl.GetFolderFlags := CallbackCreate(GetMethod(implObj, "GetFolderFlags"), flags, 3)
        this.vtbl.GetSortColumns := CallbackCreate(GetMethod(implObj, "GetSortColumns"), flags, 4)
        this.vtbl.GetGroupSubsetCount := CallbackCreate(GetMethod(implObj, "GetGroupSubsetCount"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetColumnPropertyList)
        CallbackFree(this.vtbl.GetGroupByProperty)
        CallbackFree(this.vtbl.GetViewMode)
        CallbackFree(this.vtbl.GetIconSize)
        CallbackFree(this.vtbl.GetFolderFlags)
        CallbackFree(this.vtbl.GetSortColumns)
        CallbackFree(this.vtbl.GetGroupSubsetCount)
    }
}
