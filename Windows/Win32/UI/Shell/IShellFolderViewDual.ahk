#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\FolderItem.ahk" { FolderItem }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\FolderItems.ahk" { FolderItems }
#Import ".\Folder.ahk" { Folder }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Exposes methods that modify the view and select items in the current folder. (IShellFolderViewDual)
 * @see https://learn.microsoft.com/windows/win32/api/shldisp/nn-shldisp-ishellfolderviewdual
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IShellFolderViewDual extends IDispatch {
    /**
     * The interface identifier for IShellFolderViewDual
     * @type {Guid}
     */
    static IID := Guid("{e7a1af80-4d96-11cf-960c-0080c7f4ee85}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShellFolderViewDual interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Application : IntPtr
        get_Parent      : IntPtr
        get_Folder      : IntPtr
        SelectedItems   : IntPtr
        get_FocusedItem : IntPtr
        SelectItem      : IntPtr
        PopupItemMenu   : IntPtr
        get_Script      : IntPtr
        get_ViewOptions : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShellFolderViewDual.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IDispatch} 
     */
    Application {
        get => this.get_Application()
    }

    /**
     * @type {IDispatch} 
     */
    Parent {
        get => this.get_Parent()
    }

    /**
     * @type {Folder} 
     */
    Folder {
        get => this.get_Folder()
    }

    /**
     * @type {FolderItem} 
     */
    FocusedItem {
        get => this.get_FocusedItem()
    }

    /**
     * @type {IDispatch} 
     */
    Script {
        get => this.get_Script()
    }

    /**
     * @type {Integer} 
     */
    ViewOptions {
        get => this.get_ViewOptions()
    }

    /**
     * Gets the application object.
     * @returns {IDispatch} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a>**</b>
     * 
     * The application object.
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual-get_application
     */
    get_Application() {
        result := ComCall(7, this, "ptr*", &ppid := 0, "HRESULT")
        return IDispatch(ppid)
    }

    /**
     * Not implemented. (IShellFolderViewDual.get_Parent)
     * @returns {IDispatch} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a>**</b>
     * 
     * The application object.
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual-get_parent
     */
    get_Parent() {
        result := ComCall(8, this, "ptr*", &ppid := 0, "HRESULT")
        return IDispatch(ppid)
    }

    /**
     * Gets the Folder object that represents the view.
     * @returns {Folder} Type: <b><a href="https://docs.microsoft.com/windows/win32/shell/folder">Folder</a>**</b>
     * 
     * The folder object.
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual-get_folder
     */
    get_Folder() {
        result := ComCall(9, this, "ptr*", &ppid := 0, "HRESULT")
        return Folder(ppid)
    }

    /**
     * Gets a FolderItems object that represents all of the selected items in the view.
     * @returns {FolderItems} Type: <b><a href="https://docs.microsoft.com/windows/win32/shell/folderitem">FolderItems</a>**</b>
     * 
     * The FolderItems object.
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual-selecteditems
     */
    SelectedItems() {
        result := ComCall(10, this, "ptr*", &ppid := 0, "HRESULT")
        return FolderItems(ppid)
    }

    /**
     * Gets the FolderItem object that represents the item that has input focus.
     * @returns {FolderItem} Type: <b><a href="https://docs.microsoft.com/windows/win32/shell/folderitem">FolderItem</a>**</b>
     * 
     * The FolderItem object with input focus.
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual-get_focuseditem
     */
    get_FocusedItem() {
        result := ComCall(11, this, "ptr*", &ppid := 0, "HRESULT")
        return FolderItem(ppid)
    }

    /**
     * Sets the selection state of an item in the view.
     * @param {Pointer<VARIANT>} pvfi Type: <b>VARIANT*</b>
     * 
     * A VARIANT object.
     * @param {Integer} dwFlags Type: <b>int</b>
     * 
     * The flags representing the state of the object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual-selectitem
     */
    SelectItem(pvfi, dwFlags) {
        result := ComCall(12, this, VARIANT.Ptr, pvfi, "int", dwFlags, "HRESULT")
        return result
    }

    /**
     * Creates a shortcut menu for the specified item and returns the selected command string.
     * @param {FolderItem} pfi Type: <b><a href="https://docs.microsoft.com/windows/win32/shell/folderitem">FolderItem</a>*</b>
     * 
     * The FolderItem for which to create a shortcut menu.
     * @param {VARIANT} vx Type: <b>VARIANT</b>
     * 
     * Optional.
     * @param {VARIANT} vy Type: <b>VARIANT</b>
     * 
     * Optional.
     * @returns {BSTR} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a>*</b>
     * 
     * The command string.
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual-popupitemmenu
     */
    PopupItemMenu(pfi, vx, vy) {
        pbs := BSTR.Owned()
        result := ComCall(13, this, "ptr", pfi, VARIANT, vx, VARIANT, vy, BSTR.Ptr, pbs, "HRESULT")
        return pbs
    }

    /**
     * Gets the scripting object for the view.
     * @returns {IDispatch} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a>**</b>
     * 
     * The scripting object for the view. This represents the scripting automation model.
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual-get_script
     */
    get_Script() {
        result := ComCall(14, this, "ptr*", &ppDisp := 0, "HRESULT")
        return IDispatch(ppDisp)
    }

    /**
     * Gets a set of flags that indicate the current options of the view.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The set of flags that indicate the current options of the view.
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual-get_viewoptions
     */
    get_ViewOptions() {
        result := ComCall(15, this, "int*", &plViewOptions := 0, "HRESULT")
        return plViewOptions
    }

    Query(iid) {
        if (IShellFolderViewDual.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Application := CallbackCreate(GetMethod(implObj, "get_Application"), flags, 2)
        this.vtbl.get_Parent := CallbackCreate(GetMethod(implObj, "get_Parent"), flags, 2)
        this.vtbl.get_Folder := CallbackCreate(GetMethod(implObj, "get_Folder"), flags, 2)
        this.vtbl.SelectedItems := CallbackCreate(GetMethod(implObj, "SelectedItems"), flags, 2)
        this.vtbl.get_FocusedItem := CallbackCreate(GetMethod(implObj, "get_FocusedItem"), flags, 2)
        this.vtbl.SelectItem := CallbackCreate(GetMethod(implObj, "SelectItem"), flags, 3)
        this.vtbl.PopupItemMenu := CallbackCreate(GetMethod(implObj, "PopupItemMenu"), flags, 5)
        this.vtbl.get_Script := CallbackCreate(GetMethod(implObj, "get_Script"), flags, 2)
        this.vtbl.get_ViewOptions := CallbackCreate(GetMethod(implObj, "get_ViewOptions"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Application)
        CallbackFree(this.vtbl.get_Parent)
        CallbackFree(this.vtbl.get_Folder)
        CallbackFree(this.vtbl.SelectedItems)
        CallbackFree(this.vtbl.get_FocusedItem)
        CallbackFree(this.vtbl.SelectItem)
        CallbackFree(this.vtbl.PopupItemMenu)
        CallbackFree(this.vtbl.get_Script)
        CallbackFree(this.vtbl.get_ViewOptions)
    }
}
