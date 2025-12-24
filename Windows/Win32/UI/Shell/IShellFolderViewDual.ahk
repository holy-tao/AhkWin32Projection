#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include .\Folder.ahk
#Include .\FolderItems.ahk
#Include .\FolderItem.ahk
#Include ..\..\Foundation\BSTR.ahk

/**
 * Exposes methods that modify the view and select items in the current folder.
 * @see https://docs.microsoft.com/windows/win32/api//shldisp/nn-shldisp-ishellfolderviewdual
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellFolderViewDual extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellFolderViewDual
     * @type {Guid}
     */
    static IID => Guid("{e7a1af80-4d96-11cf-960c-0080c7f4ee85}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Application", "get_Parent", "get_Folder", "SelectedItems", "get_FocusedItem", "SelectItem", "PopupItemMenu", "get_Script", "get_ViewOptions"]

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
     * @see https://docs.microsoft.com/windows/win32/api//shldisp/nf-shldisp-ishellfolderviewdual-get_application
     */
    get_Application() {
        result := ComCall(7, this, "ptr*", &ppid := 0, "HRESULT")
        return IDispatch(ppid)
    }

    /**
     * Not implemented.
     * @returns {IDispatch} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a>**</b>
     * 
     * The application object.
     * @see https://docs.microsoft.com/windows/win32/api//shldisp/nf-shldisp-ishellfolderviewdual-get_parent
     */
    get_Parent() {
        result := ComCall(8, this, "ptr*", &ppid := 0, "HRESULT")
        return IDispatch(ppid)
    }

    /**
     * Gets the Folder object that represents the view.
     * @returns {Folder} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shldisp/nn-shldisp-folder">Folder</a>**</b>
     * 
     * The folder object.
     * @see https://docs.microsoft.com/windows/win32/api//shldisp/nf-shldisp-ishellfolderviewdual-get_folder
     */
    get_Folder() {
        result := ComCall(9, this, "ptr*", &ppid := 0, "HRESULT")
        return Folder(ppid)
    }

    /**
     * Gets a FolderItems object that represents all of the selected items in the view.
     * @returns {FolderItems} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shldisp/nn-shldisp-folderitems">FolderItems</a>**</b>
     * 
     * The FolderItems object.
     * @see https://docs.microsoft.com/windows/win32/api//shldisp/nf-shldisp-ishellfolderviewdual-selecteditems
     */
    SelectedItems() {
        result := ComCall(10, this, "ptr*", &ppid := 0, "HRESULT")
        return FolderItems(ppid)
    }

    /**
     * Gets the FolderItem object that represents the item that has input focus.
     * @returns {FolderItem} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shldisp/nn-shldisp-folderitem">FolderItem</a>**</b>
     * 
     * The FolderItem object with input focus.
     * @see https://docs.microsoft.com/windows/win32/api//shldisp/nf-shldisp-ishellfolderviewdual-get_focuseditem
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shldisp/nf-shldisp-ishellfolderviewdual-selectitem
     */
    SelectItem(pvfi, dwFlags) {
        result := ComCall(12, this, "ptr", pvfi, "int", dwFlags, "HRESULT")
        return result
    }

    /**
     * Creates a shortcut menu for the specified item and returns the selected command string.
     * @param {FolderItem} pfi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shldisp/nn-shldisp-folderitem">FolderItem</a>*</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//shldisp/nf-shldisp-ishellfolderviewdual-popupitemmenu
     */
    PopupItemMenu(pfi, vx, vy) {
        pbs := BSTR()
        result := ComCall(13, this, "ptr", pfi, "ptr", vx, "ptr", vy, "ptr", pbs, "HRESULT")
        return pbs
    }

    /**
     * Gets the scripting object for the view.
     * @returns {IDispatch} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a>**</b>
     * 
     * The scripting object for the view. This represents the scripting automation model.
     * @see https://docs.microsoft.com/windows/win32/api//shldisp/nf-shldisp-ishellfolderviewdual-get_script
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
     * @see https://docs.microsoft.com/windows/win32/api//shldisp/nf-shldisp-ishellfolderviewdual-get_viewoptions
     */
    get_ViewOptions() {
        result := ComCall(15, this, "int*", &plViewOptions := 0, "HRESULT")
        return plViewOptions
    }
}
