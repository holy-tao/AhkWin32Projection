#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Exposes methods that modify the view and select items in the current folder.
 * @see https://docs.microsoft.com/windows/win32/api//shldisp/nn-shldisp-ishellfolderviewdual
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellFolderViewDual extends IDispatch{
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
     * 
     * @param {Pointer<IDispatch>} ppid 
     * @returns {HRESULT} 
     */
    get_Application(ppid) {
        result := ComCall(7, this, "ptr", ppid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppid 
     * @returns {HRESULT} 
     */
    get_Parent(ppid) {
        result := ComCall(8, this, "ptr", ppid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Folder>} ppid 
     * @returns {HRESULT} 
     */
    get_Folder(ppid) {
        result := ComCall(9, this, "ptr", ppid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<FolderItems>} ppid 
     * @returns {HRESULT} 
     */
    SelectedItems(ppid) {
        result := ComCall(10, this, "ptr", ppid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<FolderItem>} ppid 
     * @returns {HRESULT} 
     */
    get_FocusedItem(ppid) {
        result := ComCall(11, this, "ptr", ppid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvfi 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SelectItem(pvfi, dwFlags) {
        result := ComCall(12, this, "ptr", pvfi, "int", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<FolderItem>} pfi 
     * @param {VARIANT} vx 
     * @param {VARIANT} vy 
     * @param {Pointer<BSTR>} pbs 
     * @returns {HRESULT} 
     */
    PopupItemMenu(pfi, vx, vy, pbs) {
        result := ComCall(13, this, "ptr", pfi, "ptr", vx, "ptr", vy, "ptr", pbs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppDisp 
     * @returns {HRESULT} 
     */
    get_Script(ppDisp) {
        result := ComCall(14, this, "ptr", ppDisp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plViewOptions 
     * @returns {HRESULT} 
     */
    get_ViewOptions(plViewOptions) {
        result := ComCall(15, this, "int*", plViewOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
