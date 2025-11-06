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
     * 
     * @returns {IDispatch} 
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual-get_application
     */
    get_Application() {
        result := ComCall(7, this, "ptr*", &ppid := 0, "HRESULT")
        return IDispatch(ppid)
    }

    /**
     * 
     * @returns {IDispatch} 
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual-get_parent
     */
    get_Parent() {
        result := ComCall(8, this, "ptr*", &ppid := 0, "HRESULT")
        return IDispatch(ppid)
    }

    /**
     * 
     * @returns {Folder} 
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual-get_folder
     */
    get_Folder() {
        result := ComCall(9, this, "ptr*", &ppid := 0, "HRESULT")
        return Folder(ppid)
    }

    /**
     * 
     * @returns {FolderItems} 
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual-selecteditems
     */
    SelectedItems() {
        result := ComCall(10, this, "ptr*", &ppid := 0, "HRESULT")
        return FolderItems(ppid)
    }

    /**
     * 
     * @returns {FolderItem} 
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual-get_focuseditem
     */
    get_FocusedItem() {
        result := ComCall(11, this, "ptr*", &ppid := 0, "HRESULT")
        return FolderItem(ppid)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvfi 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual-selectitem
     */
    SelectItem(pvfi, dwFlags) {
        result := ComCall(12, this, "ptr", pvfi, "int", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {FolderItem} pfi 
     * @param {VARIANT} vx 
     * @param {VARIANT} vy 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual-popupitemmenu
     */
    PopupItemMenu(pfi, vx, vy) {
        pbs := BSTR()
        result := ComCall(13, this, "ptr", pfi, "ptr", vx, "ptr", vy, "ptr", pbs, "HRESULT")
        return pbs
    }

    /**
     * 
     * @returns {IDispatch} 
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual-get_script
     */
    get_Script() {
        result := ComCall(14, this, "ptr*", &ppDisp := 0, "HRESULT")
        return IDispatch(ppDisp)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual-get_viewoptions
     */
    get_ViewOptions() {
        result := ComCall(15, this, "int*", &plViewOptions := 0, "HRESULT")
        return plViewOptions
    }
}
