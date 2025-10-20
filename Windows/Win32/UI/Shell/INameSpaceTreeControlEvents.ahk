#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods for handling INameSpaceTreeControl events.
 * @remarks
 * 
  * This interface is implemented by a client of namespace control (CLSID_NameSpaceTreeControl) to be advised of namespace control events so that the client may process these events and if not, allow the namespace control to process them.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-inamespacetreecontrolevents
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class INameSpaceTreeControlEvents extends IUnknown{
    /**
     * The interface identifier for INameSpaceTreeControlEvents
     * @type {Guid}
     */
    static IID => Guid("{93d77985-b3d8-4484-8318-672cdda002ce}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IShellItem>} psi 
     * @param {Integer} nstceHitTest 
     * @param {Integer} nstceClickType 
     * @returns {HRESULT} 
     */
    OnItemClick(psi, nstceHitTest, nstceClickType) {
        result := ComCall(3, this, "ptr", psi, "uint", nstceHitTest, "uint", nstceClickType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItem>} psi 
     * @returns {HRESULT} 
     */
    OnPropertyItemCommit(psi) {
        result := ComCall(4, this, "ptr", psi, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItem>} psi 
     * @param {Integer} nstcisMask 
     * @param {Integer} nstcisState 
     * @returns {HRESULT} 
     */
    OnItemStateChanging(psi, nstcisMask, nstcisState) {
        result := ComCall(5, this, "ptr", psi, "uint", nstcisMask, "uint", nstcisState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItem>} psi 
     * @param {Integer} nstcisMask 
     * @param {Integer} nstcisState 
     * @returns {HRESULT} 
     */
    OnItemStateChanged(psi, nstcisMask, nstcisState) {
        result := ComCall(6, this, "ptr", psi, "uint", nstcisMask, "uint", nstcisState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItemArray>} psiaSelection 
     * @returns {HRESULT} 
     */
    OnSelectionChanged(psiaSelection) {
        result := ComCall(7, this, "ptr", psiaSelection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uMsg 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @returns {HRESULT} 
     */
    OnKeyboardInput(uMsg, wParam, lParam) {
        result := ComCall(8, this, "uint", uMsg, "ptr", wParam, "ptr", lParam, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItem>} psi 
     * @returns {HRESULT} 
     */
    OnBeforeExpand(psi) {
        result := ComCall(9, this, "ptr", psi, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItem>} psi 
     * @returns {HRESULT} 
     */
    OnAfterExpand(psi) {
        result := ComCall(10, this, "ptr", psi, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItem>} psi 
     * @returns {HRESULT} 
     */
    OnBeginLabelEdit(psi) {
        result := ComCall(11, this, "ptr", psi, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItem>} psi 
     * @returns {HRESULT} 
     */
    OnEndLabelEdit(psi) {
        result := ComCall(12, this, "ptr", psi, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItem>} psi 
     * @param {PWSTR} pszTip 
     * @param {Integer} cchTip 
     * @returns {HRESULT} 
     */
    OnGetToolTip(psi, pszTip, cchTip) {
        pszTip := pszTip is String ? StrPtr(pszTip) : pszTip

        result := ComCall(13, this, "ptr", psi, "ptr", pszTip, "int", cchTip, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItem>} psi 
     * @returns {HRESULT} 
     */
    OnBeforeItemDelete(psi) {
        result := ComCall(14, this, "ptr", psi, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItem>} psi 
     * @param {BOOL} fIsRoot 
     * @returns {HRESULT} 
     */
    OnItemAdded(psi, fIsRoot) {
        result := ComCall(15, this, "ptr", psi, "int", fIsRoot, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItem>} psi 
     * @param {BOOL} fIsRoot 
     * @returns {HRESULT} 
     */
    OnItemDeleted(psi, fIsRoot) {
        result := ComCall(16, this, "ptr", psi, "int", fIsRoot, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItem>} psi 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    OnBeforeContextMenu(psi, riid, ppv) {
        result := ComCall(17, this, "ptr", psi, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItem>} psi 
     * @param {Pointer<IContextMenu>} pcmIn 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    OnAfterContextMenu(psi, pcmIn, riid, ppv) {
        result := ComCall(18, this, "ptr", psi, "ptr", pcmIn, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItem>} psi 
     * @returns {HRESULT} 
     */
    OnBeforeStateImageChange(psi) {
        result := ComCall(19, this, "ptr", psi, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItem>} psi 
     * @param {Pointer<Int32>} piDefaultIcon 
     * @param {Pointer<Int32>} piOpenIcon 
     * @returns {HRESULT} 
     */
    OnGetDefaultIconIndex(psi, piDefaultIcon, piOpenIcon) {
        result := ComCall(20, this, "ptr", psi, "int*", piDefaultIcon, "int*", piOpenIcon, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
