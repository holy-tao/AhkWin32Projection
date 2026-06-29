#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }
#Import "..\..\System\Com\IDataObject.ahk" { IDataObject }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method that initializes Shell extensions for property sheets, shortcut menus, and drag-and-drop handlers (extensions that add items to shortcut menus during nondefault drag-and-drop operations).
 * @remarks
 * Implement <b>IShellExtInit</b> when you are writing a handler based on the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icontextmenu">IContextMenu</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellpropsheetext">IShellPropSheetExt</a> interface.
 * 
 * Note that Shell extensions based on other interfaces do not use this method of initialization.
 * 
 * You do not use this interface directly. The Shell calls it to initialize the handler.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ishellextinit
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IShellExtInit extends IUnknown {
    /**
     * The interface identifier for IShellExtInit
     * @type {Guid}
     */
    static IID := Guid("{000214e8-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShellExtInit interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShellExtInit.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes a property sheet extension, shortcut menu extension, or drag-and-drop handler.
     * @remarks
     * The meanings of some parameters depend on the extension type. For drag-and-drop handlers, the <i>pidlFolder</i> parameter specifies the destination folder (the drop target), the <i>pdtobj</i> parameter identifies the items being dropped, and the <i>hkeyProgID</i> parameter specifies the file type of the destination folder.
     * 
     * For <a href="https://docs.microsoft.com/windows/desktop/shell/context-menu-handlers">shortcut menu extensions</a>, <i>pdtobj</i> identifies the selected file objects, <i>hkeyProgID</i> identifies the <a href="https://docs.microsoft.com/windows/desktop/shell/fa-file-types">file type</a> of the object with focus, and <i>pidlFolder</i> is either <b>NULL</b> (for file objects) or specifies the folder for which the shortcut menu is being requested (for folder background shortcut menus).
     * 
     * For property sheet extensions, <i>pidlFolder</i> is <b>NULL</b>, <i>pdtobj</i> identifies the selected file objects, and <i>hkeyProgID</i> specifies the file type of the file object that has the focus.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * This is the first method that the Shell calls after it creates an instance of a property sheet extension, shortcut menu extension, or drag-and-drop handler.
     * @param {Pointer<ITEMIDLIST>} pidlFolder Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a> structure that uniquely identifies a folder. For property sheet extensions, this parameter is <b>NULL</b>. For shortcut menu extensions, it is the item identifier list for the folder that contains the item whose shortcut menu is being displayed. For nondefault drag-and-drop menu extensions, this parameter specifies the target folder.
     * @param {IDataObject} pdtobj Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface object that can be used to retrieve the objects being acted upon.
     * @param {HKEY} hkeyProgID Type: <b>HKEY</b>
     * 
     * The registry key for the file object or folder type.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellextinit-initialize
     */
    Initialize(pidlFolder, pdtobj, hkeyProgID) {
        result := ComCall(3, this, ITEMIDLIST.Ptr, pidlFolder, "ptr", pdtobj, HKEY, hkeyProgID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IShellExtInit.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
    }
}
