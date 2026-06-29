#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\IShellFolder.ahk" { IShellFolder }
#Import ".\DEFAULT_FOLDER_MENU_RESTRICTIONS.ahk" { DEFAULT_FOLDER_MENU_RESTRICTIONS }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }
#Import ".\IContextMenuCB.ahk" { IContextMenuCB }
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }

/**
 * Provides methods used to get and set shortcut menu information. This information is the same as that provided to SHCreateDefaultContextMenu through the DEFCONTEXTMENU structure.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-idefaultfoldermenuinitialize
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IDefaultFolderMenuInitialize extends IUnknown {
    /**
     * The interface identifier for IDefaultFolderMenuInitialize
     * @type {Guid}
     */
    static IID := Guid("{7690aa79-f8fc-4615-a327-36f7d18f5d91}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDefaultFolderMenuInitialize interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize          : IntPtr
        SetMenuRestrictions : IntPtr
        GetMenuRestrictions : IntPtr
        SetHandlerClsid     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDefaultFolderMenuInitialize.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * . (IDefaultFolderMenuInitialize.Initialize)
     * @param {HWND} _hwnd A handle to the shortcut menu.
     * @param {IContextMenuCB} pcmcb Type: <b><a href="nn-shobjidl_core-icontextmenucb.md">IContextMenuCB</a>*</b>
     * 
     * The address of the object that defines the callback for the shortcut menu.
     * @param {Pointer<ITEMIDLIST>} pidlFolder Type: **PCIDLIST_ABSOLUTE**
     * 
     * The address of an item identifier list that specifies the folder of the items. If NULL, this is computed from the *psf* parameter.
     * @param {IShellFolder} psf Type: <b><a href="nn-shobjidl_core-ishellfolder.md">IShellFolder</a>*</b>
     * 
     * The folder of the items.
     * @param {Integer} cidl Type: <b>UINT</b>
     * 
     * The count of items in the *apidl* parameter.
     * @param {Pointer<Pointer<ITEMIDLIST>>} apidl Type: <b>PCUITEMID_CHILD_ARRAY</b>
     * 
     * A pointer to an array of PIDL structures, each of which is an item to be operated on.
     * @param {IUnknown} punkAssociation Type: <b>IUnknown*</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nn-shlwapi-iqueryassociations">IQueryAssociations</a> object that specifies where to load extensions from.
     * @param {Integer} cKeys Type: <b>UINT</b>
     * 
     * The count of items in the *aKeys* parameter. May be zero.
     * @param {Pointer<HKEY>} aKeys Type: <b>const HKEY*</b>
     * 
     * Specifies where to load extensions from.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idefaultfoldermenuinitialize-initialize
     */
    Initialize(_hwnd, pcmcb, pidlFolder, psf, cidl, apidl, punkAssociation, cKeys, aKeys) {
        apidlMarshal := apidl is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, HWND, _hwnd, "ptr", pcmcb, ITEMIDLIST.Ptr, pidlFolder, "ptr", psf, "uint", cidl, apidlMarshal, apidl, "ptr", punkAssociation, "uint", cKeys, HKEY.Ptr, aKeys, "HRESULT")
        return result
    }

    /**
     * . (IDefaultFolderMenuInitialize.SetMenuRestrictions)
     * @param {DEFAULT_FOLDER_MENU_RESTRICTIONS} dfmrValues A bitwise combination of the [DEFAULT_FOLDER_MENU_RESTRICTIONS](ne-shobjidl_core-default_folder_menu_restrictions.md) values that specify the restrictions to set.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idefaultfoldermenuinitialize-setmenurestrictions
     */
    SetMenuRestrictions(dfmrValues) {
        result := ComCall(4, this, DEFAULT_FOLDER_MENU_RESTRICTIONS, dfmrValues, "HRESULT")
        return result
    }

    /**
     * . (IDefaultFolderMenuInitialize.GetMenuRestrictions)
     * @param {DEFAULT_FOLDER_MENU_RESTRICTIONS} dfmrMask A bitwise combination of the [DEFAULT_FOLDER_MENU_RESTRICTIONS](ne-shobjidl_core-default_folder_menu_restrictions.md) values that specify the mask of the restrictions to get.
     * @returns {DEFAULT_FOLDER_MENU_RESTRICTIONS} A bitwise combination of the [DEFAULT_FOLDER_MENU_RESTRICTIONS](ne-shobjidl_core-default_folder_menu_restrictions.md) values that specify the restrictions.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idefaultfoldermenuinitialize-getmenurestrictions
     */
    GetMenuRestrictions(dfmrMask) {
        result := ComCall(5, this, DEFAULT_FOLDER_MENU_RESTRICTIONS, dfmrMask, "int*", &pdfmrValues := 0, "HRESULT")
        return pdfmrValues
    }

    /**
     * . (IDefaultFolderMenuInitialize.SetHandlerClsid)
     * @param {Pointer<Guid>} rclsid Type: <b>REFCLSID</b>
     * 
     * The CLSID for the object defines the shortcut menu handler.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idefaultfoldermenuinitialize-sethandlerclsid
     */
    SetHandlerClsid(rclsid) {
        result := ComCall(6, this, Guid.Ptr, rclsid, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDefaultFolderMenuInitialize.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 10)
        this.vtbl.SetMenuRestrictions := CallbackCreate(GetMethod(implObj, "SetMenuRestrictions"), flags, 2)
        this.vtbl.GetMenuRestrictions := CallbackCreate(GetMethod(implObj, "GetMenuRestrictions"), flags, 3)
        this.vtbl.SetHandlerClsid := CallbackCreate(GetMethod(implObj, "SetHandlerClsid"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.SetMenuRestrictions)
        CallbackFree(this.vtbl.GetMenuRestrictions)
        CallbackFree(this.vtbl.SetHandlerClsid)
    }
}
