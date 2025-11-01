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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnItemClick", "OnPropertyItemCommit", "OnItemStateChanging", "OnItemStateChanged", "OnSelectionChanged", "OnKeyboardInput", "OnBeforeExpand", "OnAfterExpand", "OnBeginLabelEdit", "OnEndLabelEdit", "OnGetToolTip", "OnBeforeItemDelete", "OnItemAdded", "OnItemDeleted", "OnBeforeContextMenu", "OnAfterContextMenu", "OnBeforeStateImageChange", "OnGetDefaultIconIndex"]

    /**
     * 
     * @param {IShellItem} psi 
     * @param {Integer} nstceHitTest 
     * @param {Integer} nstceClickType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolevents-onitemclick
     */
    OnItemClick(psi, nstceHitTest, nstceClickType) {
        result := ComCall(3, this, "ptr", psi, "uint", nstceHitTest, "uint", nstceClickType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolevents-onpropertyitemcommit
     */
    OnPropertyItemCommit(psi) {
        result := ComCall(4, this, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @param {Integer} nstcisMask 
     * @param {Integer} nstcisState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolevents-onitemstatechanging
     */
    OnItemStateChanging(psi, nstcisMask, nstcisState) {
        result := ComCall(5, this, "ptr", psi, "uint", nstcisMask, "uint", nstcisState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @param {Integer} nstcisMask 
     * @param {Integer} nstcisState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolevents-onitemstatechanged
     */
    OnItemStateChanged(psi, nstcisMask, nstcisState) {
        result := ComCall(6, this, "ptr", psi, "uint", nstcisMask, "uint", nstcisState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItemArray} psiaSelection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolevents-onselectionchanged
     */
    OnSelectionChanged(psiaSelection) {
        result := ComCall(7, this, "ptr", psiaSelection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uMsg 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolevents-onkeyboardinput
     */
    OnKeyboardInput(uMsg, wParam, lParam) {
        result := ComCall(8, this, "uint", uMsg, "ptr", wParam, "ptr", lParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolevents-onbeforeexpand
     */
    OnBeforeExpand(psi) {
        result := ComCall(9, this, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolevents-onafterexpand
     */
    OnAfterExpand(psi) {
        result := ComCall(10, this, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolevents-onbeginlabeledit
     */
    OnBeginLabelEdit(psi) {
        result := ComCall(11, this, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolevents-onendlabeledit
     */
    OnEndLabelEdit(psi) {
        result := ComCall(12, this, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @param {PWSTR} pszTip 
     * @param {Integer} cchTip 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolevents-ongettooltip
     */
    OnGetToolTip(psi, pszTip, cchTip) {
        pszTip := pszTip is String ? StrPtr(pszTip) : pszTip

        result := ComCall(13, this, "ptr", psi, "ptr", pszTip, "int", cchTip, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolevents-onbeforeitemdelete
     */
    OnBeforeItemDelete(psi) {
        result := ComCall(14, this, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @param {BOOL} fIsRoot 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolevents-onitemadded
     */
    OnItemAdded(psi, fIsRoot) {
        result := ComCall(15, this, "ptr", psi, "int", fIsRoot, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @param {BOOL} fIsRoot 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolevents-onitemdeleted
     */
    OnItemDeleted(psi, fIsRoot) {
        result := ComCall(16, this, "ptr", psi, "int", fIsRoot, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolevents-onbeforecontextmenu
     */
    OnBeforeContextMenu(psi, riid, ppv) {
        result := ComCall(17, this, "ptr", psi, "ptr", riid, "ptr*", ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @param {IContextMenu} pcmIn 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolevents-onaftercontextmenu
     */
    OnAfterContextMenu(psi, pcmIn, riid, ppv) {
        result := ComCall(18, this, "ptr", psi, "ptr", pcmIn, "ptr", riid, "ptr*", ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolevents-onbeforestateimagechange
     */
    OnBeforeStateImageChange(psi) {
        result := ComCall(19, this, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @param {Pointer<Integer>} piDefaultIcon 
     * @param {Pointer<Integer>} piOpenIcon 
     * @returns {HRESULT} 
     */
    OnGetDefaultIconIndex(psi, piDefaultIcon, piOpenIcon) {
        piDefaultIconMarshal := piDefaultIcon is VarRef ? "int*" : "ptr"
        piOpenIconMarshal := piOpenIcon is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, "ptr", psi, piDefaultIconMarshal, piDefaultIcon, piOpenIconMarshal, piOpenIcon, "HRESULT")
        return result
    }
}
